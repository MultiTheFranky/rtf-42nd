#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to create a hashmap from all answers and the percentage of success
    *
    * Arguments:
    * 0: <SIDE> - Side of the unit
    *
    * Return Value:
    * 0: Answers <HASHMAP>
    *
    * Example:
    * call rtf42_interrogation_fnc_getAnswersHashMap;
    *
    * Public: No
*/

params ["_side"];

private _answers = createHashMap;

switch (_side) do {
    case east: {
        for "_i" from 1 to GVAR(amountOfAnswers) do {
            private _answer = QGVAR(answerPrisoner) + str _i;
            private _percentage = QGVAR(successChancePrisoner) + str _i;
            _answers set [missionNamespace getVariable _answer, missionNamespace getVariable _percentage];
        };

        _answers
    };
    case civilian;
    default {
        for "_i" from 1 to GVAR(amountOfAnswers) do {
            private _answer = QGVAR(answer) + str _i;
            private _percentage = QGVAR(successChance) + str _i;
            _answers set [missionNamespace getVariable _answer, missionNamespace getVariable _percentage];
        };

        _answers
    };
};