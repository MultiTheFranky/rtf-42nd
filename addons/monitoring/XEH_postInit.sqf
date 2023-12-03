#include "script_component.hpp"

// Only run on server
if (!isServer) exitWith {};

["CBA_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    call FUNC(initInfluxDB);

    addMissionEventHandler ["EntityKilled", {
        params ["_killed", "_killer", "_instigator"];
        if (isNull _instigator) then {
            _instigator = UAVControl vehicle _killer select 0
        }; // UAV/UGV player operated road kill
        if (isNull _instigator) then {
            _instigator = _killer
        }; // player driven vehicle road kill
        _killer = if (isNull _killer) then {
            _killed getVariable ["ace_medical_lastDamageSource", _killer];
        } else {
            _killer
        };
        if (isPlayer _killer) then {
            private _killerName = (name _killer) call EFUNC(common,minifyString);
            missionNamespace setVariable [format ["rtf42_kill_%1", _killerName], (missionNamespace getVariable [format ["rtf42_kill_%1", _killerName], 0]) + 1];
            [_killerName, missionNamespace getVariable [format ["rtf42_kill_%1", _killerName], 0]] call FUNC(logKill);
        };
    }];

    [FUNC(influxDBLoop), [], 5] call CBA_fnc_waitAndExecute;
}] call CBA_fnc_addEventHandler;