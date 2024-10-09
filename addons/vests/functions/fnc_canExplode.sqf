#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to check if the player can explode
    *
    * Arguments:
    * 0: Player <OBJECT>
    *
    * Return Value:
    *
    *
    * Example:
    * [_target] call rtf42_vests_fnc_canExplode;
    *
    * Public: No
*/

params ["_target"];

// Check if the vest is "rtf42_vests_SuicideVest" or "rtf42_vests_MiniSuicideVest"

(vest _target) isEqualTo "rtf42_vests_SuicideVest" || (vest _target) isEqualTo "rtf42_vests_MiniSuicideVest"

