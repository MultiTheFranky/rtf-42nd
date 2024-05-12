#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to be called when the module is placed on the map to create the gas module
    *
    * Arguments:
    * 0: Logic <LOGIC>
    * 1: Unit <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_logic, _unit] call rtf42_zeus_fnc_createGasModule;
    *
    * Public: No
*/

params ["_logic", "_unit"];

[_logic] spawn EFUNC(gas,zeusModule);