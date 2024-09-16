#include "..\script_component.hpp"
/*
 * Author: Franky
 * Function to set a random background to a control.
 *
 * Arguments:
 * 0: IDC <NUMBER>
 * 1: Display <DISPLAY>
 * 2: Control <STRING>
 * 3: Random <BOOL>
 * 4: Background <STRING>
 *
 * Example:
 * [1,_displayX, "RscX", false, "backgroundX"] call rtf42_ui_fnc_setRandomBackground
 * [2,_displayY, "RscY", true] call rtf42_ui_fnc_setRandomBackground
 *
 * Public: No
 */

params ["_idc", "_display", "_control", "_random", "_background"];

#define RTF42_BACKGROUND_LOGO QPATHTOF(data\background_main_ca.paa)

with uiNamespace do {
    disableSerialization;
    private _ctrlBackGround = _display displayCtrl _idc;
    _ctrlBackGround ctrlSetText RTF42_BACKGROUND_LOGO;

    // DISABLED BECAUSE RUBI DOESN'T LIKE IT (I WILL NEED TO KILL HIM 😂)
   /*  private _backgroundLast = uiNamespace getVariable "RTF42_BACKGROUND_LAST";

    // Don't return other background if the actual background it's less than 30s
    if (!isNil "_backgroundLast" && {(diag_tickTime - _backgroundLast ) < 30}) exitWith {
        private _background = uiNamespace getVariable "RTF42_BACKGROUND_LAST_BACKGROUND";
        private _ctrlBackGround = _display displayCtrl _idc;
        _ctrlBackGround ctrlSetText (getText (_background >> "path"));
        [_display, _background] call rtf42_ui_fnc_setBackgroundAuthor;
    };

    private _backgrounds = "true" configClasses (configFile >> QGVAR(Backgrounds));

    if (_random) then {
        private _background = selectRandom _backgrounds;
        private _ctrlBackGround = _display displayCtrl _idc;
        _ctrlBackGround ctrlSetText (getText (_background >> "path"));
        [_display, _background] call rtf42_ui_fnc_setBackgroundAuthor;
        uiNamespace setVariable ["RTF42_BACKGROUND_LAST", diag_tickTime];
        uiNamespace setVariable ["RTF42_BACKGROUND_LAST_BACKGROUND", _background];
    } else {
        private _index = -1;
        {
            if (getText (_x >> "name") isEqualTo _background) exitWith {
                _index = _forEachIndex;
            };
        } forEach _backgrounds;
        
        // Background not found so return a random background
        if (_index == -1) exitWith {
            private _background = selectRandom _backgrounds;
            private _ctrlBackGround = _display displayCtrl _idc;
            _ctrlBackGround ctrlSetText (getText (_background >> "path"));
            [_display, _background] call rtf42_ui_fnc_setBackgroundAuthor;
        };

        private _background = _backgrounds select _index;
        private _ctrlBackGround = _display displayCtrl _idc;
        _ctrlBackGround ctrlSetText (getText (_background >> "path"));
        [_display, _background] call rtf42_ui_fnc_setBackgroundAuthor;
        uiNamespace setVariable ["RTF42_BACKGROUND_LAST", diag_tickTime];
        uiNamespace setVariable ["RTF42_BACKGROUND_LAST_BACKGROUND", _background];
    }; */
};
