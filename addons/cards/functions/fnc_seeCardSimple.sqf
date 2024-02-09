#include "..\script_component.hpp"
/*
 * Author: Franky
 * Shows a hint with an image of the card
 *
 * Arguments:
 * 0: Card <STRING>
 *
 * Return Value:
 * None
 *s
 * Example:
 * [_card] call rtf42_cards_fnc_seeCardSimple;
 *
 * Public: No
 */

params ["_card"];

[
    format ["<img size='10' image='%1' />", _card],
    safeZoneX+safeZoneW-0.7,
    safeZoneY+0.02,
    30,
    3,
    0,
    3090
] spawn BIS_fnc_dynamicText;
