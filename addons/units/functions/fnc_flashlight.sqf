#include "..\script_component.hpp"

/*
        * Author: Franky & ZEN Mod team
        * Function to add a flashlight to a unit's weapon if the unit does not already have one. 
        * Partially based on https://github.com/zen-mod/ZEN/blob/master/addons/modules/functions/fnc_moduleToggleFlashlights.sqf
        *
        * Arguments:
        * 0: Unit <OBJECT>
        *
        * Return Value:
        * None
        *
        * Example:
        * [franky] call rtf42_unit_fnc_flashlight;
        *
        * Public: No
*/

params ["_unit"];

if (side _unit == opfor) then {
    private _cfgWeapons = configFile >> "CfgWeapons";
    private _weapon = currentWeapon _unit;
    private _pointer = _unit weaponAccessories _weapon select 1;

    // Add gear to the unit if enabled and the unit does not already have a flashlight
    if (_weapon != ""
    && {
        _pointer == "" || {
            getNumber (_cfgWeapons >> _pointer >> "ItemInfo" >> "FlashLight" >> "size") <= 0
        }
    }) then {
        // Get all compatible flashlight items for the unit's weapon
        private _flashlights = [_weapon, "pointer"] call CBA_fnc_compatibleItems select {
            getNumber (_cfgWeapons >> _x >> "ItemInfo" >> "FlashLight" >> "size") > 0
        };

        // Exit if the unit's weapon has no compatible flashlight items
        if (_flashlights isEqualTo []) exitWith {};

        // Add a random flashlight to the unit's weapon
        [_unit, [_weapon, selectRandom _flashlights]] remoteExec ["addWeaponItem", _unit];

        // If is night, turn on the flashlight
        if (sunOrMoon == 0) then {
            [_unit, "ForceOn"] remoteExec ["enableGunLights", _unit];
        };
    };
};