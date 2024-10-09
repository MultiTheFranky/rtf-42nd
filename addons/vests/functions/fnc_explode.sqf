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
    * [_target] call rtf42_vests_fnc_explode;
    *
    * Public: No
*/

params ["_target"];

switch (vest _target) do {
    case "rtf42_vests_SuicideVest": {
        _target spawn {
            playSound3D [QPATHTOF(data\vest_sound.ogg), objNull, true, getPosASL _this];
            sleep 1;
            ("DemoCharge_Remote_Ammo_Scripted" createVehicle (position _this)) setDamage 1;
        };
    };
    case "rtf42_vests_MiniSuicideVest": {
        _target spawn {
            playSound3D [QPATHTOF(data\vest_sound.ogg), objNull, true, getPosASL _this];
            sleep 1;
            ("ClaymoreDirectionalMine_Remote_Ammo_Scripted" createVehicle (position _this)) setDamage 1;
        };
    };
    default { };
};

// Remove the vest
removeVest _target;




