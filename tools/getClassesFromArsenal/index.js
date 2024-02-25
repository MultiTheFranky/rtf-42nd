/**
 * Script to make all the classes from ace arsenal
 */

const getWeapon = (weapon) => {
    const weaponClass = weapon[0];
    const weaponAttachment = weapon[1];
    const weaponMuzzle = weapon[2];
    const weaponOptic = weapon[3];
    const weaponMagazines = weapon[4];
    const weaponSecondaryMagazines = weapon[5];
    const weaponBipod = weapon[6];
    return {
        weaponClass,
        weaponAttachment,
        weaponMuzzle,
        weaponOptic,
        weaponMagazines,
        weaponSecondaryMagazines,
        weaponBipod,
    };
};

const getCargo = (cargo) => {
    const cargoClass = cargo[0];
    const cargoItems = cargo[1];
    return {
        cargoClass,
        cargoItems,
    };
};

const getItem = (item) => {
    const itemClass = item[0];
    const itemCount = item[1];
    let returnText = "";
    returnText += `        MACRO_ADDITEM(${itemClass},${itemCount});\n`;
    returnText = returnText.slice(0, -1);
    return returnText;
};

const getMagazine = (magazine) => {
    const magazineClass = magazine[0];
    const magazineCount = magazine[1];
    let returnText = "";
    returnText += `        MACRO_ADDMAGAZINE(${magazineClass},${magazineCount});\n`;
    returnText = returnText.slice(0, -1);
    return returnText;
};

const getWeaponText = (weaponData, type) => {
    let output = "";
    output += `class GVAR(${type}): ${weaponData.weaponClass} {\n`;
    output += `    class LinkedItems {\n`;
    if (weaponData.weaponAttachment !== "") {
        output += `       class LinkedItemsAcc {\n`;
        output += `           item = "${weaponData.weaponAttachment}";\n`;
        output += `           slot = "PointerSlot";\n`;
        output += `       };\n`;
    }
    if (weaponData.weaponMuzzle !== "") {
        output += `       class LinkedItemsMuzzle {\n`;
        output += `           item = "${weaponData.weaponMuzzle}";\n`;
        output += `           slot = "MuzzleSlot";\n`;
        output += `       };\n`;
    }
    if (weaponData.weaponOptic !== "") {
        output += `       class LinkedItemsOptic {\n`;
        output += `           item = "${weaponData.weaponOptic}";\n`;
        output += `           slot = "CowsSlot";\n`;
        output += `       };\n`;
    }
    if (weaponData.weaponBipod !== "") {
        output += `       class LinkedItemsUnder {\n`;
        output += `           item = "${weaponData.weaponBipod}";\n`;
        output += `           slot = "UnderBarrelSlot";\n`;
        output += `       };\n`;
    }
    output += "    };\n";
    output += `    class TransportWeapons {\n`;
    output += `        count = 1;\n`;
    output += `        weapon = QGVAR(${type});\n`;
    output += "    };\n";
    if (weaponData.weaponMagazines.length > 0) {
        output += `    class TransportMagazines {\n`;
        output += `        count = 1;\n`;
        output += `        magazine = "${weaponData.weaponMagazines[0]}";\n`;
        output += "    };\n";
    }
    output += `    baseWeapon = QGVAR(${type});\n`;
    output += "};\n";
    return output;
};

const getCargoText = (cargoData, type, name) => {
    let output = "";
    output += `class GVAR(${name}): ${cargoData.cargoClass} {\n`;
    if (type === "vest") {
        output += "};\n";
        return output;
    }
    if (type === "uniform") {
        output += `   scope = 2;\n`;
        output += `   displayName = CSTRING(${name}UniformDisplayName);\n`;
        output += `   class ItemInfo: GVAR(UniformItemBase) {\n`;
        output += `       uniformClass = QEGVAR(units,${name});\n`;
        output += `   };\n`;
        output += "};\n";
        return output;
    }
    output += `    class TransportItems {\n`;
    for (let i = 0; i < cargoData.cargoItems.length; i++) {
        if (
            !cargoData.cargoItems[i][0].includes("_mag_") &&
            !cargoData.cargoItems[i][0].includes("Rnd")
        ) {
            output += `        ${getItem(cargoData.cargoItems[i])}\n`;
        }
    }
    output += "    };\n";
    output += `    class TransportMagazines {\n`;
    for (let i = 0; i < cargoData.cargoItems.length; i++) {
        if (
            cargoData.cargoItems[i][0].includes("_mag_") ||
            cargoData.cargoItems[i][0].includes("Rnd")
        ) {
            output += `        ${getMagazine(cargoData.cargoItems[i])}\n`;
        }
    }
    output += "    };\n";
    output += "};\n";
    return output;
};

