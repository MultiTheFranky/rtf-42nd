#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to be called when the module is placed on the map to make gas
    *
    * Arguments:
    * 0: Logic <LOGIC>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_logic] call rtf42_zeus_fnc_setGas;
    *
    * Public: No
*/

params ["_logic"];


[getPos _logic] spawn EFUNC(gas,zeusModule);