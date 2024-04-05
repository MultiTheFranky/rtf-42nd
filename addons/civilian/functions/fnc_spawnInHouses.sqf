#include "..\script_component.hpp"

/*
        * Author: Franky
        * Function that spawn civilians on a location houses
        *
        * Arguments:
        * 0: LOCATION - Location where the civilians will spawn
        * 1: NUMBER - Number of civilians that will spawn on the houses
        *
        * Return Value:
        * None
        *
        * Example:
        * [_location, _numberOfCivialiansOnHouses] spawn rtf42_civilian_fnc_spawnInHouses;
        *
        * Public: No
*/

params ["_location","_numberOfCivialiansOnHouses"];

private _createdCivilians = [];

private _errorCounter = 0;

for "_i" from 1 to _numberOfCivialiansOnHouses do {
    if (_errorCounter > 10) exitWith {};
    // Get a random house on the location
    private _house = [_location] call FUNC(getHouseOnLocation);
    if (isNil "_house") then { _i = _i - 1; _errorCounter = _errorCounter + 1; continue };
    // Get a random position on the house
    private _position = selectRandom (_house buildingPos -1);
    if (isNil "_position") then { _i = _i - 1; _errorCounter = _errorCounter + 1; continue };
    // Check if the position is not empty
    if (count (_position nearObjects ["Man", 1]) > 0) then { _i = _i - 1; _errorCounter = _errorCounter + 1; continue };
    // Create the civilian
    private _civilian = objNull;
    if (GVAR(useHouseAgents)) then {
        _civilian = createAgent [selectRandom GVAR(civiliansClassnames), _position, [], 0, "CAN_COLLIDE"];
    } else {
        _civilian = (createGroup civilian) createUnit [selectRandom GVAR(civiliansClassnames), _position, [], 0, "CAN_COLLIDE"];
    };
    _civilian setDir (random 360);
    _createdCivilians pushBack _civilian;
    sleep 0.1;
};

// Add civilians to all curators
{
    _x addCuratorEditableObjects [_createdCivilians, true];
} forEach allCurators;

 GVAR(activeLocations) set [className _location, (GVAR(activeLocations) getOrDefault [className _location, []]) + _createdCivilians];