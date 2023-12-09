const axios = require('axios').default;

if (!process.env.TOLGEE_URL) {
    throw new Error('TOLGEE_URL is not set');
}

if (!process.env.TOLGEE_API_KEY) {
    throw new Error('TOLGEE_API_KEY is not set');
}

const locales = new Map([
    ['en', 'English'],
    ['es-ES', 'Spanish']
]);

/**
 * Retrieves all translations from the server.
 * @returns {Promise<Object>} The response data containing the translations.
 */
const getAllTranslations = async () => {
    const locales = [];
    for (const [key, value] of locales.entries()) {
        locales.push(key);
    }

    const response = await axios.get(`${process.env.TOLGEE_URL}/v2/projects/translations?${locales.map(locale => `locales=${locale}`).join('&')}`, {
        headers: {
            'X-API-Key': process.env.TOLGEE_API_KEY
        }
    })
    return response.data;
};

/**
 * Map Tolgee translations to a simple object
 * @param {*} translations 
 */

const mapTranslations = (translations) => {
    const result = {};
    for (const key of translations._embedded.keys) {
        result[key.keyNamespace] = {
            ...result[key.keyNamespace],
            [key.keyName]: {
                en: key.translations.en.text,
                'es-ES': key.translations['es-ES'].text
            }
        }
    }
    return result;
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
                xml.push(`        <Key ID="STR_RTF42_${keyNamespace}_${keyName}">`);
                for (const locale in translations[keyNamespace][keyName]) {
                    xml.push(`            <${locales.get(locale)}>${translations[keyNamespace][keyName][locale]}</${locales.get(locale)}>`);
                }
                xml.push('        </Key>');
            }
            xml.push('    </Package>');
        }
        xml.push('</Project>');
        totalXML.set(keyNamespaceTop.toLowerCase(), xml.join('\n'));
    }
    return totalXML;
}


/**
 * Writes the translations to stringtable.xml files.
 * @param {Map<string, string>} translations - The translations to write.
 */
const writeStringtable = (translations) => {
    const fs = require('fs');
    console.log(translations.entries())
    for (const [key, value] of translations.entries()) {
        fs.writeFileSync(`../../addons/${key}/stringtable.xml`, value);
    }
}

/**
 * Main function.
 */

(async () => {
    writeStringtable(getXMLFromMap(mapTranslations(await getAllTranslations())));
})();