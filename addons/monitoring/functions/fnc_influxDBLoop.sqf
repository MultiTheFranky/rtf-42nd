#include "..\script_component.hpp"
/*
    * Author: Franky
    * Start influxDB info loop
    *
    * Arguments:
    * None
    *
    * Return Value:
    * None
    *
    * Example:
    * [] call rtf42_monitoring_fnc_influxDBLoop
    *
    * Public: No
*/

if (!isServer) exitwith {};

private _serverName = serverName call EFUNC(common,minifyString);

if(_serverName == "") then {
    _serverName = "singlePlayer";
};

private _datatoWrite = [
    [format ["rtf42_%1_players", _serverName], "Number of players", count allplayers] joinstring ":",
    [format ["rtf42_%1_server_fps", _serverName], "Server FPS", floor diag_fps] joinstring ":",
    [format ["rtf42_%1_ai", _serverName], "Number of AI", {
        !isplayer _x
    } count allunits] joinstring ":",
    [format ["rtf42_%1_objects", _serverName], "Number of objects", count allMissionObjects "All"] joinstring ":",
    [format ["rtf42_%1_blufor", _serverName], "Number of units blufor", blufor countside allunits] joinstring ":",
    [format ["rtf42_%1_opfor", _serverName], "Number of units opfor", opfor countside allunits] joinstring ":",
    [format ["rtf42_%1_ind", _serverName], "Number of units ind", independent countside allunits] joinstring ":"
];

diag_log str("influxdb" callExtension ["data", _datatoWrite]);

[FUNC(influxDBLoop), [], 5] call CBA_fnc_waitandexecute;