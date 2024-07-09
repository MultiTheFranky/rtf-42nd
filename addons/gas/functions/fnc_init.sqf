#include "..\script_component.hpp"

/*
    * Author: Franky
    * Main function that initializes the particle effect and makes all the magic happen
    * This function should be executed on server side
    *
    * Arguments:
    * 0: OBJECT - Projectile object
    *
    * Return Value:
    * None
    *
    * Example:
    * [_projectile] spawn rtf42_gas_fnc_init;
    *
    * Public: No
*/

params ["_projectile"];

sleep 1;

private _particles = [_projectile] call FUNC(createParticle);


private _timeEnd = time + GVAR(timeEffect);

while {time < _timeEnd} do {
    [_projectile] call FUNC(gasCheck);
    sleep 1;
};
{
     deleteVehicle _x;
} forEach _particles;
