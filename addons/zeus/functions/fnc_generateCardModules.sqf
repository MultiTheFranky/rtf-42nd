#include "..\script_component.hpp"

/*
    * Author: Franky
    * Function to generate all the zeus modules for the cards
    *
    * Arguments:
    * None
    *
    * Return Value:
    * None
    *
    * Example:
    * [] call rtf42_zeus_fnc_generateCardModules;
    *
    * Public: No
*/


["RTF42 Cards", LLSTRING(HintCard), {
    private _cards = [] call EFUNC(ui,getListOfCards);
    private _values = [];
    private _names = [];
    {
        _x params ["_className", "_displayName", "_imagePath"];
        _names pushBack _displayName;
        _values pushBack _imagePath;
    } forEach _cards;
    [LLSTRING(HintCard), [["LIST", "CARDS",[
        _values,
        _names,
        0,
        5
    ]]],
    {
        params ["_option"];
        private _value = _option select 0;
        [_value] call EFUNC(cards,seeCardGlobal);
    }] call zen_dialog_fnc_create;
}, QPATHTOEF(items,ui\icon_cards_ca.paa)] call zen_custom_modules_fnc_register;
