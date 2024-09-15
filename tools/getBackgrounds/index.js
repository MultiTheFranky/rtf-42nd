const axios = require("axios").default;
const fs = require("fs").promises;
const sharp = require("sharp");
const { spawn } = require("node:child_process");
const Client = require("ssh2-sftp-client");
const { Jimp } = require("jimp");

if (!process.env.CDN_URL) {
    console.error("CDN_URL is not defined");
    process.exit(1);
}

const CDN_URL = process.env.CDN_URL;

function titleCase(str) {
    var splitStr = str.toLowerCase().split(" ");
    for (var i = 0; i < splitStr.length; i++) {
        // You do not need to check if i is larger than splitStr length, as your for does that for you
        // Assign it back to the array
        splitStr[i] =
            splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);
    }
    // Directly return the joined string
    return splitStr.join(" ");
}

const getBackgrounds = async (paa) => {
    const { data } = await axios.get(CDN_URL);
    if (paa) {
        const files = data
            .split("<pre>")[1]
            .split("</pre>")[0]
            .split("\n")
            .filter((file) => file.includes(".paa"))
            .map((file) => file.split(">")[1].split("<")[0]);
        const backgroundFiles = files.filter(
            (file) => file.endsWith(".paa") && file.startsWith("background")
        );
        return backgroundFiles;
    } else {
        const files = data
            .split("<pre>")[1]
            .split("</pre>")[0]
            .split("\n")
            .filter((file) => file.includes(".png") || file.includes(".jpg"))
            .map((file) => file.split(">")[1].split("<")[0]);
        const backgroundFiles = files.filter(
            (file) =>
                (file.endsWith(".png") || file.endsWith(".jpg")) &&
                file.startsWith("background")
        );
        return backgroundFiles;
    }
};

const convertToPNG = async (imgBuffer) => {
    const image = await Jimp.read(imgBuffer);
    const data = await image.getBuffer("image/png");
    return data;
};

const downloadBackgrounds = async (backgroundFiles, convert) => {
    const promises = backgroundFiles.map(async (file) => {
        let { data } = await axios.get(`${CDN_URL}/${file}`, {
            responseType: "arraybuffer",
        });
        try {
            if (convert) {
                if (file.endsWith(".jpg")) {
                    data = await convertToPNG(data);
                }
                const image = sharp(data);
                image.resize(2048, 1024);
                data = await image.toBuffer();
            }
            // The file names are background-<name>-<author>.paa

            const name = file.split("-")[1];
            const author = titleCase(file.split("-")[2].split(".")[0]);
            const prettyName = titleCase(name.replace(/_/g, " "));
            return {
                name,
                author,
                data,
                prettyName,
                width: 2048,
                height: 1024,
            };
        } catch (error) {
            console.error(`Error with ${file}`);
            console.error(error);
        }
    });

    const backgrounds = await Promise.all(promises);
    return backgrounds;
};

const writeBackground = async (background, paa) => {
    // Check if background folder exists, if not create it
    await fs.mkdir("../../addons/ui/data/backgrounds", { recursive: true });
    const promises = background.map(async (file) => {
        if (paa) {
            return await fs.writeFile(
                `../../addons/ui/data/backgrounds/${file.name}.paa`,
                file.data
            );
        } else {
            return await fs.writeFile(
                `../../addons/ui/data/backgrounds/${file.name}.png`,
                file.data
            );
        }
    });

    await Promise.all(promises);
};

// Write the configuration on Backgrounds.hpp
// The format is:
// class GVAR(Backgrounds) {
//     class GVAR(<name>) {
//         name = QUOTE(<name>);
//         path = QPATHTOF(data\<name>.paa);
//         author = QUOTE(<author>);
//         width = <width>;
//         height = <height>;
//     };
// };

const writeConfig = async (background) => {
    const config = `class GVAR(Backgrounds) {\n`
        .concat(
            background
                .map(
                    (file) =>
                        `   class GVAR(${file.name}) {
        name = QUOTE(${file.prettyName});
        path = QPATHTOF(data\\backgrounds\\${file.name}.paa);
        author = QUOTE(${file.author});
        width = ${file.width};
        height = ${file.height};
    };\n`
                )
                .join("\n")
        )
        .concat("};");

    await fs.writeFile("../../addons/ui/Backgrounds.hpp", config);
};

// Params:
// - onlyDownload: Only download the backgrounds

const onlyDownload = process.argv.includes("--onlyDownload");

const main = async () => {
    if (onlyDownload) {
        // Download the paa backgrounds only and write the config
        const background = await downloadBackgrounds(
            await getBackgrounds(true),
            false
        );
        await writeBackground(background, true);
        await writeConfig(background);
        console.log("Finished downloading backgrounds");
    } else {
        // Download the png backgrounds, convert them to paa, write the config and upload the paa files to the CDN
        const background = await downloadBackgrounds(
            await getBackgrounds(false)
        );
        await writeBackground(background);
        await writeConfig(background);
        // Execute the script to generate the PAA files using child process
        // C:\arma3tools\ImageToPAA\ImageToPAA.exe <background>
        const promises = [];
        for (const file of background) {
            promises.push(
                new Promise((resolve, reject) => {
                    const child = spawn(
                        "C:\\arma3tools\\ImageToPAA\\ImageToPAA.exe",
                        [`../../addons/ui/data/backgrounds/${file.name}.png`]
                    );
                    child.stdout.on("data", (data) => {
                        console.log(`${data}`);
                    });

                    child.stderr.on("data", (data) => {
                        console.error(`Error: ${data}`);
                        reject();
                    });

                    child.on("error", (error) => {
                        console.error(`Error: ${error}`);
                        reject();
                    });

                    child.on("close", () => {
                        // Remove the PNG file
                        fs.unlink(
                            `../../addons/ui/data/backgrounds/${file.name}.png`
                        );
                        resolve();
                    });
                })
            );
        }
        await Promise.all(promises);

        // Upload the PAA files to the CDN
        const sftp = new Client();
        if (!process.env.CDN_HOST) {
            console.error("CDN_HOST is not defined");
            process.exit(1);
        }
        if (!process.env.CDN_PORT) {
            console.error("CDN_PORT is not defined");
            process.exit(1);
        }
        if (!process.env.CDN_USER) {
            console.error("CDN_USER is not defined");
            process.exit(1);
        }
        if (!process.env.CDN_PASSWORD) {
            console.error("CDN_PASSWORD is not defined");
            process.exit(1);
        }
        try {
            await sftp.connect({
                host: process.env.CDN_HOST,
                port: process.env.CDN_PORT,
                username: process.env.CDN_USER,
                password: process.env.CDN_PASSWORD,
            });

            for (const file of background) {
                await sftp.fastPut(
                    `../../addons/ui/data/backgrounds/${file.name}.paa`,
                    `/root/cdn/src/background-${file.name}-${file.author}.paa`
                );
                console.log(`Uploaded ${file.name}.paa`);
            }
            await sftp.end();
            console.log("Finished uploading");
        } catch (error) {
            console.error(error);
        }
    }
};

main();