const getItemsText = (items) => {
    const itemClass = items[0];
    const itemCount = items[1];
    let output = "";
    for (let i = 0; i < itemCount; i++) {
        output += `"${itemClass}",`;
    }
    output = output.slice(0, -1);
    return output;
};

const getUnitText = (
    type,
    primaryWeapon,
    secondaryWeapon,
    launcher,
    uniform,
    vest,
    backpack,
    helmet,
    headgear,
    binoculars,
    linkedItems,
    items,
    magazines
) => {
    let output = "";
    output += `class GVAR(${type}): B_CTRG_soldier_GL_LAT_F {\n`;
    output += `    author = ECSTRING(main,Author);\n`;
    output += `    scope = 2;\n`;
    output += `    scopeCurator = 2;\n`;
    output += `    faction = QEGVAR(main,Faction);\n`;
    output += `    editorSubcategory = QEGVAR(main,Infantry);\n`;
    output += `    displayName = CSTRING(${type}_DisplayName);\n`;
    output += `    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\\rtf42_uniform_mc_ca.paa)};\n`;
    output += `    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\\clothing1.rvmat)};\n`;
    output += `    weapons[] = {`;
    if (primaryWeapon) {
        output += `QEGVAR(weapons,${type}_primaryWeapon),`;
    }
    if (secondaryWeapon) {
        output += `QEGVAR(weapons,${type}_secondaryWeapon),`;
    }
    if (launcher) {
        output += `QEGVAR(weapons,${type}_launcher),`;
    }
    output += `"Throw","Put"};\n`;
    output += `    respawnWeapons[] = {`;
    if (primaryWeapon) {
        output += `QEGVAR(weapons,${type}_primaryWeapon),`;
    }
    if (secondaryWeapon) {
        output += `QEGVAR(weapons,${type}_secondaryWeapon),`;
    }
    if (launcher) {
        output += `QEGVAR(weapons,${type}_launcher),`;
    }
    output += `"Throw","Put"};\n`;
    if (uniform) {
        output += `    uniformClass = QEGVAR(uniforms,${type});\n`;
    }
    if (backpack) {
        output += `    backpack = QEGVAR(backpacks,${type});\n`;
    }
    output += `    linkedItems[] = {`;
    if (vest) {
        output += `QEGVAR(vests,${type}),`;
    }
    if (helmet !== "") {
        output += `"${helmet}",`;
    }
    if (headgear !== "") {
        output += `"${headgear}",`;
    }
    if (binoculars) {
        output += `QEGVAR(weapons,${type}_binoculars),`;
    }
    for (let i = 0; i < linkedItems.length; i++) {
        output += `"${linkedItems[i]}",`;
    }
    output = output.slice(0, -1);
    output += "};\n";
    output += `    respawnLinkedItems[] = {`;
    if (vest) {
        output += `QEGVAR(vests,${type}),`;
    }
    if (helmet !== "") {
        output += `"${helmet}",`;
    }
    if (headgear !== "") {
        output += `"${headgear}",`;
    }
    if (binoculars) {
        output += `QEGVAR(weapons,${type}_binoculars),`;
    }
    for (let i = 0; i < linkedItems.length; i++) {
        output += `"${linkedItems[i]}",`;
    }
    output = output.slice(0, -1);
    output += "};\n";
    output += `    items[] = {`;
    for (let i = 0; i < items.length; i++) {
        output += `${getItemsText(items[i])},`;
    }
    output = output.slice(0, -1);
    output += "};\n";
    output += `    respawnItems[] = {`;
    for (let i = 0; i < items.length; i++) {
        output += `${getItemsText(items[i])},`;
    }
    output = output.slice(0, -1);
    output += "};\n";
    output += `    magazines[] = {`;
    for (let i = 0; i < magazines.length; i++) {
        output += `${getItemsText(magazines[i])},`;
    }
    output = output.slice(0, -1);
    output += "};\n";
    output += `    respawnMagazines[] = {`;
    for (let i = 0; i < magazines.length; i++) {
        output += `${getItemsText(magazines[i])},`;
    }
    output = output.slice(0, -1);
    output += "};\n";
    output += "};\n";
    return output;
};

