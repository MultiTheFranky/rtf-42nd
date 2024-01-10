/**
 * This scripts will modify the version of the .hemtt/project.toml file and the addons/main/script_version.hpp file to a new version.
 * It will also create a new commit and tag it with the new version.
 * The format of the verion is: vyear.month.minor-rc.x
 * The format of the version on the script_version.hpp file is:
 * #define MAJOR year
 * #define MINOR month
 * #define PATCHLVL minor
 * #define BUILD beta ? rc.x : 0
 *
 */

const fs = require('fs');
const path = require('path');

function writeAddonsReleaseVersion(year, month, minor, beta) {
    const releasePath = path.join(__dirname, '..', '..', 'addons', 'main', 'script_version.hpp');
    const release = fs.readFileSync(releasePath, 'utf8');

    const newRelease = release
        .replace(/#define MAJOR (.*)/, `#define MAJOR ${year}`)
        .replace(/#define MINOR (.*)/, `#define MINOR ${month}`)
        .replace(/#define PATCHLVL (.*)/, `#define PATCHLVL ${minor}`)
        .replace(/#define BUILD (.*)/, `#define BUILD ${beta ? beta : '0'}`);

    fs.writeFileSync(releasePath, newRelease);
}

function writeProjectTomlVersion(year, month, minor, beta) {
    const projectTomlPath = path.join(__dirname, '..', '..', '.hemtt', 'project.toml');
    const projectToml = fs.readFileSync(projectTomlPath, 'utf8');

    const newProjectToml = projectToml
        .replace(/version = "(.*)"/, `version = "v${year}.${month}.${minor}${beta ? `-${beta}` : ''}"`);

    fs.writeFileSync(projectTomlPath, newProjectToml);
}

function generateNewVersion(beta = false) {
    const projectTomlPath = path.join(__dirname, '..', '..', '.hemtt', 'project.toml');
    const projectToml = fs.readFileSync(projectTomlPath, 'utf8');

    const version = projectToml.match(/version = "(.*)"/)[1];
    const versionParts = version.split('.');
    const versionYear = new Date().getFullYear();
    const versionMonth = new Date().getMonth() + 1;
    const versionMinor = versionParts[2].split('-')[0];

    if (beta) {
        if (!versionParts[3]) {
            return {
                version: `v${versionYear}.${versionMonth}.${parseInt(versionMinor) + 1}-rc.0`,
                versionYear,
                versionMonth,
                versionMinor,
                versionBetaMinor: 1,
            };
        }
        const versionBetaMinor = versionParts[3];
        return {
            version: `v${versionYear}.${versionMonth}.${parseInt(versionMinor)}-rc.${parseInt(versionBetaMinor) + 1}`,
            versionYear,
            versionMonth,
            versionMinor,
            versionBetaMinor: parseInt(versionBetaMinor) + 1,
        };
    }

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
writeProjectTomlVersion(newVersion.versionYear, newVersion.versionMonth, newVersion.versionMinor, beta ? `rc.${newVersion.versionBetaMinor}` : null);

// Return version to be use on github actions
console.log(newVersion.version);
