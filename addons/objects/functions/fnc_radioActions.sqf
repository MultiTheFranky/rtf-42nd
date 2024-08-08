#include "..\script_component.hpp"
/*
 * Author: Franky
 * Returns children actions for the radio.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target] call rtf42_objects_fnc_radioActions
 *
 * Public: No
 */
params ["_target"];

private _songs = "true" configClasses (configFile >> QEGVAR(music,RadioMusic));

private _actions = [];

{
    private _musicText = getText (_x >> "name");
	private _musicValue = getText (_x >> "value");
    private _action = [_musicText, _musicText, "", 
    {
        params ["_target", "_caller", "_args"];
        _args params ["_musicValue"];
        _target setVariable [QEGVAR(music,radioFile),_value, true];
        [_target] remoteExec [QFUNC(turnOnRadio),[0, -2] select isDedicated];
    }
    , {true}, {}, [_musicValue], [0,0,0], 10] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
} forEach _songs;


_actions;
