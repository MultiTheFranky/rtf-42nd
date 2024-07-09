#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that checks if the action should be available
    *
    * Arguments:
    * 0: OBJECT - Target
    * 1: OBJECT - Caller
    * 2: ARRAY - Arguments
    *
    * Return Value:
    * BOOL - True if the action should be available
    *
    * Example:
    * [_target,_caller,_args] spawn rtf42_gas_fnc_canWakeUp;
    *
    * Public: No
*/

params ["_target", "_caller", "_args"];
_target getVariable [QGVAR(isUnconscious), false] && 
(count ((items _target) select {_x isEqualTo GVAR(gasCureClassname)}) isNotEqualTo 0 ||
(count ((items _caller) select {_x isEqualTo GVAR(gasCureClassname)}) isNotEqualTo 0))
