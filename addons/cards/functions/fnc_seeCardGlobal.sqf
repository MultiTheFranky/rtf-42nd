#include "..\script_component.hpp"
/*
 * Author: Franky
 * Shows a hint with an image of the card globally
 *
 * Arguments:
 * 0: Card <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["card"] call rtf42_cards_fnc_seeCardGlobal;
 *
 * Public: No
 */

params ["_card"];

diag_log format ["rtf42_cards_fnc_seeCardGlobal: %1", _card];

[_card] remoteExec [QFUNC(seeCardSimple), 0];
