#include "../script_component.hpp"

params ["_logic", "_units", "_activated"];

private _logicModule = (createGroup sideLogic) createUnit ["Logic", getPos _logic, [], 0, "NONE"];

_logicModule setVariable ["File", _logic getVariable ["File", ""]];
_logicModule setVariable ["Pitch", _logic getVariable ["Pitch", 1]];
_logicModule setVariable ["Distance", _logic getVariable ["Distance", 500]];
_logicModule setVariable ["Offset", _logic getVariable ["Offset", 0]];
_logicModule setVariable ["Loop", _logic getVariable ["Loop", false]];

{
    [_x, [[_logic], true]] remoteExec ["addCuratorEditableObjects", 2];
} forEach allCurators;

deleteVehicle _logic;

[_logicModule] spawn FUNC(playSound3D);