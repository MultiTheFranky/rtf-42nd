#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that gets a random road on a location
    *
    * Arguments:
    * 0 - LOCATION - Location to get the house from
    *
    * Return Value:
    * None
    *
    * Example:
    * call rtf42_civilian_fnc_getRoadOnLocation;
    *
    * Public: No
*/

params ["_location"];
selectRandom ((getPos _location) nearRoads (selectMax (size _location) / 4));