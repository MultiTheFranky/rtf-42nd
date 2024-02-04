#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to add an action to the unit to explode the vest
    *
    * Arguments:
    * 0: Unit <OBJECT>
    *
    * Return Value:
    *
    *
    * Example:
    * [_unit] call rtf42_vests_fnc_addExplodeAction;
    *
    * Public: No
*/

params ["_unit"];

_unit addAction ["<t color='#ff0000'>Explode Vest</t>", {
    params ["_target"];

    [_target] call rtf42_vests_fnc_explode;
}, nil, 0, false, true, "", "_this in _target && alive _this && [_this] call rtf42_vests_fnc_canExplode",0];


