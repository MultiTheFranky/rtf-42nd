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
private _numberOfCivilians = round (random [GVAR(minCiviliansPerLocation), (GVAR(maxCiviliansPerLocation) + GVAR(minCiviliansPerLocation)) / 2, GVAR(maxCiviliansPerLocation)]);

private _numberOfCivialiansOnHouses = round (_numberOfCivilians * (random 1));

private _numberOfCiviliansOnVehicles = round (_numberOfCivilians * (random 0.1));

// Array of civilians that will be spawned
private _createdCivilians = [];

// spawn civilians on houses
for "_i" from 1 to _numberOfCivialiansOnHouses do {
    // Get a random house on the location
    private _house = [_location] call FUNC(getHouseOnLocation);
    if (isNil "_house") then { _i = _i - 1; continue };
    // Get a random position on the house
    private _position = selectRandom (_house buildingPos -1);
    if (isNil "_position") then { _i = _i - 1;continue };
    // Check if the position is not empty
    if (count (_position nearObjects ["Man", 1]) > 0) then { _i = _i - 1; continue };
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

// spawn civilians on a vehicle and move them
for "_i" from 1 to _numberOfCiviliansOnVehicles do {
    // Get a random vehicle position on the location
    private _road = [_location] call FUNC(getRoadOnLocation);
    if (isNil "_road") then { _i = _i - 1; continue };
    // Get a random position on the road
    private _position = getPos _road;
    // Check if the position is not empty
    if (count (_position nearObjects ["Vehicle", 1]) > 0) then { _i = _i - 1; continue };
    // Create the vehicle
    private _vehicle = createVehicle [selectRandom GVAR(civiliansVehiclesClassnames), _position, [], 0, "NONE"];
    _vehicle addEventHandler ['Hit', {['play', _this select 0] call BIS_fnc_carAlarm;}];
    _vehicle setDir ([_road, (roadsConnectedTo _road) select 0] call BIS_fnc_DirTo);
    _createdCivilians pushBack _vehicle;
    // Create the civilian
    private _civilian = objNull;
    if (GVAR(useVehicleAgents)) then {
        _civilian = createAgent [selectRandom GVAR(civiliansClassnames), _position, [], 0, "CAN_COLLIDE"];
    } else {
        _civilian = (createGroup civilian) createUnit [selectRandom GVAR(civiliansClassnames), _position, [], 0, "CAN_COLLIDE"];
    };
    // Move the civilian on the vehicle
    _civilian moveInDriver _vehicle;
    _createdCivilians pushBack _civilian;
    [_civilian, _location] spawn FUNC(moveAgentVehicleRandomly);
    [_vehicle, _civilian] spawn FUNC(agentDriveSkill);
    [_vehicle] remoteExec [QFUNC(addActionToVehicle), 0, true];
    sleep 0.1;
};

// spawn civilians on the street
for "_i" from 1 to (_numberOfCivilians - _numberOfCivialiansOnHouses - _numberOfCiviliansOnVehicles) do {
    private _position = (getPos _location) getPos [((selectMax (size _location)) / 4) * sqrt random 1, random 360];
    private _civilian = objNull;
    if (GVAR(useStreetAgents)) then {
        _civilian = createAgent [selectRandom GVAR(civiliansClassnames), _position, [], 0, "CAN_COLLIDE"];
    } else {
        _civilian = (createGroup civilian) createUnit [selectRandom GVAR(civiliansClassnames), _position, [], 0, "CAN_COLLIDE"];
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

 
 GVAR(activeLocations) set [className _location, _createdCivilians];