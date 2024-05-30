#include "..\script_component.hpp"
/*
	Name: FUNC(close)
	
	Author(s):
		Gundy
	
	Description:
		Initiates the closing of currently open interface
	
	Parameters:
		No Parameters
	
	Returns:
		BOOLEAN - TRUE
	
	Example:
		[] call FUNC(close);
*/

private ["_displayName","_display"];

if !(isNil "cTabIfOpen") then {
	// [_ifType,_displayName,_player,_playerKilledEhId,_vehicle,_vehicleGetOutEhId]
	_displayName = cTabIfOpen select 1;
	_display = uiNamespace getVariable _displayName;
	
	_display closeDisplay 0;
	if !([_displayName] call FUNC(isDialog)) then {
		[] call FUNC(onIfclose);
	};
};

true