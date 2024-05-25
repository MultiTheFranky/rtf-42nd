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
    private _cards = createHashMapFromArray [
        ["aceshigh",QPATHTOEF(cards,ui\aceshigh.jpg)],
        ["airqrf",QPATHTOEF(cards,ui\airqrf.jpg)],
        ["airsupply",QPATHTOEF(cards,ui\airsupply.jpg)],
        ["angelofdeath",QPATHTOEF(cards,ui\angelofdeath.jpg)],
        ["bigbrother",QPATHTOEF(cards,ui\bigbrother.jpg)],
        ["deathfromabove",QPATHTOEF(cards,ui\deathfromabove.jpg)],
        ["fallguys",QPATHTOEF(cards,ui\fallguys.jpg)],
        ["fob",QPATHTOEF(cards,ui\fob.jpg)],
        ["herecomestheboom",QPATHTOEF(cards,ui\herecomestheboom.jpg)],
        ["medevac",QPATHTOEF(cards,ui\medevac.jpg)],
        ["heavypuncher",QPATHTOEF(cards,ui\heavypuncher.jpg)],
        ["theshield",QPATHTOEF(cards,ui\theshield.jpg)],
        ["vikings",QPATHTOEF(cards,ui\vikings.jpg)],
        ["starlink",QPATHTOEF(cards,ui\starlink.jpg)]
    ];
    private _values = [];
    private _names = [];
    {
        _names pushBack (localize format ["STR_rtf42_zeus_%1", _x]);
        _values pushBack _y;
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
