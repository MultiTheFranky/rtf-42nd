#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to be called when the module is placed on the map to set a unit to be an informant and set the answers to the questions.
    *
    * Arguments:
    * 0: Logic <LOGIC>
    * 1: Unit <OBJECT>
    *
    * Return Value:
    * None
    *
    * Example:
    * [_logic, _unit] call rtf42_zeus_fnc_setInformantWithAnswers;
    *
    * Public: No
*/

params ["_logic", "_unit"];

private _options = [];
private _numberOfAnswers = 5;
for "_i" from 1 to _numberOfAnswers do {
    _options pushBack ["EDIT", format ["Answer %1", _i], ""];
    _options pushBack ["SLIDER:PERCENT", format ["Answer Success", _i], [0, 1, 0.5]];
};

["Answers", _options, {
    private _unit = _this select 1;
    private _optionsInternal = _this select 0;
    private _hashMap = createHashMap;
    for [{ _i = 0 }, { _i < (count _optionsInternal) }, { _i = _i + 2 }] do {
        _hashMap set [_optionsInternal select _i, _optionsInternal select (_i + 1)];
    };
    [_unit,_hashMap] call EFUNC(interrogation,setInformant);
},{},_unit] call zen_dialog_fnc_create;
