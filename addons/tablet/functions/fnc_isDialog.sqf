#include "..\script_component.hpp"
/*
 	Name: FUNC(isDialog)
 	
 	Author(s):
		Gundy

 	Description:
		Check if interface name ends with "dlg"
	
	Parameters:
		0: Name of interface
 	
 	Returns:
		BOOLEAN - True if interface name ends with "dlg"
 	
 	Example:
 		// returns true
		["cTab_Tablet_dlg"] call FUNC(isDialog);
		
		// returns false
		["cTab_TAD_dsp"] call FUNC(isDialog);
*/

private ["_interfaceName","_subArray"];

_interfaceName = _this select 0;

// select the last three characters from the interface name
_subString = _interfaceName select [(count _interfaceName) - 3];

[false, true] select (_subString == "dlg")