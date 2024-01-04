#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to set a unit to informant or not
    *
    * Arguments:
    * 0: Unit <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [franky] call rtf42_interrogation_fnc_init;
    *
    * Public: No
*/

params ["_unit"];

if (side _unit == civilian) then {
    [_unit] call FUNC(setInformant);
};