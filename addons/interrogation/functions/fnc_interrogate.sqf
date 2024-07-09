#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to interrogate a unit from the player
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Player <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit, _player] call rtf42_interrogation_fnc_interrogate;
    *
    * Public: No
*/

params ["_target", "_player"];

// If the unit is not a translator, answer some strange text
if (!(_player getVariable [QGVAR(translator), false])) exitWith {
    [_target, floor(random(32)) call EFUNC(common,generateRandomString)] remoteExec [QFUNC(talk), _player];
    _target setVariable [QGVAR(cooldown), true, true];
    _target spawn {
        sleep random [GVAR(cooldownMin),  (GVAR(cooldownMin) + GVAR(cooldownMax)) / 2, GVAR(cooldownMax)];
        _this setVariable [QGVAR(cooldown), false, true];
    };
};

private _answer = "";
private _randomNumber = random 1;

if (_target getVariable [QGVAR(mre),false] && GVAR(improveChance)) then {
    _randomNumber = _randomNumber + GVAR(amountOfImprove);
};

_answer = [[[_target] call EFUNC(common,getConfigSide)] call FUNC(getAnswersHashMap), _randomNumber] call FUNC(getBestAnswer);

// If the unit is a translator, answer a random answer from the array
[_target, _answer] remoteExec [QFUNC(talk), _player];
_target setVariable [QGVAR(cooldown), true, true];
_target spawn {
    switch ([_this] call EFUNC(common,getConfigSide)) do {
        case east: {
            sleep random [GVAR(cooldownMinPrisoner),  (GVAR(cooldownMinPrisoner) + GVAR(cooldownMaxPrisoner)) / 2, GVAR(cooldownMaxPrisoner)];
        };
        case civilian;
        case default {
            sleep random [GVAR(cooldownMin),  (GVAR(cooldownMin) + GVAR(cooldownMax)) / 2, GVAR(cooldownMax)];
        };
    };
    _this setVariable [QGVAR(cooldown), false, true];
};

