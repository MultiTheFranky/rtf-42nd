#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that despawn civilians on a location
    *
    * Arguments:
    * 0: STRING - Name of location where the civilians will despawn
    *
    * Return Value:
    * None
    *
    * Example:
    * [_location] call rtf42_civilian_fnc_despawnCiviliansOnLocation;
    *
    * Public: No
*/

params ["_location"];

private _civilians = GVAR(activeLocations) getOrDefault [_location, []];

// Remove civilians to all curators
{
	_x removeCuratorEditableObjects [_civilians, true];
} forEach allCurators;

{
    deleteVehicle _x;
} forEach _civilians;

GVAR(activeLocations) deleteAt (_x);
