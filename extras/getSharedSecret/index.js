const prompt = require("prompt-sync")();
var SteamUser = require("steam-user");
var client = new SteamUser();
client.logOn({
    accountName: process.env.STEAM_USERNAME,
    password: process.env.STEAM_PASSWORD,
});

client.on("loggedOn", function () {
    console.log("Logged In");
    client.enableTwoFactor(async function (error, response) {
        console.log(error);
        console.log(response);

        const code = prompt("Activation code: ");

        await client.finalizeTwoFactor(
            Buffer.from(response.shared_secret, "base64"),
            code,
            function (error, response) {
                console.log(error);
                console.log(response);
            }
        );
    });
});
