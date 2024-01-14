/**
 * Tool to generate the documentation of the different modules of the project. The documentation is from the comments of the functions of the modules. The functions are on the functions folder of each module and every function has the structure as fnc_<name of the function>.sqf. Each module is on the folder addons of the project.
 * The JSON file is generated on the folder docs of the project. The format needs to be the next:
 * {
 * "moduleName": {
 *     "functionName": {
 *        "description": "Description of the function",
 *       "params": [
 *          {
 *             "name": "name of the param",
 *             "type": "type of the param",
 *         }
 *      ],
 *     "returns": {
 *       "name": "name of the return",
 *       "type": "type of the return",
 *    },
 *    "example": "example of the function",
 *    "author": "author of the function",
 *    "public": "true or false"
 * }
 *
 * The format of the comments on the functions are the next:
 * /**
 *  * Author: Franky
 *  *Returns children actions for the actions cards.
 *
 *  * Arguments:
 *  * 0: Target <OBJECT>
 *
 *  * Return Value:
 *  * Actions <ARRAY>
 *
 *  * Example:
 *  * [_target] call rft42_cards_fnc_addCardActions
 *
 *  * Public: No
 *
 *  /*
 *
 */

const fs = require("fs");
const path = require("path");

function getFunctions(moduleName) {
    const functionsPath = path.join(
        __dirname,
        `../../addons/${moduleName}/functions`
    );
    if (!fs.existsSync(functionsPath)) {
        return;
    }
    const functions = fs.readdirSync(functionsPath);
    return functions;
}

function getFunctionComments(moduleName, functionName) {
    const functionPath = path.join(
        __dirname,
        `../../addons/${moduleName}/functions/${functionName}`
    );
    if (!fs.existsSync(functionPath)) {
        return;
    }
    const functionFile = fs.readFileSync(functionPath, "utf8");
    const functionComments = functionFile.match(/\/\*[\s\S]*?\*\//g);
    return functionComments;
}

function getFunctionName(fileName) {
    const functionName = fileName.replace("fnc_", "").replace(".sqf", "");
    return functionName;
}

function getFunctionParams(functionComments) {
    /**
     * Get the params of the function. The format of the params is the next:
     * * Arguments:
     * 0: Target <OBJECT>
     * 1: Actions <ARRAY>
     */
    const params = [];
    const getArgumentRegex = /(?<=\s\*\s)[\s\S]*?(?=\n)/g;
    const getArgumentComments = functionComments[0].match(getArgumentRegex);
    const arguments = [];
    let isArgument = false;
    while (getArgumentComments.length > 0) {
        const argument = getArgumentComments.shift();
        if (argument.includes("Arguments:")) {
            isArgument = true;
            continue;
        }
        if (argument.includes("Return Value:")) {
            break;
        }
        if (isArgument) {
            arguments.push(argument);
        }
    }
    arguments.forEach((argument) => {
        try {
            const param = {};
            const name = argument.match(/(?<=\d:\s)[\s\S]*?(?=<)/g);
            const type = argument.match(/(?<=<)[\s\S]*?(?=>)/g);
            param.name = name[0].trim();
            param.type = type[0].trim();
            params.push(param);
        } catch (error) {}
    });
    return params;
}

function getFunctionReturns(functionComments) {
    /**
     * Get the returns of the function. The format of the returns is the next:
     * * Return Value:
     * Actions <ARRAY>
     */
    const returns = {};
    const getReturnRegex = /(?<=\s\*\s)[\s\S]*?(?=\n)/g;
    const getReturnComments = functionComments[0].match(getReturnRegex);
    const returnValues = [];
    let isReturn = false;
    while (getReturnComments.length > 0) {
        const returnValue = getReturnComments.shift();
        if (returnValue.includes("Return Value:")) {
            isReturn = true;
            continue;
        }
        if (returnValue.includes("Example:")) {
            break;
        }
        if (isReturn) {
            returnValues.push(returnValue);
        }
    }

    try {
        const name = returnValues[0].match(/(?<=\d:\s)[\s\S]*?(?=<)/g);
        const type = returnValues[0].match(/(?<=<)[\s\S]*?(?=>)/g);
        returns.name = name[0].trim();
        returns.type = type[0].trim();
    } catch (error) {}
    return returns;
}

function getFunctionExample(functionComments) {
    /**
     * Get the example of the function. The format of the example is the next:
     * * Example:
     * [_target] call rft42_cards_fnc_addCardActions
     */
    const getExampleRegex = /(?<=\s\*\s)[\s\S]*?(?=\n)/g;
    const getExampleComments = functionComments[0].match(getExampleRegex);
    const exampleValues = [];
    let isExample = false;
    while (getExampleComments.length > 0) {
        const exampleValue = getExampleComments.shift();
        if (exampleValue.includes("Example:")) {
            isExample = true;
            continue;
        }
        if (exampleValue.includes("Public:")) {
            break;
        }
        if (isExample) {
            exampleValues.push(exampleValue);
        }
    }
    return exampleValues[0];
}

function getFunctionAuthor(functionComments) {
    /**
     * Get the author of the function. The format of the author is the next:
     * Author: Franky
     * Public: No
     */
    const getNameRegex = /(?<=\s\*\s)[\s\S]*?(?=\n)/g;
    const getNameComments = functionComments[0].match(getNameRegex);
    const nameValues = [];
    while (getNameComments.length > 0) {
        const nameValue = getNameComments.shift();
        if (nameValue.includes("Author:")) {
            nameValues.push(nameValue.split(":")[1].trim());
            break;
        }
    }
    return nameValues[0];
}

function getFunctionPublic(functionComments) {
    /**
     * Get the public of the function. The format of the public is the next:
     * Public: No
     */
    const getPublicRegex = /(?<=\s\*\s)[\s\S]*?(?=\n)/g;
    const getPublicComments = functionComments[0].match(getPublicRegex);
    const publicValues = [];
    while (getPublicComments.length > 0) {
        const publicValue = getPublicComments.shift();
        if (publicValue.includes("Public:")) {
            publicValues.push(publicValue.split(":")[1].trim() === "Yes");
            break;
        }
    }
    return publicValues[0];
}

function getFunctionDescription(functionComments) {
    // Get the second line of the comments
    const description = functionComments[0].match(/(?<=\*\s)[\s\S]*?(?=\n)/g);
    return description[1];
}

function getModules() {
    const modulesPath = path.join(__dirname, "../../addons");
    const modules = fs.readdirSync(modulesPath);
    return modules;
}

const docs = {};

getModules().forEach((moduleName) => {
    docs[moduleName] = {};
    const functions = getFunctions(moduleName);
    if (!functions) {
        return;
    }
    functions.forEach((functionName) => {
        const functionComments = getFunctionComments(moduleName, functionName);
        if (!functionComments) {
            return;
        }
        const functionData = {};
        functionData.description = getFunctionDescription(functionComments);
        functionData.params = getFunctionParams(functionComments);
        functionData.returns = getFunctionReturns(functionComments);
        functionData.example = getFunctionExample(functionComments);
        functionData.author = getFunctionAuthor(functionComments);
        functionData.public = getFunctionPublic(functionComments);
        docs[moduleName][getFunctionName(functionName)] = functionData;
    });
});

// Create docs folder
if (!fs.existsSync(path.join(__dirname, "../docs"))) {
    fs.mkdirSync(path.join(__dirname, "../docs"));
}

// Write JSON file
fs.writeFile(
    path.join(__dirname, "../docs/docs.json"),
    JSON.stringify(docs, null, 4),
    (err) => {
        if (err) throw err;
        console.log("Docs generated!");
    }
);
