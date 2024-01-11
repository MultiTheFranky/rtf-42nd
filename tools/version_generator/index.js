/**
 * This scripts will modify the version of addons/main/script_version.hpp file to a new version.
 * The format of the version is: vyear.month.minor-rc.x
 * The format of the version on the script_version.hpp file is:
 * #define MAJOR year
 * #define MINOR month
 * #define PATCHLVL patch
 * #define BUILD beta ? beta : 0
 *
 */

const fs = require('fs');
const path = require('path');

function writeAddonsReleaseVersion(year, month, minor, beta) {
    const versionPath = path.join(__dirname, '..', '..', 'addons', 'main', 'script_version.hpp');
    const version = fs.readFileSync(versionPath, 'utf8');

    const newVersion = version
        .replace(/#define MAJOR (.*)/, `#define MAJOR ${year}`)
        .replace(/#define MINOR (.*)/, `#define MINOR ${month}`)
        .replace(/#define PATCHLVL (.*)/, `#define PATCHLVL ${minor}`)
        .replace(/#define BUILD (.*)/, `#define BUILD ${beta ? beta : '0'}`);

    fs.writeFileSync(versionPath, newVersion);
}

function generateNewVersion(beta = false) {
    // Use the script_version.hpp file to get the current version
    const versionPath = path.join(__dirname, '..', '..', 'addons', 'main', 'script_version.hpp');
    const version = fs.readFileSync(versionPath, 'utf8');

    const versionYear = new Date().getFullYear();
    const versionMonth = new Date().getMonth() + 1;

    const versionParts = version.match(/#define MAJOR (.*)\n#define MINOR (.*)\n#define PATCHLVL (.*)\n#define BUILD (.*)/);
    const versionMinor = versionParts[3];

    // If is beta, increase the build version
    if (beta) {
        const versionBetaMinor = versionParts[4];
        return {
            version: `v${versionYear}.${versionMonth}.${parseInt(versionMinor)}-rc.${parseInt(versionBetaMinor) + 1}`,
            versionYear,
            versionMonth,
            versionMinor,
            versionBetaMinor: parseInt(versionBetaMinor) + 1,
        };
    }

    // If is not beta, increase the patch level
    return {
        version: `v${versionYear}.${versionMonth}.${parseInt(versionMinor) + 1}`,
        versionYear,
        versionMonth,
        versionMinor,
    };
}

// Get arguments
const beta = process.argv.includes('--beta');

// Generate new version
const newVersion = generateNewVersion(beta);

// Write new version
writeAddonsReleaseVersion(newVersion.versionYear, newVersion.versionMonth, newVersion.versionMinor, beta ? newVersion.versionBetaMinor : null);

// Return version to be use on github actions
console.log(newVersion.version);
