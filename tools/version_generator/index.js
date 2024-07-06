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

const fs = require("fs");
const path = require("path");

function writeAddonsReleaseVersion(year, month, minor, beta) {
    const versionPath = path.join(
        __dirname,
        "..",
        "..",
        "addons",
        "main",
        "script_version.hpp"
    );
    const version = fs.readFileSync(versionPath, "utf8");

    const newVersion = version
        .replace(/#define MAJOR (.*)/, `#define MAJOR ${year}`)
        .replace(/#define MINOR (.*)/, `#define MINOR ${month}`)
        .replace(/#define PATCHLVL (.*)/, `#define PATCHLVL ${minor}`)
        .replace(/#define BUILD (.*)/, `#define BUILD ${beta ? beta : "0"}`);

    fs.writeFileSync(versionPath, newVersion);
}

function generateNewVersion(beta = false) {
    // Use the script_version.hpp file to get the current version
    const versionPath = path.join(
        __dirname,
        "..",
        "..",
        "addons",
        "main",
        "script_version.hpp"
    );
    const version = fs.readFileSync(versionPath, "utf8");

    const versionYear = new Date().getFullYear();
    const versionMonth = new Date().getMonth() + 1;

    const versionParts = version.match(
        /#define MAJOR (.*)\r\n#define MINOR (.*)\r\n#define PATCHLVL (.*)\r\n#define BUILD (.*)/
    );
    const versionMinor = versionParts[2];
    let versionPatch = versionParts[3];
    let versionBetaMinor = versionParts[4];

    if (versionMonth !== parseInt(versionMinor)) {
        versionPatch = 0;
        versionBetaMinor = 0;
        if (beta) {
            return {
                version: `v${versionYear}.${versionMonth}.${parseInt(
                    versionPatch
                )}-rc.${parseInt(versionBetaMinor)}`,
                versionYear,
                versionMonth,
                versionPatch,
                versionBetaMinor: parseInt(versionBetaMinor),
            };
        }
        return {
            version: `v${versionYear}.${versionMonth}.${versionPatch}`,
            versionYear,
            versionMonth,
            versionPatch,
        };
    }

    // If is beta, increase the build version
    if (beta) {
        // If the beta is after a release, reset the beta minor
        if (parseInt(versionBetaMinor) === 0) {
            return {
                version: `v${versionYear}.${versionMonth}.${
                    parseInt(versionPatch) + 1
                }-rc.1`,
                versionYear,
                versionMonth,
                versionPatch: parseInt(versionPatch) + 1,
                versionBetaMinor: 1,
            };
        }
        return {
            version: `v${versionYear}.${versionMonth}.${parseInt(
                versionPatch
            )}-rc.${parseInt(versionBetaMinor) + 1}`,
            versionYear,
            versionMonth,
            versionPatch: parseInt(versionPatch),
            versionBetaMinor: parseInt(versionBetaMinor) + 1,
        };
    }

    // If is not beta, return the actual version without beta minor
    if (parseInt(versionBetaMinor) === 0) {
        return {
            version: `v${versionYear}.${versionMonth}.${parseInt(
                versionPatch
            )}`,
            versionYear,
            versionMonth,
            versionPatch: parseInt(versionPatch),
        };
    }
    return {
        version: `v${versionYear}.${versionMonth}.${parseInt(versionPatch)}`,
        versionYear,
        versionMonth,
        versionPatch: parseInt(versionPatch),
    };
}

// Get arguments
const beta = process.argv.includes("--beta");

// Generate new version
const newVersion = generateNewVersion(beta);

// Write new version
writeAddonsReleaseVersion(
    newVersion.versionYear,
    newVersion.versionMonth,
    newVersion.versionPatch,
    beta ? newVersion.versionBetaMinor : null
);

// Return version to be use on github actions
console.log(newVersion.version);
