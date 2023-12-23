#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to get if the unit has an MRE item in his inventory
    *
    * Arguments:
    * 0: Unit <OBJECT>
    *
    * Return Value:
    * 0: Classname of the item <STRING>
    *
    * Example:
    * call rtf42_interrogation_fnc_getMRE;
    *
    * Public: No
*/

params ["_unit"];

private _mreItems = [
    "ACE_MRE_BeefSteak", 
    "ACE_MRE_BeefStew", 
    "ACE_MRE_ChickenTikkaMasala", 
    "ACE_MRE_ChickenHerbDumplings",
    "ACE_MRE_CreamChickenSoup",
    "ACE_MRE_CreamTomatoSoup",
    "ACE_MRE_MeatballsPasta",
    "ACE_MRE_SteakVegetables",
    "ACE_MRE_LambCurry",
    "ACE_Humanitarian_Ration"
];

private _items = items _unit;
private _mreItem = "";

{
    if (_x in _mreItems) then {
        _mreItem = _x;
        break
    };
} forEach _items;

_mreItem