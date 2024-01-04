#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to add an action to the player to explode the vest
    *
    * Arguments:
    * 0: Player <OBJECT>
    *
    * Return Value:
    *
    *
    * Example:
    * [_player] call rtf42_vests_fnc_addExplodeAction;
    *
    * Public: No
*/

params ["_player"];

_player addAction ["<t color='#ff0000'>Explode Vest</t>", {
    params ["_target"];

    [_target] call rtf42_vests_fnc_explode;
}, nil, 0, false, true, "", "_target == _this && alive _target && [_target] call rtf42_vests_fnc_canExplode",0];


