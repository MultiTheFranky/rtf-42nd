#include "..\script_component.hpp"
/*
 * Author: Franky
 * Perfom an animation to the player
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Animation <STRING>
 *
 * Return Value:
 *
 *
 * Example:
 * [_player] call rtf42_animations_fnc_performAnimation;
 *
 * Public: No
 */

params ["_player", "_animation"];

[_player, _animation] remoteExec ['switchMove', 0];
