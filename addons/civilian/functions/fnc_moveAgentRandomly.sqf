#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that generates random positions arround a location and moves the agent on a loop between them
    *
    * Arguments:
    * 0: OBJECT - agent to move
    * 1: OBJECT - Location to move around
    *
    * Return Value:
    * None
    *
    * Example:
    * [_agent, location] spawn rtf42_civilian_fnc_moveAgentRandomly;
    *
    * Public: No
*/

params ["_agent", "_location"];
if (isNil "_agent" || isNil "_location") exitWith {};
if (!alive _agent) exitWith {};
if (!isNil (_agent getVariable ["lambs_main_currentTask", nil])) exitWith {};
private _pos = ((getPos _location) getPos [((selectMax (size _location)) / 2) * sqrt random 1, random 360]);
if (isAgent teamMember _agent) then {
    _agent setDestination [_pos, "LEADER PLANNED", true];
} else {
    _agent doMove _pos;
};

waitUntil {
    _agent setVariable [QGVAR(agentLastPosition), (getPos _agent)];
    sleep 5; 
    (
        _agent distance _pos < 5  // Agent is close to the destination
            ||
        !alive _agent // Agent is dead
            ||
        _agent getVariable [QGVAR(agentLastPosition), [0,0,0]] isEqualTo (getPos _agent) // Agent is stuck
    )
    && (isNil {_agent getVariable ["lambs_main_currentTask", nil]})};
sleep 5;
[_agent, _location] spawn FUNC(moveAgentRandomly)