#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to stop the radio music deleting the logic
    *
    * Arguments:
    * 0: <OBJECT> radio object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_radio] call rtf42_music_fnc_stopRadio;
    *
    * Public: No
*/
params ["_radio"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
private _logic = _radio getVariable [QGVAR(radioLogic), objNull];
if (isNull _logic) exitWith {};
deleteVehicle _logic;
_radio setVariable [QGVAR(radioLogic), objNull, true];
terminate (_radio getVariable QGVAR(radioSpawn));