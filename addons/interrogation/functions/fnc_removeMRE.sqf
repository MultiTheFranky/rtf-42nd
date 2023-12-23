#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to remove MRE item from the unit inventory
    *
    * Arguments:
    *
    * Return Value:
    * 0: Unit <OBJECT>
    *
    * Example:
    * call rtf42_interrogation_fnc_removeMRE;
    *
    * Public: No
*/

params ["_unit"];

private _mreItem = _unit call FUNC(getMRE);

if (_mreItem == "") exitWith {};

_unit removeItem _mreItem;