#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that gets the custom classname or the classname of the location
    *
    * Arguments:
    * 0 - LOCATION
    *
    * Return Value:
    * None
    *
    * Example:
    * call rtf42_civilian_fnc_getLocationClassName;
    *
    * Public: No
*/

params ["_location"];

if ((text _location) in GVAR(customLocations)) then {
    text _location
} else {
    className _location
};