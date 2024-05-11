#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that sets the unconscious or conscious state of a unit
    *
    * Arguments:
    * 0: OBJECT - Unit object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit] spawn rtf42_gas_fnc_setUnconscious;
    *
    * Public: No
*/

params ["_unit"];
if (_unit getVariable ["ACE_isUnconscious", false]) then {
    [_unit, false] call ace_medical_fnc_setUnconscious;
    _unit setVariable [QGVAR(isUnconscious), false, true];
}else{
    [_unit, true, 1e10] call ace_medical_fnc_setUnconscious;
    _unit setVariable [QGVAR(isUnconscious), true, true];
    _unit spawn {
        private _endTime = time + GVAR(timeToDeath);
        waitUntil {time > _endTime || !alive _this || !(_this getVariable [QGVAR(isUnconscious), false]) || isNull _this};
        if (!alive _this || !(_this getVariable [QGVAR(isUnconscious), false]) || isNull _this) exitWith {};
        _this setDamage 1;
    };
};
