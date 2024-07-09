#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that gets a random house on a location
    *
    * Arguments:
    * 0 - LOCATION - Location to get the house from
    *
    * Return Value:
    * None
    *
    * Example:
    * call rtf42_civilian_fnc_getHouseOnLocation;
    *
    * Public: No
*/

params ["_location"];
selectRandom (
    nearestTerrainObjects [getPos _location, ["HOUSE", "HOSPITAL", "CHURCH", "CHAPEL", "BUILDING", "BUNKER", "FUELSTATION", "LIGHTHOUSE", "RUIN"], selectMax (size _location)] + nearestObjects [getPos _location, ["HOUSE", "HOSPITAL", "CHURCH", "CHAPEL", "BUILDING", "BUNKER", "FUELSTATION", "LIGHTHOUSE", "RUIN"], selectMax (size _location)]
);