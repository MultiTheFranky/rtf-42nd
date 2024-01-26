const axios = require("axios").default;
const fs = require("fs").promises;

if (!process.env.CDN_URL) {
    console.error("CDN_URL is not defined");
    process.exit(1);
}

// The CDN has a list of all the videos files from the root (autoindex of nginx)
// All the files are on the root of the CDN
// We filter the files to only get the .ogv files
// Example of data:
/**
 * <html>
    <head><title>Index of /</title></head>
    <body>
    <h1>Index of /</h1><hr><pre><a href="../">../</a>
    <a href="warrior_video.ogv">warrior_video.ogv</a>                               26-Jan-2024 16:43              916743
    </pre><hr></body>
    </html>
 */
const CDN_URL = process.env.CDN_URL;

const getVideo = async () => {
    const { data } = await axios.get(CDN_URL);
    const files = data
        .split("<pre>")[1]
        .split("</pre>")[0]
        .split("\n")
        .filter((file) => file.includes(".ogv"))
        .map((file) => file.split(">")[1].split("<")[0]);

    const videoFiles = files.filter((file) => file.endsWith(".ogv"));

    return videoFiles;
};

function titleCase(str) {
    var splitStr = str.toLowerCase().split(' ');
    for (var i = 0; i < splitStr.length; i++) {
        // You do not need to check if i is larger than splitStr length, as your for does that for you
        // Assign it back to the array
        splitStr[i] = splitStr[i].charAt(0).toUpperCase() + splitStr[i].substring(1);
    }
    // Directly return the joined string
    return splitStr.join(' ');
 }

const downloadVideo = async (videoFiles) => {
    const promises = videoFiles.map(async (file) => {
        const { data } = await axios.get(`${CDN_URL}/${file}`, {
            responseType: "arraybuffer",
        });
        // The file names are <name>-<length>s.ogv
        // We remove the length from the name
        try {
            const name = file.split("-")[0];
            const length = file.split("-")[1].split("s")[0];
            const prettyName = titleCase(name.replace(/_/g, " "));
            return { name: name, length, data, prettyName };
        } catch (error) {
            console.error(`Error with ${file}`);
            console.error(error);
            return { name: file, length: 0, data, prettyName: file};
        }
    });

    const videos = await Promise.all(promises);
    return videos;
};



const writeVideos = async (videos) => {
    const promises = videos.map(async (file) => {
        await fs.writeFile(
            `../../addons/videos/data/${file.name}.ogv`,
            file.data
        );
    });

    await Promise.all(promises);
};

// Write the configuration on CfgVideos.hpp
// The format is:
// class CfgVideos {
//     class GVAR(<name>) {
//         name = QUOTE(<name>);
//         file = QPATHTOF(data/<name>.ogv);
//         duration = <length>;
//     };
// };

const writeConfig = async (video) => {
    const config = `class CfgVideos {
    ${video
        .map(
            (file) => `class GVAR(${file.name}) {
        name = QUOTE(${file.prettyName});
        file = QPATHTOF(data/${file.name}.ogv);
        duration = ${file.length};
    };`
        )
        .join("\n")}
};`;

    await fs.writeFile("../../addons/videos/CfgVideos.hpp", config);
};

const main = async () => {
    const video = await downloadVideo(await getVideo());
    await writeVideos(video);
    await writeConfig(video);
};

main();