const writeData = (type, parsedInput) => {
    // Things
    let items = [];
    let magazines = [];
    const fs = require("fs");
    // Primary Weapon
    const primaryWeapon = parsedInput[0][0];
    if (primaryWeapon.length > 0) {
        const primaryWeaponText = getWeaponText(
            getWeapon(primaryWeapon),
            `${type}_primaryWeapon`
        );
        // Write the primary weapon
        fs.appendFileSync(
            `../../addons/weapons/includes/${type}.hpp`,
            primaryWeaponText
        );
        if (getWeapon(primaryWeapon).weaponMagazines.length > 0) {
            magazines.push([getWeapon(primaryWeapon).weaponMagazines[0], 1]);
        }
    }
    const secondaryWeapon = parsedInput[0][2];
    if (secondaryWeapon.length > 0) {
        const secondaryWeaponText = getWeaponText(
            getWeapon(secondaryWeapon),
            `${type}_secondaryWeapon`
        );
        // Write the secondary weapon
        fs.appendFileSync(
            `../../addons/weapons/includes/${type}.hpp`,
            secondaryWeaponText
        );
        if (getWeapon(secondaryWeapon).weaponMagazines.length > 0) {
            magazines.push([getWeapon(secondaryWeapon).weaponMagazines[0], 1]);
        }
    }
    const launcher = parsedInput[0][1];
    if (launcher.length > 0) {
        const launcherText = getWeaponText(
            getWeapon(launcher),
            `${type}_launcher`
        );
        // Write the launcher
        fs.appendFileSync(
            `../../addons/weapons/includes/${type}.hpp`,
            launcherText
        );
        if (getWeapon(launcher).weaponMagazines.length > 0) {
            magazines.push([getWeapon(launcher).weaponMagazines[0], 1]);
        }
    }
    const uniform = parsedInput[0][3];
    if (uniform.length > 0) {
        const uniformText = getCargoText(getCargo(uniform), "uniform", type);
        // Write the uniform
        fs.writeFileSync(
            `../../addons/uniforms/includes/${type}.hpp`,
            uniformText
        );
        items.push(...getCargo(uniform).cargoItems);
        magazines.push(...getCargo(uniform).cargoItems);
    }
    const vest = parsedInput[0][4];
    if (vest.length > 0) {
        const vestText = getCargoText(getCargo(vest), "vest", type);
        // Write the vest
        fs.writeFileSync(`../../addons/vests/includes/${type}.hpp`, vestText);
        items.push(...getCargo(vest).cargoItems);
        magazines.push(...getCargo(vest).cargoItems);
    }
    const backpack = parsedInput[0][5];
    if (backpack.length > 0) {
        const backpackText = getCargoText(getCargo(backpack), "backpack", type);
        // Write the backpack
        fs.writeFileSync(
            `../../addons/backpacks/includes/${type}.hpp`,
            backpackText
        );
    }

    const helmet = parsedInput[0][6];
    const headgear = parsedInput[0][7];
    const binoculars = parsedInput[0][8];
    if (binoculars.length > 0) {
        const binocularsText = getWeaponText(
            getWeapon(binoculars),
            `${type}_binoculars`
        );
        // Write the binoculars
        fs.appendFileSync(
            `../../addons/weapons/includes/${type}.hpp`,
            binocularsText
        );
    }
    let output = "";
    const linkedItems = parsedInput[0][9];
    const filterItems = items.filter(
        (item) => !item[0].includes("_mag_") && !item[0].includes("Rnd")
    );
    let filterMagazines = magazines.filter(
        (item) => item[0].includes("_mag_") || item[0].includes("Rnd")
    );
    if (getWeapon(primaryWeapon).weaponMagazines && getWeapon(primaryWeapon).weaponMagazines.length > 0) {
        filterMagazines = filterMagazines.concat([[
            getWeapon(primaryWeapon).weaponMagazines[0],
            1,
        ]]);
    }
    if (getWeapon(secondaryWeapon).weaponMagazines && getWeapon(secondaryWeapon).weaponMagazines.length > 0){
        filterMagazines = filterMagazines.concat([[
            getWeapon(secondaryWeapon).weaponMagazines[0],
            1,
        ]]);
    }
    if (getWeapon(launcher).weaponMagazines && getWeapon(launcher).weaponMagazines.length > 0){
        filterMagazines = filterMagazines.concat([[
            getWeapon(launcher).weaponMagazines[0],
            1,
        ]]);
    }
    // Unit
    output += getUnitText(
        type,
        primaryWeapon.length > 0,
        secondaryWeapon.length > 0,
        launcher.length > 0,
        uniform.length > 0,
        vest.length > 0,
        backpack.length > 0,
        helmet,
        headgear,
        binoculars.length > 0,
        linkedItems || [],
        filterItems,
        filterMagazines
    );

    fs.writeFileSync(`../../addons/units/includes/${type}.hpp`, output);
};

const { data } = require("./data.json");
const fs = require("fs");
fs.rmSync("../../addons/weapons/includes", { recursive: true, force: true });
fs.mkdirSync("../../addons/weapons/includes");
for (let i = 0; i < data.length; i++) {
    const type = data[i].type;
    const arsenalData = data[i].arsenalData;
    writeData(type, arsenalData);
}
