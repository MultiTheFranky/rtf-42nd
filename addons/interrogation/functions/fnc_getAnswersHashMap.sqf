#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to create a hashmap from all answers and the percentage of success
    *
    * Arguments:
    *
    * Return Value:
    * 0: Answers <HASHMAP>
    *
    * Example:
    * call rtf42_interrogation_fnc_getAnswersHashMap;
    *
    * Public: No
*/

private _answers = createHashMap;

for "_i" from 1 to GVAR(amountOfAnswers) do {
    private _answer = QGVAR(answer) + str _i;
    private _percentage = QGVAR(successChance) + str _i;
    _answers set [missionNamespace getVariable _answer, missionNamespace getVariable _percentage];
};

_answers