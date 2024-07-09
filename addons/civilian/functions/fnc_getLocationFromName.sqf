#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that gets the location from a location className
    *
    * Arguments:
    * 0: STRING - Location name (e.g. "Kavala")
    *
    * Return Value:
    * Location
    *
    * Example:
    * [_locationClassName] call rtf42_civilian_fnc_getLocationFromName;
    *
    * Public: No
*/

params ["_locationClassName"];
if ((_locationClassName) in GVAR(customLocations)) then {
    (GVAR(customLocations) get (_locationClassName)) select 0;
} else {
    configFile >> "CfgWorlds" >> worldName >> "Names" >> _locationClassName >> "position";
    private _pos = getArray (configFile >> "CfgWorlds" >> worldName >> "Names" >> _locationClassName >> "position");
    nearestLocation [_pos, GVAR(locationTypes)];
};
