#include "..\script_component.hpp"
/*
 * Author: Franky
 * Check if the player is able to perform an animation
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Can perform animation <BOOL>
 *
 * Example:
 * [_player] call rtf42_animations_fnc_canPerform
 *
 * Public: No
 */

 params ["_player", "_animation"];

if (isNull _player) exitWith {false};
if (typeName _player != "OBJECT") exitWith {false};

// Check if the player is in water, in the air, dead, unconcius, restrained or in a vehicle
if (surfaceIsWater getPos _player) exitWith {false}; // Check if the player is in water
if (!isNull objectParent _player) exitWith {false}; // Check if the player is in a vehicle
if (GETVAR(_player,ACE_isUnconscious,false)) exitWith {false}; // Check if the player is unconcius
if (!alive _player) exitWith {false}; // Check if the player is dead
if (((getPosATL _player) select 2) > 1) exitWith {false}; // Check if the player is in the air
if (GETVAR(_player,ACE_isHandcuffed,false)) exitWith {false}; // Check if the player is restrained

true;

