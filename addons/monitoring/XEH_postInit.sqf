#include "script_component.hpp"

// Only run on server
if (!isServer) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};
    [FUNC(influxDBLoop), [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;