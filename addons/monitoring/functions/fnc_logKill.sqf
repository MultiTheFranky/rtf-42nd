#include "..\script_component.hpp"
/*
      * Author: Franky
      * Add a kill to the InfluxDB Data
      *
      * Arguments:
      * 0: <STRING> name of the killer
      * 1: <NUMBER> Number of kills
      *
      * Return Value:
      * None
      *
      * Example:
      * [] call rtf42_monitoring_fnc_logKill
      *
      * Public: No
*/

// Check the data
if (!params [
    ["_killer", "", [""]],
    ["_kills", 0, [0]]
    ]) exitWith {
        ERROR_2("rtf42_monitoring_fnc_logKill | Missing parameter [%1, %2]",_killer,_kills);
    };

    // Add the data
    diag_log str("influxdb" callExtension
    ["data",
        [
            [format ["rtf42_kill_%1", _killer], format ["Number of kills from %1", _killer], _kills] joinstring ":"
        ]
    ]);
