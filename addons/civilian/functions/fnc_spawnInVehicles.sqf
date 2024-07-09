#include "..\script_component.hpp"

/*
        * Author: Franky
        * Function that spawn civilians on a location vehicles
        *
        * Arguments:
        * 0: LOCATION - Location where the civilians will spawn
        * 1: NUMBER - Number of civilians that will spawn on the vehicles
        *
        * Return Value:
        * None
        *
        * Example:
        * [_location, _numberOfCiviliansOnVehicles] spawn rtf42_civilian_fnc_spawnInVehicles;
        *
        * Public: No
*/

params ["_location","_numberOfCiviliansOnVehicles"];

private _createdCivilians = [];

private _errorCounter = 0;

for "_i" from 1 to _numberOfCiviliansOnVehicles do {
    if (_errorCounter > 10) exitWith {};
    // Get a random vehicle position on the location
    private _road = [_location] call FUNC(getRoadOnLocation);
    if (isNil "_road") then { _i = _i - 1; _errorCounter = _errorCounter + 1; continue };
    // Get a random position on the road
    private _position = getPos _road;
    // Check if the position is not empty
    if (count (_position nearObjects ["Vehicle", 1]) > 0) then { _i = _i - 1; _errorCounter = _errorCounter + 1; continue };
    // Create the vehicle
    private _vehicle = createVehicle [selectRandom GVAR(civiliansVehiclesClassnames), _position, [], 0, "NONE"];
    _vehicle addEventHandler ['Hit', {['play', _this select 0] call BIS_fnc_carAlarm;}];
    _vehicle setDir ([_road, (roadsConnectedTo _road) select 0] call BIS_fnc_DirTo);
    _createdCivilians pushBack _vehicle;
    // Create the civilian
    private _civilian = objNull;
    if (GVAR(useVehicleAgents)) then {
        _civilian = createAgent [selectRandom GVAR(civiliansClassnames), _position, [], 0, "NONE"];
    } else {
        _civilian = (createGroup civilian) createUnit [selectRandom GVAR(civiliansClassnames), _position, [], 0, "NONE"];
    };
    // Move the civilian on the vehicle
    _civilian moveInDriver _vehicle;
    _createdCivilians pushBack _civilian;
    [_civilian, _location] spawn FUNC(moveAgentVehicleRandomly);
    [_vehicle, _civilian] spawn FUNC(agentDriveSkill);
    [_vehicle] remoteExec [QFUNC(addActionToVehicle), 0, true];
    sleep 0.1;
};

// Add civilians to all curators
{
    _x addCuratorEditableObjects [_createdCivilians, true];
} forEach allCurators;

 GVAR(activeLocations) set [[_location] call FUNC(getLocationClassName), (GVAR(activeLocations) getOrDefault [[_location] call FUNC(getLocationClassName), []]) + _createdCivilians];