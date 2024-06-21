#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to get the side of a unit based on the config class
    *
    * Arguments:
    * 0: <OBJECT> Unit
    *
    * Return Value:
    * <SIDE> Side of the unit
    *
    * Example:
    * [_unit] call rtf42_common_fnc_getConfigSide;
    *
    * Public: No
*/

params ["_unit"];

switch (getNumber (configFile >> "CfgVehicles" >> (typeOf _unit) >> "side")) do {
    case 0: {east};
    case 1: {west};
    case 2: {independent};
    case 3: {civilian};
    default {sideUnknown};
};