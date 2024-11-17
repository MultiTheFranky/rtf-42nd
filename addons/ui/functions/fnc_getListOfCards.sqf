#include "..\script_component.hpp"
/*
 * Author: Franky
 * Function to return a list of cards.
 * The format of the card : [className, displayName, imagePath]
 *
 * Arguments:
 * None
 *
 * Returns:
 * ARRAY - List of cards
 * Example:
 * [] call rtf42_ui_fnc_getListOfCards
 *
 * Public: No
 */

 private _cards = "true" configClasses (configFile >> QGVAR(Cards));
 private _list = [];
 {
	 _list pushBack [configName (_x),getText(_x >> "name"),getText(_x >> "path")];
 } forEach _cards;
 _list