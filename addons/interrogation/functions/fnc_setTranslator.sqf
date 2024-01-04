#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to set the translator for the interrogation system
    *
    * Arguments:
    * 0: Unit <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [franky] call rtf42_interrogation_fnc_setTranslator;
    *
    * Public: No
*/

params ["_unit"];

_unit setVariable [QGVAR(translator), !(_unit getVariable [QGVAR(translator), true])];