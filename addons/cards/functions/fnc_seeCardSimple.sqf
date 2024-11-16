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

// Play a sound based on the card name (if it exists) ("\z\rtf42\addons\cards\ui\starlink.jpg" -> "starlink")
private _cardName = _card select [count "\z\rtf42\addons\cards\ui\", (count _card) - ((count "\z\rtf42\addons\cards\ui\") + count 4)];
playMusic format [QEGVAR(music,%1), _cardName];
