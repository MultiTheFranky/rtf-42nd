#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that initializes the gas effect on a unit
    *
    * Arguments:
    * 0: OBJECT - Unit object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit] spawn rtf42_gas_fnc_ppCreateEffect;
    *
    * Public: No
*/

params ["_unit"];
// Don't apply the effect if the player is not the unit (AI don't need to see the blur)
if (player != _unit) exitWith {
    _unit setVariable ["rtf42_gasEffectHandle", 1];
    _unit setVariable ["rtf42_gasEffectStartTime", time];
};
private _handle = -1;
private _priority = 400;
while {
    _handle = ppEffectCreate ["DynamicBlur", _priority];
    _handle < 0 
} do {
    _priority = _priority + 1; 
};
[_unit] call rtf42_gas_fnc_playCough;
_handle ppEffectEnable true;
_handle ppEffectAdjust [5];
_handle ppEffectCommit GVAR(timeToUnconsciousness);
_unit setVariable ["rtf42_gasEffectHandle", _handle];
_unit setVariable ["rtf42_gasEffectStartTime", time];