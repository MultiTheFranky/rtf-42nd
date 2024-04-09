#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to set a unit to informant or not
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Answers <HASHMAP>
    * 2: Force <BOOL>
    *
    * Return Value:
    * None
    *
    * Example:
    * [franky] call rtf42_interrogation_fnc_setInformant;
    *
    * Public: No
*/

params ["_unit", "_answers", "_force"];

if (!isNil "_answers" && {typeName _answers != "HASHMAP"}) exitWith {};

if (isNil "_force") then {
    _force = false;
};

if (_unit getVariable [QGVAR(informant), false] && !_force) then {
    [_unit,0,["ACE_MainActions",QGVAR(action_ace)]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
    [_unit,0,["ACE_MainActions",QGVAR(mreaction_ace)]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
    _unit setVariable [QGVAR(informant), false, true];
    _unit setVariable [QGVAR(mreaction), -1, true];
    _unit setVariable [QGVAR(mre), false, true];
    if(!isNil "_answers") then {
        [_unit, _answers] call FUNC(setInformant);
    };
} else {
    if (_force) then {
        [_unit,0,["ACE_MainActions",QGVAR(action_ace)]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
        [_unit,0,["ACE_MainActions",QGVAR(mreaction_ace)]] remoteExecCall ["ace_interact_menu_fnc_removeActionFromObject", 0, true];
        _unit setVariable [QGVAR(informant), false, true];
        _unit setVariable [QGVAR(mreaction), -1, true];
        _unit setVariable [QGVAR(mre), false, true];
    };

    // Create the action for the unit using ace_interact_menu_fnc_createAction
    private _mainAction = [QGVAR(action_ace),LLSTRING(InterrogateAction),"a3\3den\data\cfgwaypoints\talk_ca.paa",{
        params ["_target", "_player", "_params"];
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

        if (!isNil "_params" && {count _params > 0}) then {
            _answer = [_params, _randomNumber] call FUNC(getBestAnswer);
        } else {
            _answer = [call FUNC(getAnswersHashMap), _randomNumber] call FUNC(getBestAnswer);
        };

        // If the unit is a translator, answer a random answer from the array
        [_target, _answer] remoteExec [QFUNC(talk), _player];
        _target setVariable [QGVAR(cooldown), true, true];
        _target spawn {
            sleep random [GVAR(cooldownMin),  (GVAR(cooldownMin) + GVAR(cooldownMax)) / 2, GVAR(cooldownMax)];
            _this setVariable [QGVAR(cooldown), false, true];
        };
    },{
        params ["_target", "_player", "_params"];
        alive _target && alive _player && !(_target getVariable [QGVAR(cooldown), false])
    },{},_answers, [0,0,0], 2] call ace_interact_menu_fnc_createAction;


    [_unit, 0, ["ACE_MainActions"], _mainAction] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];

    private _mreAction = [QGVAR(mreaction_ace),LLSTRING(MREAction),"z\ace\addons\field_rations\ui\item_mre_type3_co.paa",{
        params ["_target", "_player", "_params"];
        _target setVariable [QGVAR(mre), true, true];
        _player call FUNC(removeMRE);
        if (!(_player getVariable [QGVAR(translator), false])) then {
            [_target, floor(random(32)) call EFUNC(common,generateRandomString)] remoteExec [QFUNC(talk), _player];
        } else {
            [_target, LLSTRING(MREAnswer)] remoteExec [QFUNC(talk), _player];
        };
    },{
        params ["_target", "_player", "_params"];
        alive _target && alive _player && !(_target getVariable [QGVAR(mre), false]) && (_player call FUNC(getMRE)) != ''
    },{},[], [0,0,0], 2] call ace_interact_menu_fnc_createAction;

    [_unit, 0, ["ACE_MainActions"], _mreAction] remoteExecCall ["ace_interact_menu_fnc_addActionToObject", 0, true];

    _unit setVariable [QGVAR(informant), true, true];
};
