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

switch (vest _player) do {
    case "rtf42_vests_SuicideVest": {
        ("DemoCharge_Remote_Ammo_Scripted" createVehicle (position _player)) setDamage 1;
    };
    case "rtf42_vests_MiniSuicideVest": {
        ("ClaymoreDirectionalMine_Remote_Ammo_Scripted" createVehicle (position _player)) setDamage 1;
    };
    default { };
};

// Remove the vest
removeVest _player;




