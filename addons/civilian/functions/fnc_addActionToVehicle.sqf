#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that adds an action to a vehicle
    *
    * Arguments:
    * 0: OBJECT - Vehicle
    *
    * Return Value:
    * None
    *
    * Example:
    * [_vehicle] call rtf42_civilian_fnc_addActionToVehicle;
    *
    * Public: No
*/

params ["_vehicle"];

private _actions = createHashMapFromArray [ // HashMap of Actions <STRING, ARRAY [condition, radius, memoryPoint, script]>
    [localize LSTRING(ActionDragOut), [
        "!(isNull driver _target)",
        2,
        "pos driver",
        {
            params ["_target"];
            private _driver = (driver _target);
            doGetOut _driver;
            waitUntil {isNull driver _target && vehicle _driver == _driver};
            [_driver, true] call ACE_captives_fnc_setSurrendered;
            waitUntil {!(isNull driver _target)};
            if (!(isPlayer driver _target)) then {
                private _locations = nearestLocations [getPos _target, GVAR(locationTypes), GVAR(activationDistance)];
                private _locationSelected = selectRandom (_locations select {(([_x] call FUNC(getLocationClassName)) in GVAR(activeLocations))});
                [driver _target, _locationSelected] spawn FUNC(moveAgentVehicleRandomly);
            };
        }
    ]]
];

{
    private _action = _x;
    private _condition = _y select 0;
    private _radius = _y select 1;
    private _memoryPoint = _y select 2;
    private _script = _y select 3;

    _vehicle addAction [
        _action,
        _script,
        nil,
        6,
        true,
        true,
        "",
        _condition,
        _radius,
        false,
        "",
        _memoryPoint
    ];
} forEach _actions;