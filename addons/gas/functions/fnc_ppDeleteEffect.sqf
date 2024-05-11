#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that removes the gas effect from a unit
    *
    * Arguments:
    * 0: OBJECT - Unit to remove the gas effect from
    * 1: NUMBER - Handle of the gas effect
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit,_handle] spawn rtf42_gas_fnc_deleteEffect;
    *
    * Public: No
*/
params ["_unit","_handle"];
if (isNil "_handle") exitWith {
    _unit setVariable ["rtf42_gasEffectHandle", -1];
    _unit setVariable ["rtf42_gasEffectStartTime", 1e10];
    _unit setVariable ["rtf42_gas", false, true];
};
if (_handle == -1) exitWith {
    _unit setVariable ["rtf42_gasEffectHandle", -1];
    _unit setVariable ["rtf42_gasEffectStartTime", 1e10];
    _unit setVariable ["rtf42_gas", false, true];
};
_handle ppEffectEnable true;
_handle ppEffectAdjust [0];
_handle ppEffectCommit 3;
sleep 3;
ppEffectDestroy _handle;
_unit setVariable ["rtf42_gasEffectHandle", -1];
_unit setVariable ["rtf42_gasEffectStartTime", 1e10];
_unit setVariable ["rtf42_gas", false, true];
deleteVehicle (_unit getVariable ["rtf42_gas_sfx", objNull]);
_unit setVariable ["rtf42_gas_sfx", objNull, true];
_unit call FUNC(playBreath);
