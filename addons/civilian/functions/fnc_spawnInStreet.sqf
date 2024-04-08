#include "..\script_component.hpp"

/*
        * Author: Franky
        * Function that spawn civilians on a location street
        *
        * Arguments:
        * 0: LOCATION - Location where the civilians will spawn
        * 1: NUMBER - Number of civilians that will spawn on the street
        *
        * Return Value:
        * None
        *
        * Example:
        * [_location, _numberOfCivialiansOnStreet] spawn rtf42_civilian_fnc_spawnInStreet;
        *
        * Public: No
*/

params ["_location","_numberOfCivialiansOnStreet"];

private _createdCivilians = [];

for "_i" from 1 to _numberOfCivialiansOnStreet do {
    private _position = (getPos _location) getPos [((selectMax (size _location))) * sqrt random 1, random 360];
    private _civilian = objNull;
    if (GVAR(useStreetAgents)) then {
        _civilian = createAgent [selectRandom GVAR(civiliansClassnames), _position, [], 0, "NONE"];
    } else {
        _civilian = (createGroup civilian) createUnit [selectRandom GVAR(civiliansClassnames), _position, [], 0, "NONE"];
    };
    _civilian forceWalk true;
    [_civilian, _location] spawn FUNC(moveAgentRandomly);
    _createdCivilians pushBack _civilian;
    sleep 0.1;
};

// Add civilians to all curators
{
    _x addCuratorEditableObjects [_createdCivilians, true];
} forEach allCurators;


 GVAR(activeLocations) set [[_location] call FUNC(getLocationClassName), (GVAR(activeLocations) getOrDefault [[_location] call FUNC(getLocationClassName), []]) + _createdCivilians];