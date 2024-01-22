#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to play music using the extension "playmusic"
    *
    * Arguments:
    * 0: <STRING> music file
    * 1: <NUMBER> volume
    * 2: <BOOL> loop
    *
    * Return Value:
    * None
    *
    * Example:
    * ["music.ogg", 1, true] call rtf42_music_fnc_playMusic;
    *
    * Public: No
*/
if (typeName _this == "ARRAY" && hasInterface) then {
    diag_log ("playmusic" callExtension ["play", _this]);
}
