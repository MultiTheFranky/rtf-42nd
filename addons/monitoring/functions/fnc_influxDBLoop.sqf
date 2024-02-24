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

private _missionName = missionName call EFUNC(common,minifyString);

private _dataToWrite = createHashMapFromArray [
    [format ["rtf42_%1_players", _missionName], count (allPlayers - entities "HeadlessClient_F")],
    [format ["rtf42_%1_server_fps", _missionName], floor diag_fps],
    [format ["rtf42_%1_ai", _missionName], {
        !isplayer _x
    } count allunits],
    [format ["rtf42_%1_objects", _missionName], count allMissionObjects "All"],
    [format ["rtf42_%1_blufor", _missionName], blufor countside allunits],
    [format ["rtf42_%1_opfor", _missionName], opfor countside allunits],
    [format ["rtf42_%1_ind", _missionName], independent countside allunits]
];

diag_log str("influxdb" callExtension ["data", [GVAR(endpoint), GVAR(token), GVAR(organization), GVAR(bucket), _dataToWrite]]);

[FUNC(influxDBLoop), [], 5] call CBA_fnc_waitandexecute;
