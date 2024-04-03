#include "script_component.hpp"

// Only run on server
if (!isServer) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};
    GVAR(activeLocations) = createHashMap; // Hashmap to store active locations and it's vehicles <className location, [vehicles]>
    GVAR(civiliansClassnames) = parseSimpleArray GVAR(civiliansClassnames);
    GVAR(civiliansVehiclesClassnames) = parseSimpleArray GVAR(civiliansVehiclesClassnames);
    GVAR(locationTypes) = parseSimpleArray GVAR(locationTypes);
    [FUNC(loop), [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
