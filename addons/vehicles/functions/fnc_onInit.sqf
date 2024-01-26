#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to execute when a player gets in on a vehicle
    *
    * Arguments:
    * 0: <OBJECT> vehicle
    * 1: <STRING> role
    * 2: <OBJECT> unit
    * 3: <ARRAY> turret path
    *
    * Return Value:
    * None
    *
    * Example:
    * [_vehicle, _role, _unit, _turretPath] call rft42_vehicles_fnc_onInit;
    *
    * Public: No
*/

params ["_vehicle", "_role", "_unit", "_turretPath"];

diag_log format ["rft42_fnc_onGetIn: %1, %2, %3, %4", _vehicle, _role, _unit, _turretPath];
