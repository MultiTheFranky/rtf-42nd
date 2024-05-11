#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function applies gas effect to a unit
    * This functions should be executed locally
    *
    * Arguments:
    * 0: OBJECT - Unit to apply gas effect to
    * 1: OBJECT - Projectile that caused the gas effect
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit, _projectile] call rtf42_gas_fnc_unitGas;
    *
    * Public: No
*/

params ["_unit", "_projectile"];
while {
    (goggles _unit) isNotEqualTo GVAR(gasMaskClassname) &&
    ((_unit distance _projectile) < GVAR(gasEffectRadio)) && 
    (!(_unit getVariable ["ACE_isUnconscious", false]))
} do {
    if ((_unit getVariable ["rtf42_gasEffectHandle", -1]) == -1) then {
       [_unit] call FUNC(ppCreateEffect);
    };

    if (((_unit getVariable ["rtf42_gasEffectStartTime", 1e10]) + GVAR(timeToUnconsciousness)) < time) exitWith {
        [_unit] call FUNC(setUnconscious);
    };
};
[_unit, _unit getVariable ["rtf42_gasEffectHandle", -1]] spawn FUNC(ppDeleteEffect);