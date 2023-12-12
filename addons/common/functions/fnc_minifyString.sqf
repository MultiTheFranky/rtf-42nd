#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to clear an string from all special characters
    *
    * Arguments:
    * 0: <STRING> text to clear
    *
    * Return Value:
    * <STRING> Cleared text
    *
    * Example:
    * "Text%·" call rtf42_common_fnc_minifyString;
    *
    * Public: No
*/

private _text = ((toLower _this) splitString "-");
if (count _text == 0) exitWith {
    ""
};
((_text select ((count _text) - 1)) splitString (toString [32, 9, 13, 10]) joinString "")