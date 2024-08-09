#include "..\script_component.hpp"
/*
 * Author: Franky
 * Returns children actions for the radio zeus actions.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target] call rtf42_zeus_fnc_radioActions
 *
 * Public: No
 */
params ["_target"];

private _songs = "true" configClasses (configFile >> QEGVAR(music,RadioMusic));
private _values = [];
private _names = [];
{
    private _musicText = getText (_x >> "name");
    private _musicValue = getText (_x >> "value");
    _names pushBack _musicText;
    _values pushBack _musicValue;
} forEach _songs;
[LLSTRING(RadioMusic), [["LIST", "MUSIC",[
    _values,
    _names,
    0,
    10
]]],
{
    params ["_option", "_target"];
    private _value = _option select 0;
    _target setVariable [QEGVAR(music,radioFile), _value, true];
    [_target] remoteExec [QEFUNC(music,playRadio), [0, -2] select isDedicated];
}, {}, _target] call zen_dialog_fnc_create;