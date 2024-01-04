#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to explode (easy as that :D)
    *
    * Arguments:
    * 0: Player <OBJECT>
    *
    * Return Value:
    *
    *
    * Example:
    * [_player] call rtf42_vests_fnc_explode;
    *
    * Public: No
*/

params ["_player"];

("DemoCharge_Remote_Ammo_Scripted" createVehicle (position _player)) setDamage 1;


