const axios = require("axios").default;
const fs = require("fs").promises;

if (!process.env.CDN_URL) {
    console.error("CDN_URL is not defined");
    process.exit(1);
}

// The CDN has a list of all the music files from the root (autoindex of nginx)
// All the files are on the root of the CDN
// We filter the files to only get the .ogg files
// Example of data:
/**
 * <html>
    <head><title>Index of /</title></head>
    <body>
    <h1>Index of /</h1><hr><pre><a href="../">../</a>
    <a href="warrior_song-57s.ogg">warrior_song-57s.ogg</a>                               26-Jan-2024 16:43              916743
    </pre><hr></body>
    </html>
 */
const CDN_URL = process.env.CDN_URL;

const getMusic = async () => {
    const { data } = await axios.get(CDN_URL);
    const files = data
        .split("<pre>")[1]
        .split("</pre>")[0]
        .split("\n")
        .filter((file) => file.includes(".ogg"))
        .map((file) => file.split(">")[1].split("<")[0]);

    const musicFiles = files.filter((file) => file.endsWith(".ogg"));

    return musicFiles;
};

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

const downloadMusic = async (musicFiles) => {
    const promises = musicFiles.map(async (file) => {
        const { data } = await axios.get(`${CDN_URL}/${file}`, {
            responseType: "arraybuffer",
        });
        // The file names are <name>-<length>s.ogg
        // We remove the length from the name
        try {
            const name = file.split("-")[0];
            const length = file.split("-")[1].split("s")[0];
            const prettyName = titleCase(name.replace(/_/g, " "));
            return { name: name, length, data, prettyName };
        } catch (error) {
            console.error(`Error with ${file}`);
            console.error(error);
            return { name: file, length: 0, data, prettyName: file };
        }
    });

    const music = await Promise.all(promises);
    return music;
};

const writeMusic = async (music) => {
    const promises = music.map(async (file) => {
        await fs.writeFile(
            `../../addons/music/data/${file.name}.ogg`,
            file.data
        );
    });

    await Promise.all(promises);
};

// Write the configuration on CfgMusic.hpp
// The format is:
// class CfgMusic {
//     tracks[] = {};
//     class GVAR(<name>) {
//         name = QUOTE(<name>);
//         sound[] = {QPATHTOF(data/<name>.ogg), 1, 1};
//         duration = <length>;
//         mussicClass = QGVAR(musicClass);
//     };
// };

const writeConfig = async (music) => {
    const config = `class CfgMusic {
    tracks[] = {};
    ${music
        .map(
            (file) => `class GVAR(${file.name}) {
        name = QUOTE(${file.prettyName});
        sound[] = {QPATHTOF(data\\${file.name}.ogg), 1, 1};
        duration = ${file.length};
        musicClass = QGVAR(musicClass);
    };`
        )
        .join("\n")}
};`;

    await fs.writeFile("../../addons/music/CfgMusic.hpp", config);
};

const writeCfgSounds = async (music) => {
    const config = `class CfgSounds {
    sounds[] = {};
    ${music
        .map(
            (file) => `class GVAR(${file.name}) {
        name = QUOTE(${file.prettyName});
        sound[] = {QPATHTOF(data\\${file.name}.ogg), 1, 1, 100};
        titles[] = {};
    };`
        )
        .join("\n")}
};`;

    await fs.writeFile("../../addons/music/CfgSounds.hpp", config);
};

const writeSounds3D = async (music) => {
    const data = music
        .map(
            (file) =>
                `class ${file.name} {
    name = "${file.prettyName}";
    value = QEGVAR(music,${file.name});
};`
        )
        .join("\n");
    await fs.writeFile("../../addons/music/Sounds3D.hpp", data);
};

const writeRadioMusic = async (music) => {
    const data = music
        .map(
            (file) =>
                `class ${file.name} {
    name = "${file.prettyName}";
    value = QEGVAR(music,${file.name});
};`
        )
        .join("\n");
    await fs.writeFile("../../addons/music/RadioMusic.hpp", data);
};

const main = async () => {
    const music = await downloadMusic(await getMusic());
    await writeMusic(music);
    await writeConfig(music);
    await writeSounds3D(music);
    await writeRadioMusic(
        music.filter((file) => file.name.startsWith("radio"))
    );
    await writeCfgSounds(music);
};

main();
