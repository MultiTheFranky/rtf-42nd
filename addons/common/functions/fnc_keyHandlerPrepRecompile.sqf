#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
    * Author: Franky
    * Function to create a key handler to recompile the functions using [] call ACE_PREP_RECOMPILE;
    *
    * Arguments:
    * None
    *
    * Return Value:
    * None
    *
    * Example:
    * call rtf42_common_fnc_keyHandlerPrepRecompile;
    *
    * Public: No
*/

if (!isFilePatchingEnabled) exitWith {};

["42nd RTF", "rtf42_common_preprecompile", ["Prep Recompile Key", "This key will execute [] call ACE_PREP_RECOMPILE; every time that you press it"], {
    [] call ACE_PREP_RECOMPILE;
    hintSilent "Recompiled all Dev functions";
}, {}, [0x10D, [false, false, false]]] call CBA_fnc_addKeybind;



