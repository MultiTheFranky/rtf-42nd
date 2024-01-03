#include "..\script_component.hpp"
/*
 * Author: Franky
 * Shows a hint with an image of the card
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player <OBJECT>
 * 2: Args <ARRAY>
 *  - 0: Image Name <STRING>
 *  - 1: Image File Name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ["imageName", "image.paa"]] call rft42_cards_fnc_seeCard;
 *
 * Public: No
 */

params ["_target", "_player", "_args"];

if (isNil "_args") exitWith {};

private _imageName = _args select 0;
private _imageFileName = _args select 1;

hint composeText [format ["%1: ", _imageName], lineBreak, parseText format ["<img size='20' image = '%1'/>", _imageFileName]];
