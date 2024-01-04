#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to get the best answer based on a random number
    *
    * Arguments:
    * 0: Answers <HASHMAP>
    * 1: Random Number <NUMBER>
    *
    * Return Value:
    * 0: Answer <STRING>
    *
    * Example:
    * [answers] call rtf42_interrogation_fnc_getBestAnswer;
    *
    * Public: No
*/

params ["_answers", "_randomNumber"];

private _negativeAnswers = [
    "I don't know",
    "I don't know anything",
    "I don't know anything about that",
    "I don't know anything about that, I swear",
    "I don't know anything about that, I swear to god",
    "No",
    "No, I don't know",
    "No, I don't know anything",
    "No, I don't know anything about that",
    "No, I don't know anything about that, I swear",
    "No, I don't know anything about that, I swear to god",
    "Nope",
    "Nope, I don't know",
    "Nope, I don't know anything",
    "Nope, I don't know anything about that",
    "Nope, I don't know anything about that, I swear",
    "Nope, I don't know anything about that, I swear to god"
];

private _hightestNumber = 1;
private _answer = selectRandom _negativeAnswers; //TODO: Localize or set as param

{
    if (_y > _randomNumber && _y < _hightestNumber) then {
        _answer = _x;
        _hightestNumber = _y;
    };
} forEach _answers;

_answer