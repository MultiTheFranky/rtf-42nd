const axios = require("axios").default;
const fs = require("fs").promises;
const sharp = require("sharp");
const { spawn } = require("node:child_process");

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

const getBackgrounds = async () => {
    const { data } = await axios.get(CDN_URL);
    const files = data
        .split("<pre>")[1]
        .split("</pre>")[0]
        .split("\n")
        .filter((file) => file.includes(".png"))
        .map((file) => file.split(">")[1].split("<")[0]);
    const backgroundFiles = files.filter(
        (file) => file.endsWith(".png") && file.startsWith("background")
    );
    return backgroundFiles;
};

const downloadBackgrounds = async (backgroundFiles) => {
    const promises = backgroundFiles.map(async (file) => {
        const { data } = await axios.get(`${CDN_URL}/${file}`, {
            responseType: "arraybuffer",
        });
        try {
            const image = sharp(data);
            image.resize(2048, 1024);
            const dataToWrite = await image.toBuffer();
            // The file names are background-<name>-<author>.paa

            const name = file.split("-")[1];
            const author = titleCase(file.split("-")[2].split(".")[0]);
            const prettyName = titleCase(name.replace(/_/g, " "));
            return {
                name,
                author,
                data: dataToWrite,
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

const writeBackground = async (background) => {
    // Check if background folder exists, if not create it
    await fs.mkdir("../../addons/ui/data/backgrounds", { recursive: true });
    const promises = background.map(async (file) => {
        await fs.writeFile(
            `../../addons/ui/data/backgrounds/${file.name}.png`,
            file.data
        );
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

const main = async () => {
    const background = await downloadBackgrounds(await getBackgrounds());
    await writeBackground(background);
    await writeConfig(background);
    // Execute the script to generate the PAA files using child process
    // C:\arma3tools\ImageToPAA\ImageToPAA.exe <background>
    for (const file of background) {
        const child = spawn("C:\\arma3tools\\ImageToPAA\\ImageToPAA.exe", [
            `../../addons/ui/data/backgrounds/${file.name}.png`,
        ]);
        child.stdout.on("data", (data) => {
            console.log(`${data}`);
        });

        child.stderr.on("data", (data) => {
            console.error(`Error: ${data}`);
        });

        child.on("error", (error) => {
            console.error(`Error: ${error}`);
        });

        child.on("close", () => {
            // Remove the PNG file
            fs.unlink(`../../addons/ui/data/backgrounds/${file.name}.png`);
        });
    }
};

main();
