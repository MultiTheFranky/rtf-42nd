#include "..\script_component.hpp"
/*
 * Author: Franky
 * Function to create a control for the user to add a password to connect to the server.
 *
 * Arguments:
 * 0: Control - Control of the display
 * Example:
 * [_control] call rtf42_ui_fnc_connectToServer
 *
 * Public: No
 */

#define RTF42_CONNECTSERVER_CLASS "RscDisplayPassword"

params ["_control"];
with uiNamespace do {
    disableSerialization;
    private _parentDisplay = ctrlParent _control;
    private _passwordDisplay = _parentDisplay createDisplay RTF42_CONNECTSERVER_CLASS;
    private _ctrlButtonOk = _passwordDisplay displayCtrl 1;
    _ctrlButtonOk ctrlAddEventHandler ["ButtonClick", {
        params ["_ctrl"];
        private _parentDisplay = ctrlParent _ctrl;
        private _passwordDisplay = _parentDisplay displayCtrl 101;
        private _password = ctrlText (_passwordDisplay);
        connectToServer ['arma3.multithefranky.com', 2302, _password];
    }];
};