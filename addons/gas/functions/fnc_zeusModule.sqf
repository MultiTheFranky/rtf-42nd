#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to be called when the module is placed on the map to generate gas
    *
    * Arguments:
    * 0: Logic POS <ARRAY> 
    *
    * Return Value:
    * None
    *
    * Example:
    * [_pos] spawn rtf42_gas_fnc_zeusModule;
    *
    * Public: No
*/

params ["_pos"];
private _misile = QGVAR(Missile) createVehicle [(_pos select 0), (_pos select 1), 1000];
_misile setVectorDirAndUp [[0,0,-1],[0,1,0]];
waitUntil {((getPos _misile)  select 2) < 1};
private _smoke = QGVAR(GasAmmo) createVehicle [(_pos select 0), (_pos select 1), 0];
[_smoke] remoteExec [QFUNC(init), 2];