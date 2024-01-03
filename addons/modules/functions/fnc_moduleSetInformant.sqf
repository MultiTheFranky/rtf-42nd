#include "../script_component.hpp"

params ["_logic", "_units", "_activated"];

// We only play this on the locality of the logic, since the interrogation system are broadcasted across the network
if (!_activated || !local _logic) exitWith {0};

private _answers = createHashMap;

for "_i" from 1 to 5 do {
    private _answer = format ["Answer%1", _i];
    private _percentage = format ["Answer%1Chance", _i];
    _answers set [(_logic getVariable [_answer, ""]), (((_logic getVariable [_percentage, 50]) min 100) max 0) / 100];
};

{
   [_x, _answers, true] call EFUNC(interrogation,setInformant);
} forEach _units;
