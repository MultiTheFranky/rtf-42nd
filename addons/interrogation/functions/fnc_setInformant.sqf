#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to set a unit to informant or not
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Answers <HASHMAP>
    *
    * Return Value:
    * None
    *
    * Example:
    * [franky] call rtf42_interrogation_fnc_setInformant;
    *
    * Public: No
*/

params ["_unit", "_answers"];

if (!isNil "_answers" && {typeName _answers != "HASHMAP"}) exitWith {
    diag_log str _answers;
};

if (_unit getVariable [QGVAR(informant), false]) then {
    _unit removeAction (_unit getVariable [QGVAR(action), -1]);
    _unit setVariable [QGVAR(action), -1, true];
    _unit setVariable [QGVAR(informant), false, true];
    _unit removeAction (_unit getVariable [QGVAR(mreaction), -1]);
    _unit setVariable [QGVAR(mreaction), -1, true];
    _unit setVariable [QGVAR(mre), false, true];
    if(!isNil "_answers") then {
        [_unit, _answers] call FUNC(setInformant);
    };
} else {
    private _cooldownVariable = QGVAR(cooldown);
    private _mreVariable = QGVAR(mre);
    private _getMREFnc = FUNC(getMRE);
    _unit setVariable [
        QGVAR(action), 
        _unit addAction [LLSTRING(InterrogateAction), {
			params ["_target", "_caller", "_id", "_args"];

			// If the unit is not a translator, answer some strange text
			if (!(_caller getVariable [QGVAR(translator), false])) exitWith {
                [_target, floor(random(32)) call EFUNC(common,generateRandomString)] remoteExec [QFUNC(talk), _caller];
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

            if (!isNil "_args" && {count _args > 0}) then {
                _answer = [_args, _randomNumber] call FUNC(getBestAnswer);
            } else {
                _answer = [call FUNC(getAnswersHashMap), _randomNumber] call FUNC(getBestAnswer);
            };

			// If the unit is a translator, answer a random answer from the array
			[_target, _answer] remoteExec [QFUNC(talk), _caller];
            _target setVariable [QGVAR(cooldown), true, true];
            _target spawn {
                sleep random [GVAR(cooldownMin),  (GVAR(cooldownMin) + GVAR(cooldownMax)) / 2, GVAR(cooldownMax)];
                _this setVariable [QGVAR(cooldown), false, true];
            };
		}, _answers, 0, true, true, "", format ["alive _target && alive _this && !(_target getVariable ['%1', false])", _cooldownVariable], 3, false, "", ""],
        true
    ];

    _unit setVariable [
        QGVAR(mreaction), 
        _unit addAction [LLSTRING(MREAction), { 
            params ["_target", "_caller", "_id", "_args"];
            _target setVariable [QGVAR(mre), true, true];
            _caller call FUNC(removeMRE);
            if (!(_caller getVariable [QGVAR(translator), false])) then {
                [_target, floor(random(32)) call EFUNC(common,generateRandomString)] remoteExec [QFUNC(talk), _caller];
            } else {
                [_target, LLSTRING(MREAnswer)] remoteExec [QFUNC(talk), _caller];
            };
        }, [], 0, false, true, "", format ["alive _target && alive _this && !(_target getVariable ['%1', false]) && (_this call %2) != ''", _mreVariable, _getMREFnc], 3, false, "", ""]
    ];
    _unit setVariable [QGVAR(informant), true, true];
};
