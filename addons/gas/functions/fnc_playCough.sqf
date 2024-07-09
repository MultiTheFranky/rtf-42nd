#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that plays a sound 3d and animation of coughing
    *
    * Arguments:
    * 0: OBJECT - Unit object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit] call rtf42_gas_fnc_playCough;
    *
    * Public: No
*/
params ["_unit"];

private _listOfSounds = [
    QGVAR(Sound_Cough_Min),
    QGVAR(Sound_Cough_Mid),
    QGVAR(Sound_Cough_Max),
    QGVAR(Sound_Cough_Custom)
];
private _selectedSound = selectRandom _listOfSounds;
private _sfx = createSoundSource [_selectedSound, position _unit, [], 0];
_sfx attachTo [_unit, [0, 0, 0], "head"];
_unit setVariable ["rtf42_gas_sfx", _sfx, true];