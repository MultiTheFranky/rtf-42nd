#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that checks if every unit is in the gas and applies effects to them
    *
    * Arguments:
    * 0: OBJECT - Projectile object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_projectile] spawn rtf42_gas_fnc_gasCheck;
    *
    * Public: No
*/

params ["_projectile"];

private _unitsOnGas = nearestObjects [getPos _projectile, ["CAManBase"], GVAR(gasEffectRadio)];
{
    if ((_x getVariable ["rtf42_gas", false]) || (_x getVariable ["ACE_isUnconscious", false])) then { continue };
    [_x, _projectile] remoteExec [QFUNC(unitGas), _x];
    _x setVariable ["rtf42_gas", true, true];
} forEach _unitsOnGas;


