#include "..\script_component.hpp"
/*
	Name: FUNC(toggleIfPosition)
	
	Author(s):
		Gundy
	
	Description:
		Toggle position of interface (display only) from left to right or reset dialog to default position
		
	
	Parameters:
		NONE
	
	Returns:
		BOOLEAN - TRUE
	
	Example:
		[] call FUNC(toggleIfPosition);
*/

private ["_displayName"];

// bail if there is no interface open
if (isNil "cTabIfOpen") exitWith {false};

_displayName = cTabIfOpen select 1;

if ([_displayName] call FUNC(isDialog)) then {
	// reset position to default
	[_displayName,[["dlgIfPosition",[]]],true,true] call FUNC(setSettings);
} else {
	_dspIfPosition = [_displayName,"dspIfPosition"] call FUNC(getSettings);
	// toggle position
	[_displayName,[["dspIfPosition",!_dspIfPosition]]] call FUNC(setSettings);
};

true