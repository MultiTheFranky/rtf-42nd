#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to check if the target is alive and the player is alive and the target is not on cooldown
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Player <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_unit, _player] call rtf42_interrogation_fnc_canInterrogate;
    *
    * Public: No
*/

params ["_target","_player"];
diag_log format["%1 - %2 - %3",_target,_player, !(_target getVariable [QGVAR(cooldown), false])];
GVAR(enabled) && {alive _target && alive _player && (side _target) == civilian && !(_target getVariable [QGVAR(cooldown), false])}