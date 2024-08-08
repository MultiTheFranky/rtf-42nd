#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to play the radio music using say3D
    *
    * Arguments:
    * 0: <OBJECT> radio object
    * 1: <STRING | NIL> music file (class name value from rtf42_music_RadioMusic)
    *
    * Return Value:
    * None
    *
    * Example:
    * [_radio, "rtf42_music_5fdp_judgement_day"] call rtf42_music_fnc_playRadio;
    *
    * Public: No
*/
params ["_radio"];
if (is3DEN) exitWith {};
if (!isServer) exitWith {};
private _handler = _radio getVariable QGVAR(radioSpawn);
if (!isNil "_handler") then {
    terminate _handler;
    _radio setVariable [QGVAR(radioSpawn), nil];
};
private _musicFile = _radio getVariable [QGVAR(radioFile), nil];
if (isNil "_musicFile") exitWith {};
private _musicTime = ((getNumber (configFile >> "CfgMusic" >> _musicFile >> "duration")) + 1);
if (_musicTime == 1) exitWith {}; // No music file found
private _logic = _radio getVariable [QGVAR(radioLogic), objNull];
if (isNull _logic) then {
    _logic = (createGroup sideLogic) createUnit ["Logic", getPos _radio, [], 0, "CAN_COLLIDE"];
    _radio setVariable [QGVAR(radioLogic), _logic];
}else {
    deleteVehicle _logic;
    _logic = (createGroup sideLogic) createUnit ["Logic", getPos _radio, [], 0, "CAN_COLLIDE"];
    _radio setVariable [QGVAR(radioLogic), _logic];
};
[_logic,[_musicFile]] remoteExec ["say3D", [0, -2] select isDedicated];
_radio setVariable [QGVAR(radioFile), _musicFile];
_radio setVariable [QGVAR(radioSpawn),[_radio, _musicFile, _musicTime] spawn {
    params ["_radio", "_musicFile", "_musicTime"];
    sleep _musicTime;
    [_radio] call FUNC(playRadio);
}];

/* [_radio, _file, _musicTime] spawn {
    params ["_radio", "_file", "_musicTime"];
    sleep _musicTime;
    if (!(_radio getVariable [QGVAR(radioFile), ""] isEqualTo _file)) exitWith {}; // Radio file changed
    if (!(_radio getVariable [QGVAR(radioOn), false])) exitWith {}; // Radio turned off
    if (_radio getVariable [QGVAR(radioShuffle), false]) then { 
        [_radio, call FUNC(selectSong)] call FUNC(playRadio); // Shuffle
    } else {
        [_radio, [_file] call FUNC(selectSong)] call FUNC(playRadio); // NO Shuffle -> Next song
    };
}; */