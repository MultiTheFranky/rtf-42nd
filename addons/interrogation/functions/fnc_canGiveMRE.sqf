#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to check if the player can give an MRE to the target
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Player <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit, _player] call rtf42_interrogation_fnc_canGiveMRE;
    *
    * Public: No
*/

params ["_target","_player"];
GVAR(enabled) && {
    alive _target &&
    alive _player && 
    (side _target) == civilian &&
    !(_target getVariable [QGVAR(mre), false]) &&
    (_player call FUNC(getMRE)) != '' &&
     [_target] call EFUNC(common,getConfigSide) == civilian
}