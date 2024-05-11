#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that plays a sound 3d and animation of breathing
    *
    * Arguments:
    * 0: OBJECT - Unit object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit] call rtf42_gas_fnc_playBreath;
    *
    * Public: No
*/
params ["_unit"];
private _sfx = createSoundSource [QGVAR(Sound_Breath), position _unit, [], 0];
_sfx attachTo [_unit, [0, 0, 0], "head"];
_sfx spawn {
    sleep 5;
    deleteVehicle _this;
};