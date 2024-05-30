#include "..\script_component.hpp"
/*
 	Name: FUNC(toggleMapTools)
 	
 	Author(s):
		Gundy

 	Description:
		Toggle drawing of map tools
		
	
	Parameters:
		0: STRING - Name of uiNamespace variable for interface
 	
 	Returns:
		BOOLEAN - Draw map tools
 	
 	Example:
		cTabDrawMapTools = call FUNC(toggleMapTools);
*/

private ["_displayName","_currentMapTools","_newMapTools"];

_displayName = _this select 0;
_currentMapTools = [_displayName,"mapTools"] call FUNC(getSettings);
_newMapTools = [true, false] select (_currentMapTools);
[_displayName,[["mapTools",_newMapTools]]] call FUNC(setSettings);
_newMapTools