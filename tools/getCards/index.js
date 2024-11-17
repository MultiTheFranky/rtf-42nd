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

const getCards = async (paa) => {
    const { data } = await axios.get(CDN_URL);
    if (paa) {
        const files = data
            .split("<pre>")[1]
            .split("</pre>")[0]
            .split("\n")
            .filter((file) => file.includes(".paa"))
            .map((file) => file.split(">")[1].split("<")[0]);
        const cardFiles = files.filter(
            (file) => file.endsWith(".paa") && file.startsWith("card")
        );
        return cardFiles;
    } else {
        const files = data
            .split("<pre>")[1]
            .split("</pre>")[0]
            .split("\n")
            .filter((file) => file.includes(".png") || file.includes(".jpg"))
            .map((file) => file.split(">")[1].split("<")[0]);
        const cardFiles = files.filter(
            (file) =>
                (file.endsWith(".png") || file.endsWith(".jpg")) &&
                file.startsWith("card")
        );
        return cardFiles;
    }
};

const convertToPNG = async (imgBuffer) => {
    const image = await Jimp.read(imgBuffer);
    const data = await image.getBuffer("image/png");
    return data;
};

const downloadCards = async (cardFiles, convert) => {
    const promises = cardFiles.map(async (file) => {
        let { data } = await axios.get(`${CDN_URL}/${file}`, {
            responseType: "arraybuffer",
        });
        try {
            if (convert) {
                if (file.endsWith(".jpg")) {
                    data = await convertToPNG(data);
                }
                const image = sharp(data);
                image.resize(512, 1024, {
                    fit: "contain",
                    background: { r: 0, g: 0, b: 0, alpha: 0 },
                });
                data = await image.toBuffer();
            }
            // The file names are card-<name>.paa

            const name = file.split("-")[1].split(".")[0];
            const prettyName = titleCase(name.replace(/_/g, " "));
            return {
                name,
                data,
                prettyName,
                width: 512,
                height: 1024,
            };
        } catch (error) {
            console.error(`Error with ${file}`);
            console.error(error);
        }
    });

    const cards = await Promise.all(promises);
    return cards;
};

const writeCard = async (card, paa) => {
    // Check if card folder exists, if not create it
    await fs.mkdir("../../addons/ui/data/cards", { recursive: true });
    const promises = card.map(async (file) => {
        if (paa) {
            return await fs.writeFile(
                `../../addons/ui/data/cards/${file.name}.paa`,
                file.data
            );
        } else {
            return await fs.writeFile(
                `../../addons/ui/data/cards/${file.name}.png`,
                file.data
            );
        }
    });

    await Promise.all(promises);
};

// Write the configuration on Cards.hpp
// The format is:
// class GVAR(Cards) {
//     class GVAR(<name>) {
//         name = QUOTE(<name>);
//         path = QPATHTOF(data\<name>.paa);
//         author = QUOTE(<author>);
//         width = <width>;
//         height = <height>;
//     };
// };

const writeConfig = async (card) => {
    const config = `class GVAR(Cards) {\n`
        .concat(
            card
                .map(
                    (file) =>
                        `   class GVAR(${file.name}) {
        name = QUOTE(${file.prettyName});
        path = QPATHTOF(data\\cards\\${file.name}.paa);
        author = QUOTE(42nd RTF);
        width = ${file.width};
        height = ${file.height};
    };\n`
                )
                .join("\n")
        )
        .concat("};");

    await fs.writeFile("../../addons/ui/Cards.hpp", config);
};

// Params:
// - onlyDownload: Only download the cards

const onlyDownload = process.argv.includes("--onlyDownload");

const main = async () => {
    if (onlyDownload) {
        // Download the paa cards only and write the config
        const card = await downloadCards(await getCards(true), false);
        await writeCard(card, true);
        await writeConfig(card);
        console.log("Finished downloading cards");
    } else {
        // Download the png cards, convert them to paa, write the config and upload the paa files to the CDN
        const card = await downloadCards(await getCards(false), true);
        await writeCard(card);
        await writeConfig(card);
        // Execute the script to generate the PAA files using child process
        // C:\arma3tools\ImageToPAA\ImageToPAA.exe <card>
        const promises = [];
        for (const file of card) {
            promises.push(
                new Promise((resolve, reject) => {
                    const child = spawn(
                        "C:\\arma3tools\\ImageToPAA\\ImageToPAA.exe",
                        [`../../addons/ui/data/cards/${file.name}.png`]
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
                            `../../addons/ui/data/cards/${file.name}.png`
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

            for (const file of card) {
                await sftp.fastPut(
                    `../../addons/ui/data/cards/${file.name}.paa`,
                    `/root/cdn/src/card-${file.name}.paa`
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
