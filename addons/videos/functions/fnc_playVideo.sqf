#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to play a video
    *
    * Arguments:
    * 0: <STRING> Video
    *
    * Return Value:
    *
    *
    * Example:
    * [_video] call rtf42_videos_fnc_playVideo;
    *
    * Public: No
*/

params ["_video"];

if (isNil "_video") exitWith { diag_log "No video defined"; };

private _videoFile = getText (configFile >> "CfgVideos" >> _video >> "file");

if (_videoFile == "") exitWith { diag_log format ["Video %1 not found", _video]; };

[_videoFile] spawn BIS_fnc_playVideo;
