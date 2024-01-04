#include "../script_component.hpp"

params ["_logic", "_units", "_activated"];

// We only play this on the locality of the logic, since the interrogation system are broadcasted across the network
if (!_activated || !local _logic) exitWith {0};

{
   [_x] call EFUNC(interrogation,setTranslator);
} forEach _units;
