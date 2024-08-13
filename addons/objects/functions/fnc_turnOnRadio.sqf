#include "..\script_component.hpp"
/*
 * Author: Franky
 * Turns on the radio
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target] call rtf42_objects_fnc_turnOnRadio
 *
 * Public: No
 */
params ["_target"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
_target setVariable [QEGVAR(music,radioOn),true,true];
_target setObjectTextureGlobal [0,QPATHTOF(data\speaker\screen_co.paa)];
[_target] call EFUNC(music,playRadio);