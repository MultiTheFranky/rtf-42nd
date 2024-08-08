#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to return a song to play. If not song is passed, it will return a random song. If song is passed, it will return the next song.
    *
    * Arguments:
    * 0: <STRING | NIL> song class name
    *
    * Return Value:
    * <STRING> song class name or nil if no song is found
    *
    * Example:
    * ["rtf42_music_5fdp_judgement_day"] call rtf42_music_fnc_selectSong;
    *
    * Public: No
*/

params ["_song"];

if (isNil "_song") then {
    private _songs = "true" configClasses (configFile >> QGVAR(RadioMusic));
    private _song = selectRandom _songs;
    getText (_song >> "value");
} else {
    private _songs = "true" configClasses (configFile >> QGVAR(RadioMusic));
    private _index = -1;
    {
        if (getText (_x >> "value") isEqualTo _song) exitWith {
            _index = _forEachIndex;
        };
    } forEach _songs;
    if (_index == -1) exitWith {
        private _song = selectRandom _songs;
        getText (_song >> "value");
    }; // Song not found so return a random song
    private _nextIndex = _index + 1;
    if (_nextIndex >= count _songs) then {
        _nextIndex = 0;
    };
    getText ((_songs select _nextIndex) >> "value");
};