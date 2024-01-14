#include "..\script_component.hpp"
/*
	    * Author: Franky
	    * Function to play music using the extension "playmusic"
	    *
	    * Arguments:
	    * 0: Music file <STRING>
	    * 1: Volume <NUMBER>
	    * 2: Loop <BOOL>
	    *
	    * Return Value:
	    * None
	    *
	    * Example:
	    * ["music.ogg", 1, true] call rtf42_music_fnc_playMusic;
	    *
	    * Public: No
*/
if (typeName _this == "ARRAY") then {
	diag_log ("playmusic" callExtension ["play", _this]);
}