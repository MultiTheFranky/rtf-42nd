#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to check if the player can explode
    *
    * Arguments:
    * 0: Player <OBJECT>
    * 1: Target <OBJECT>
    *
    * Return Value:
    *
    *
    * Example:
    * [_player, _target] call rtf42_vests_fnc_canExplode;
    *
    * Public: No
*/

params ["_player", "_target"];

// Check if the vest is "rtf42_vests_SuicideVest"

(vest _player) isEqualTo "rtf42_vests_SuicideVest"

