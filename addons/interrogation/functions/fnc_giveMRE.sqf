#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to give MRE to the unit
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Player <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [franky] call rtf42_interrogation_fnc_giveMRE;
    *
    * Public: No
*/

params ["_target", "_player"];
_target setVariable [QGVAR(mre), true, true];
_player call FUNC(removeMRE);
if (!(_player getVariable [QGVAR(translator), false])) then {
    [_target, floor(random(32)) call EFUNC(common,generateRandomString)] remoteExec [QFUNC(talk), _player];
} else {
    [_target, LLSTRING(MREAnswer)] remoteExec [QFUNC(talk), _player];
};