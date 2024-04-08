#include "script_component.hpp"
private _customLocations = [];
{
    if (!(isNil {_x getVariable QGVAR(locationName)})) then {
        _customLocations pushBack _x;
    };
} forEach (allMissionObjects "EmptyDetector");
GVAR(customLocations) = createHashMap; // Hashmap to store custom locations <string, [location, maxUnits, minUnits]>
{
    private _name = _x getVariable [QGVAR(locationName), "Unknown"];
    private _pos = getPos _x;
    private _size = selectMax (triggerArea _x);
    private _type = ["Name", "NameCity"] select (typeOf _x find "Town" > - 1);
    private _maxUnits = _x getVariable [QGVAR(maxNumberOfUnits), [30, 50] select (_type == "NameCity")];
    private _minUnits = _x getVariable [QGVAR(minNumberOfUnits), [10, 20] select (_type == "NameCity")];
    private _location = createLocation [_type, _pos, _size, _size];
    _location setText _name;
    GVAR(customLocations) set [_name, [_location, _maxUnits, _minUnits]];
} forEach _customLocations;

// Only run on server
if (!isServer) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};
    GVAR(activeLocations) = createHashMap; // Hashmap to store active locations and it's vehicles <className location, [vehicles]>
    GVAR(civiliansClassnames) = parseSimpleArray GVAR(civiliansClassnames);
    GVAR(civiliansVehiclesClassnames) = parseSimpleArray GVAR(civiliansVehiclesClassnames);
    GVAR(locationTypes) = parseSimpleArray GVAR(locationTypes);
    GVAR(locationBlacklisted) = parseSimpleArray GVAR(locationBlacklisted);
    [FUNC(loop), [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;
