#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to hide the GPS in the HUD, it can be used on map
    *
    * Arguments:
    * 0: <OBJECT> Unit to hide the GPS
    *
    * Return Value:
    * None
    *
    * Example:
    * _unit call rtf42_ui_fnc_hideGPS;
    *
    * Public: No
*/

_unit enableInfoPanelComponent ["left","MinimapDisplay",false];
_unit enableInfoPanelComponent ["right","MinimapDisplay",false];
