#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to explode (easy as that :D)
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

("DemoCharge_Remote_Ammo_Scripted" createVehicle (position _player)) setDamage 1;


