#include "../script_component.hpp"

params ["_logic"];

if (isNull _logic) exitWith {0};

// Get logic variables
private _file = _logic getVariable ["File", ""];
private _pitch = _logic getVariable ["Pitch", 1];
private _distance = _logic getVariable ["Distance", 500];
private _offset = _logic getVariable ["Offset", 0];
private _loop = _logic getVariable ["Loop", false];

if (_file isEqualTo "") exitWith {
    deleteVehicle _logic;
    0;
};

[_logic,[_file, _distance, _pitch, false, _offset]] remoteExec ["say3D", -2];

sleep ((getNumber (configFile >> "CfgMusic" >> _file >> "duration")) + 1 - _offset);

if (!_loop) exitWith {
    deleteVehicle _logic;
    0;
};

_this spawn FUNC(playSound3D);
