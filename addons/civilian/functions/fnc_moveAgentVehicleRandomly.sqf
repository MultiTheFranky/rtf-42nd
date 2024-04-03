#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that moves the driver agent to a random activated location near the start location
    *
    * Arguments:
    * 0: OBJECT - driver agent to move
    * 1: OBJECT - Location from start
    *
    * Return Value:
    * None
    *
    * Example:
    * spawn rtf42_civilian_fnc_moveAgentVehicleRandomly;
    *
    * Public: No
*/

params ["_agent", "_location"];
if (!alive _agent || isNull _agent) exitWith {};

// Get the nearest location to the start location that is on GVAR(activeLocations)
private _locations = nearestLocations [getPos _location, GVAR(locationTypes), GVAR(activationDistance)];
// Get the first location that is not the start location and is on GVAR(activeLocations)
private _locationSelected = (_locations select { _x != _location && ((className _x) in GVAR(activeLocations))}) select 0;
private _position = getPos([_locationSelected] call FUNC(getRoadOnLocation));
if (isNil "_position") exitWith {};

// Move the agent to the new location
_agent setDestination [_position, "LEADER PLANNED", true];
_agent setBehaviour "CARELESS";
_agent setSpeedMode "LIMITED";
_agent setCombatMode "BLUE";
_agent forceWalk true;

// Wait for the agent to reach the new location or the agent is not live
waitUntil { (_agent distance _position) < 30  || !alive _agent || isNull _agent};
if (!alive _agent || isNull _agent) exitWith {};
sleep random 10;

// Call the function again
[_agent, _location] spawn FUNC(moveAgentVehicleRandomly);

