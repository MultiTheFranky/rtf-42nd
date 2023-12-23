#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to be called when the module is placed on the map to set a unit to be an translator
    *
    * Arguments:
    * 0: Logic <LOGIC>
    * 1: Unit <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_logic, _unit] call rtf42_zeus_fnc_setTranslator;
    *
    * Public: No
*/

params ["_logic", "_unit"];

if (isNull _unit) exitWith {
    ["The module needs to be attached to a unit"] call BIS_fnc_error;
};

[_unit] call EFUNC(interrogation,setTranslator);