#include "..\script_component.hpp"
/*
    * Author: Franky
    * Log a kill to InfluxDB
    *
    * Arguments:
    * 1 - <STRING> - Player name
    * 2 - <NUMBER> - Number of kills
    *
    * Return Value:
    * None
    *
    * Example:
    * [] call rtf42_monitoring_fnc_logKill;
    *
    * Public: No
*/

if (!isServer) exitWith {};

params ["_player", "_kills"];

private _missionName = missionName call EFUNC(common,minifyString);

private _dataToWrite = createHashMapFromArray [
 [format ["rtf42_%1_kills_%2", _missionName, _player], _kills]
];

diag_log str("influxdb" callExtension ["data", [GVAR(endpoint), GVAR(token), GVAR(organization), GVAR(bucket), _dataToWrite]]);

[FUNC(influxDBLoop), [], 5] call CBA_fnc_waitandexecute;
