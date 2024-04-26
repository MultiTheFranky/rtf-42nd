#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to be called when the module is placed on the map to play music 3d on a location
    *
    * Arguments:
    * 0: Logic POS <ARRAY> 
    * 1: Unit <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_logic, _unit] call rtf42_zeus_fnc_generatePlayMusic3D;
    *
    * Public: No
*/

params ["_logicPos", "_unit"];

private _options = [];

private _fileValues = [];
private _fileNames = [];
"true" configClasses (configFile >> "CfgVehicles" >> "rtf42_music_ModuleSound3D" >> "Arguments" >> "File" >> "values") apply {
    _fileValues pushBack (getText (_x >> "value"));
    _fileNames pushBack (getText (_x >> "name"));
};
_options pushBack ["COMBO", "File", [_fileValues, _fileNames, 0]];
_options pushBack ["SLIDER", "Pitch", [0.5, 2, 1]];
_options pushBack ["SLIDER", "Distance", [0, 5000, 500]];
_options pushBack ["SLIDER", "Offset", [0, 100, 0]];
_options pushBack ["CHECKBOX", "Loop", false];

["Play music 3D", _options, {
    private _logic = (createGroup sideLogic) createUnit ["Logic", _this select 1, [], 0, "NONE"];
    private _optionsInternal = _this select 0;
    _logic setVariable ["File", _optionsInternal select 0];
    _logic setVariable ["Pitch", _optionsInternal select 1];
    _logic setVariable ["Distance", _optionsInternal select 2];
    _logic setVariable ["Offset", _optionsInternal select 3];
    _logic setVariable ["Loop", _optionsInternal select 4];
    {
       [_x, [[_logic], true]] remoteExec ["addCuratorEditableObjects", 2];
    } forEach allCurators;
    [_logic] spawn EFUNC(music,playSound3D);
},{},_logicPos] call zen_dialog_fnc_create;
