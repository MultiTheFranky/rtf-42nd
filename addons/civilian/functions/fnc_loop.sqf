#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that loops checking players positions and activating locations
    *
    * Arguments:
    * None
    *
    * Return Value:
    * None
    *
    * Example:
    * call rtf42_civilian_fnc_loop;
    *
    * Public: No
*/

// Get players distance to nearest location
private _activeLocations = [];
{
    private _locations = nearestLocations [_x, GVAR(locationTypes), GVAR(activationDistance), _x];
    {
        _activeLocations pushBackUnique _x;
    } forEach _locations;
} forEach allPlayers;

// Remove more elements than GVAR(maxNumberOfActiveLocations)
if (count _activeLocations > GVAR(maxNumberOfActiveLocations)) then {
    _activeLocations resize GVAR(maxNumberOfActiveLocations);
};

// Activate location if not already
{
    if (!((className _x) in GVAR(activeLocations))) then {
        [[className _x] call FUNC(getLocationFromName)] spawn FUNC(spawnCiviliansOnLocation);
        GVAR(activeLocations) set [className _x, []];
    };
} forEach _activeLocations;

// Disable location if location is in GVAR(activeLocations) but not on _activeLocations
{
    if (!(([_x] call FUNC(getLocationFromName)) in _activeLocations)) then {
        [_x] call FUNC(despawnCiviliansOnLocation);
    };
} forEach GVAR(activeLocations);

// Sleep for GVAR(loopTime) seconds and call this function again
[FUNC(loop), [], GVAR(loopTime)] call CBA_fnc_waitAndExecute;