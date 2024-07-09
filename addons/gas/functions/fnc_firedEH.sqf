#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function that executes on fire event and checks if the ammo is gas ammo
    *
    * Arguments:
    * 0: OBJECT - Unit that fired
    * 1: STRING - Weapon that fired
    * 2: STRING - Muzzle that fired
    * 3: STRING - Mode that fired
    * 4: STRING - Ammo that fired
    * 5: STRING - Magazine that fired
    * 6: STRING - Projectile that fired
    *
    * Return Value:
    * OBJECT - Particle effect
    *
    * Example:
    * [_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile] call rtf42_gas_fnc_firedEH;
    *
    * Public: No
*/

params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile"];

if (_ammo isNotEqualTo QGVAR(GasAmmo)) exitWith {};

[_projectile] remoteExec [QFUNC(init), 2];