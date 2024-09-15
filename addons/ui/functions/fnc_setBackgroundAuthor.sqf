#include "..\script_component.hpp"
/*
 * Author: Franky
 * Function to create a control for the author text of the background.
 *
 * Arguments:
 * 0: Display <DISPLAY>
 * 1: Background <CONFIG>
 *
 * Example:
 * [_displayX, <BackgroundConfig>] call rtf42_ui_fnc_setBackgroundAuthor
 *
 * Public: No
 */

params ["_display", "_background"];

#define RTF42_BACKGROUND_INFO_IDC 9998
#define RTF42_BACKGROUND_INFO_CLASS "RscStructuredText"

private _ctrlBackgroundInfo = _display displayCtrl RTF42_BACKGROUND_INFO_IDC;
if (isNull _ctrlBackgroundInfo) then {
    private _ctrlBackgroundInfo = _display ctrlCreate [RTF42_BACKGROUND_INFO_CLASS, RTF42_BACKGROUND_INFO_IDC];
    _ctrlBackgroundInfo ctrlSetFont "CaptureIt";
    _ctrlBackgroundInfo ctrlSetFontHeight 0.05;
    _ctrlBackgroundInfo ctrlSetPosition [
        safeZoneX + safeZoneW - 0.4,
        safeZoneY + safeZoneH - 1.7,
        0.4,
        0.4
    ];
    _ctrlBackgroundInfo ctrlSetTextColor [1,1,1,1];
    _ctrlBackgroundInfo ctrlSetStructuredText parseText format ["<t size='3'><img size='3' shadow='2' color='#99ffffff' valign='top' align='center' image='%1'/><br/><t size='1' underline='1' valign='middle' align='center' font='CaptureIt' color='#ffffff' shadow='2'>%2</t><br/><t size='0.5' align='center' valign='bottom' font='CaptureIt' color='#99ffffff' shadow='2'>%3</t></t>",QPATHTOF(data\logo_rtf42_ca.paa), (getText (_background >> "name")) splitString " " joinString toString [160], (getText (_background >> "author"))];
    _ctrlBackgroundInfo ctrlEnable true;
    _ctrlBackgroundInfo ctrlShow true;
    _ctrlBackgroundInfo ctrlCommit 0;
} else {
    _ctrlBackgroundInfo ctrlEnable true;
    _ctrlBackgroundInfo ctrlShow true;
    _ctrlBackgroundInfo ctrlSetStructuredText parseText format ["<t size='3'><img size='3' shadow='2' color='#99ffffff' valign='top' align='center' image='%1'/><br/><t size='1' underline='1' valign='middle' align='center' font='CaptureIt' color='#ffffff' shadow='2'>%2</t><br/><t size='0.5' align='center' valign='bottom' font='CaptureIt' color='#99ffffff' shadow='2'>%3</t></t>",QPATHTOF(data\logo_rtf42_ca.paa), (getText (_background >> "name")) splitString " " joinString toString [160], (getText (_background >> "author"))];
    _ctrlBackgroundInfo ctrlCommit 0;
};