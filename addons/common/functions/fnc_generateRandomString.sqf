#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to generate a random string
    *
    * Arguments:
    * 0: <NUMBER> Length of the string
    *
    * Return Value:
    * <STRING> Random string
    *
    * Example:
    * 12 call rtf42_common_fnc_generateRandomString;
    *
    * Public: No
*/

params ["_length"];

private _randomString = "";

for "_i" from 1 to _length do {
    _randomString = _randomString + toString [(floor (random [1, 256, 512]))];
};

_randomString;