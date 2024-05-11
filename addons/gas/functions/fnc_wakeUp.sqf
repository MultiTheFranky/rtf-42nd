#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that wakeups a unit and removes the gas cure item from the unit or the caller
    *
    * Arguments:
    * 0: OBJECT - Unit to wakeup
    * 1: OBJECT - Caller
    * 2: ARRAY - Arguments
    *
    * Return Value:
    * None
    *
    * Example:
    * [_target,_caller,_args] spawn rtf42_gas_fnc_wakeUp;
    *
    * Public: No
*/
params ["_target", "_caller", "_args"];
private _isTargetItem = count ((items _target) select {_x isEqualTo GVAR(gasCureClassname)}) isNotEqualTo 0;
if (_isTargetItem) then {
    _target removeItem GVAR(gasCureClassname);
} else {
    _caller removeItem GVAR(gasCureClassname);
};
[_target] call FUNC(setUnconscious);