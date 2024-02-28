#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to stop music
    *
    * Arguments:
    * None
    *
    * Return Value:
    * None
    *
    * Example:
    * [] call rtf42_music_fnc_stopMusic;
    *
    * Public: No
*/
if (hasInterface) then {
    diag_log ("playmusic" callExtension ["stop", []]);
};
