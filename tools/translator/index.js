const axios = require("axios").default;

if (!process.env.TOLGEE_URL) {
    throw new Error("TOLGEE_URL is not set");
}

if (!process.env.TOLGEE_API_KEY) {
    throw new Error("TOLGEE_API_KEY is not set");
}

const locales = new Map([
    ["en", "English"],
    ["es-ES", "Spanish"],
]);

/**
 * Retrieves all translations from the server.
 * @returns {Promise<Object>} The response data containing the translations.
 */
const getAllTranslations = async () => {
    const locales = [];
    const data = [];
    const size = 20;
    for (const [key, value] of locales.entries()) {
        locales.push(key);
    }

    // Loop until we get all translations of all pages
    let lastPage = 0;

    while (true) {
        const response = await axios.get(
            `${process.env.TOLGEE_URL}/v2/projects/translations?${locales
                .map((locale) => `locales=${locale}`)
                .join("&")}&size=${size}&page=${lastPage}&sort=desc`,
            {
                headers: {
                    "X-API-Key": process.env.TOLGEE_API_KEY,
                },
            }
        );
        const responseData = response.data;
        if (!responseData._embedded) break;
        lastPage++;
        data.push(...responseData._embedded.keys);
    }

    console.log(`Retrieved ${data.length} translations`);

    return data;
};

/**
 * Map Tolgee translations to a simple object
 * @param {*} translations
 */

const mapTranslations = (translations) => {
    const result = {};
    for (const key of translations) {
        result[key.keyNamespace] = {
            ...result[key.keyNamespace],
            [key.keyName]: {
                en: key.translations.en.text.trim(),
                "es-ES": key.translations["es-ES"].text.trim(),
            },
        };
    }
    // Order translations by keyName and keyNamespace
    return orderTranslations(result);
};

const orderTranslations = (translations) => {
    const ordered = {};
    for (const keyNamespace in translations) {
        ordered[keyNamespace] = {};
        Object.keys(translations[keyNamespace])
            .sort()
            .forEach((keyName) => {
                ordered[keyNamespace][keyName] =
                    translations[keyNamespace][keyName];
            });
    }
    return Object.keys(ordered)
        .sort()
        .reduce((acc, key) => {
            acc[key] = ordered[key];
            return acc;
        }, {});
};

/**
 * Get XML from a map of translations with this format:
 * @param {*} translations
 */

const getXMLFromMap = (translations) => {
    const totalXML = new Map();
    for (const keyNamespaceTop in translations) {
        const xml = [];
        xml.push('<?xml version="1.0" encoding="utf-8"?>');
        xml.push('<Project name="RTF42">');
        for (const keyNamespace in translations) {
            if (keyNamespace !== keyNamespaceTop) continue;
            xml.push(`    <Package name="${keyNamespace}">`);
            for (const keyName in translations[keyNamespace]) {
                xml.push(
                    `        <Key ID="STR_RTF42_${keyNamespace}_${keyName}">`
                );
                for (const locale in translations[keyNamespace][keyName]) {
                    xml.push(
                        `            <${locales.get(locale)}>${
                            translations[keyNamespace][keyName][locale]
                        }</${locales.get(locale)}>`
                    );
                }
                xml.push("        </Key>");
            }
            xml.push("    </Package>");
        }
        xml.push("</Project>");
        xml.push("");
        totalXML.set(keyNamespaceTop.toLowerCase(), xml.join("\n"));
    }
    return totalXML;
};

/**
 * Writes the translations to stringtable.xml files.
 * @param {Map<string, string>} translations - The translations to write.
 */
const writeStringtable = (translations) => {
    const fs = require("fs");
    for (const [key, value] of translations.entries()) {
        try {
            fs.writeFileSync(`../../addons/${key}/stringtable.xml`, value);
        } catch (error) {}
    }
};

/**
 * Main function.
 */

(async () => {
    writeStringtable(
        getXMLFromMap(mapTranslations(await getAllTranslations()))
    );
})();
