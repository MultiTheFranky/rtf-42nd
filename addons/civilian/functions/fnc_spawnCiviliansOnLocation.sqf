#include "..\script_component.hpp"

/*
        * Author: Franky
        * Function that spawn civilians on a location
        *
        * Arguments:
        * 0: LOCATION - Location where the civilians will spawn
        *
        * Return Value:
        * None
        *
        * Example:
        * [_location] spawn rtf42_civilian_fnc_spawnCiviliansOnLocation;
        *
        * Public: No
*/

params ["_location"];

// Generate a random number of civilians
private _isCustomLocation = text _location in GVAR(customLocations);
private _maxNumberOfCivilians = if (_isCustomLocation) then {(GVAR(customLocations) get (text _location)) select 1} else {GVAR(maxCiviliansPerLocation)};
private _minNumberOfCivilians = if (_isCustomLocation) then {(GVAR(customLocations) get (text _location)) select 2} else {GVAR(minCiviliansPerLocation)};
private _numberOfCivilians = round (random [_minNumberOfCivilians, (_maxNumberOfCivilians + _minNumberOfCivilians) / 2, _maxNumberOfCivilians]);

private _numberOfCivialiansOnHouses = round (_numberOfCivilians * (random 1));

private _numberOfCiviliansOnVehicles = round (_numberOfCivilians * (random 0.1));

[_location, _numberOfCivialiansOnHouses] spawn FUNC(spawnInHouses);

[_location, _numberOfCiviliansOnVehicles] spawn FUNC(spawnInVehicles);

[_location, _numberOfCivilians - _numberOfCivialiansOnHouses - _numberOfCiviliansOnVehicles] spawn FUNC(spawnInStreet);
