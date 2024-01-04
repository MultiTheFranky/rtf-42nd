#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to show to the player the text of the unit in the chat
    *
    * Arguments:
    * 0: Unit <OBJECT>
    * 1: Text <STRING>
    *
    * Return Value:
    * None
    *
    * Example:
    * [franky] call rtf42_interrogation_fnc_talk;
    *
    * Public: No
*/

params ["_unit", "_text"];

systemChat format ["%1: %2", LLSTRING(CivilDisplayName), _text];
_unit setRandomLip true;
sleep 3;
_unit setRandomLip false;