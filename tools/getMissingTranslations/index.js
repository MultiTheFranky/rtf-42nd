const axios = require("axios").default;
const { statSync } = require("fs");
const { readdir, readFile } = require("fs/promises");

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
                en: key.translations.en.text,
                "es-ES": key.translations["es-ES"].text,
            },
        };
    }
    return result;
};

const mapTranslationsToFlat = (translations) => {
    const result = [];
    for (const key of translations) {
        result.push(`STR_RTF42_${key.keyNamespace}_${key.keyName}`);
    }
    return result;
};

const getAllTranslationsOnFiles = async () => {
    // Get all files under addons folder
    const files = await readdir("../../addons", { recursive: true });

    // Find all LSTRING keys in the files in format:
    // addons/module: []
    const lstrings = [];
    for (const file of files) {
        // Continue on folders
        if (statSync(`../../addons/${file}`).isDirectory()) continue;
        const content = await readFile(`../../addons/${file}`, "utf8");
        // If the file contains LSTRING or CSTRING or LLSTRING
        let matches = content.match(/(LSTRING|CSTRING|LLSTRING)\(.*?\)/g);
        if (matches) {
            const key = file.split("\\")[0];
            const clearMatches = new Set(
                matches
                    .map(
                        (match) =>
                            // Get the text inside the parenthesis
                            match.match(/\(([^)]+)\)/)[1]
                    )
                    .filter((match) => match !== "var" && !match.includes(","))
                    .map(
                        (match) =>
                            `STR_RTF42_${
                                key.charAt(0).toUpperCase() + key.slice(1)
                            }_${match}`
                    )
            );
            // Push
            lstrings.push(...clearMatches);
        }
    }
    return new Set(lstrings);
};

/**
 * Main function.
 */

(async () => {
    const translations = mapTranslationsToFlat(await getAllTranslations());
    const files = await getAllTranslationsOnFiles();
    const missing = [...files].filter((file) => !translations.includes(file));
    console.log("Missing translations:");
    console.log(missing);
})();
