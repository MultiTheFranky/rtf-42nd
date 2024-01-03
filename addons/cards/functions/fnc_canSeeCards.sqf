#include "..\script_component.hpp"
/*
 * Author: Franky
 * Check if the player has the cards on their inventory
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * Has cards <BOOL>
 *
 * Example:
 * [_player] call rft42_cards_fnc_canSeeCards;
 *
 * Public: No
 */

 params ["_player"];

if (isNull _player) exitWith {false};

diag_log format ["%1",items _player];

(items _player) findIf {(_x isKindOf [QEGVAR(items,Cards), configFile >> "CfgWeapons"])} != -1
