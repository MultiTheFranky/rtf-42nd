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
    * [_agent, _location] spawn rtf42_civilian_fnc_moveAgentVehicleRandomly;
    *
    * Public: No
*/

params ["_agent", "_location"];
// Get the nearest location to the start location that is on GVAR(activeLocations)
private _locations = nearestLocations [getPos _location, GVAR(locationTypes), GVAR(activationDistance)];
// Filter locations that doesn't have roads and is active
_locations = _locations select {[_x] call FUNC(getRoadOnLocation) != objNull && ([_x] call FUNC(getLocationClassName)) in GVAR(activeLocations)};
// Get the first location that is not the start location and is on GVAR(activeLocations)
private _locationSelected = selectRandom _locations;
if (isNil "_locationSelected") exitWith {sleep random 10; [_agent, _location] spawn FUNC(moveAgentVehicleRandomly);};
private _position = getPos([_locationSelected] call FUNC(getRoadOnLocation));
if (isNil "_position") exitWith {sleep random 10; [_agent, _location] spawn FUNC(moveAgentVehicleRandomly);};

_agent setBehaviour "CARELESS";
_agent setSpeedMode "LIMITED";
_agent setCombatMode "BLUE";
_agent forceWalk true;

// Move the agent to the new location
if (isAgent teamMember _agent) then {
    _agent setDestination [_position, "LEADER PLANNED", true];
} else {
    deleteWaypoint [(group _agent), 0];
    private _wp = (group _agent) addWaypoint [_position, 0];
    _wp setWaypointBehaviour "CARELESS";
    _wp setWaypointSpeed "LIMITED";
    _wp setWaypointCombatMode "BLUE";
};

private _vehicle = vehicle _agent;
// Wait for the agent to reach the new location or the agent is not live
waitUntil {
    _vehicle setVariable [QGVAR(agentLastPosition), (getPos _vehicle)];
    sleep 10;
    count (waypoints (group _agent)) == 0  || 
    !alive _agent ||
    isNull _agent ||
    vehicle _agent == _agent ||
    (_vehicle getVariable [QGVAR(agentLastPosition), [0,0,0]]) isEqualTo (getPos _vehicle)
};
if (!alive _agent || isNull _agent || vehicle _agent == _agent) exitWith {};
if ((_vehicle getVariable [QGVAR(agentLastPosition), [0,0,0]]) isEqualTo (getPos _vehicle)) then {
    _vehicle setVelocityModelSpace [0,2,0];
};
sleep random 10;

// Call the function again
[_agent, _location] spawn FUNC(moveAgentVehicleRandomly);

