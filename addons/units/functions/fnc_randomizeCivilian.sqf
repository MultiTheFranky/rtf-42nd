#include "..\script_component.hpp"

/*
        * Author: Franky
        * Function to randomize civilian units.
        *
        * Arguments:
        * 0: Unit <OBJECT>
        *
        * Return Value:
        * None
        *
        * Example:
        * [franky] call rtf42_unit_fnc_randomizeCivilian;
        *
        * Public: No
*/

params ["_unit"];

if (!local _unit) exitWith {};

// Get unit information
private _baseConfig = configFile >> "CfgVehicles" >> typeOf _unit;

private _headgear = selectRandom (getArray (_baseConfig >> QGVAR(headgear)));
private _uniform = selectRandom (getArray (_baseConfig >> QGVAR(uniform)));
private _vest = selectRandom (getArray (_baseConfig >> QGVAR(vest)));
private _facewear = selectRandom (getArray (_baseConfig >> QGVAR(facewear)));
private _nvggoggle = selectRandom (getArray (_baseConfig >> QGVAR(nvggoggle)));
private _item = selectRandom (getArray (_baseConfig >> QGVAR(item)));
private _face = selectRandom (getArray (_baseConfig >> QGVAR(face)));

// Set unit information
if (_face isNotEqualTo "") then {_unit setFace _face};

[_unit,_headgear, _uniform, _vest, _facewear, _nvggoggle, _item] spawn {
        sleep 0.01;
        params ["_unit","_headgear", "_uniform", "_vest", "_facewear", "_nvggoggle", "_item"];
        if (_headgear isNotEqualTo "") then {_unit addHeadgear _headgear};
        if (_uniform isNotEqualTo "") then {_unit forceAddUniform _uniform};
        if (_vest isNotEqualTo "") then {_unit addVest _vest};
        if (_facewear isNotEqualTo "") then {_unit addGoggles _facewear};
        if (_nvggoggle isNotEqualTo "") then {_unit addItem _nvggoggle;_unit assignItem _nvggoggle};
        if (_item isNotEqualTo "") then {_unit addItem _item};
};

