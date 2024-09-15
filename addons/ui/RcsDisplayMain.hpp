class RscDisplayMain: RscStandardDisplay {
    idd = 0;
    onLoad = "[""onLoad"",_this,""RscDisplayMain"",'GUI'] call (uiNamespace getVariable 'rtf42_ui_fnc_displayMain');[998,(_this) select 0,'RscDisplayMain',true] call (uiNamespace getVariable 'rtf42_ui_fnc_setRandomBackground');";
    onUnload = "[""onUnload"",_this,""RscDisplayMain"",'GUI'] call (uiNamespace getVariable 'rtf42_ui_fnc_displayMain')";
    class ControlsBackground {
        class MouseArea: RscText {
            idc = 999;
            style = 16;
            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
        class BackgroundLeft: RscText {
            colorBackground[] = {0.1,0.1,0.1,1};
            x = "-	10";
            y = "-	10";
            w = "safezoneX + 	10";
            h = "2 * 	10";
        };
        class BackgroundRight: BackgroundLeft {
            x = "safezoneX + safezoneW";
            w = 10;
        };
        class Picture: RscPicture {
            idc = 998;
            text = QPATHTOF(data\background_main_ca.paa);
            x = "safezoneX - 0.05";
            y = "safezoneY";
            w = "safezoneW + 0.1";
            h = "safezoneH";
        };
    };
    class Controls {
        class Logo: RscActivePicture {
            text = QPATHTOF(data\logo_rtf42_ca.paa);
            tooltip = "Connect to the 42nd R.T.F. server";
            onButtonClick = "[_this select 0] call (uiNamespace getVariable 'rtf42_ui_fnc_connectToServer')";
			soundClick[] = {};
			soundEnter[] = {};
            onLoad = "";
            color[] = {0.9,0.9,0.9,1};
            colorActive[] = {1,1,1,1};
            shadow = 0;
            x = "0.5 - 	2.3 * 	(pixelW * pixelGrid * 2)";
            y = "safezoneY + (3 - 0.5 * 	5) * 	(pixelH * pixelGrid * 2)";
            w = "1 * 	5 * 	(pixelW * pixelGrid * 2)";
            h = "1 * 	5 * 	(pixelH * pixelGrid * 2)";
        };
        class LogoApex: Logo {};
        delete SpotlightNext;
        delete SpotlightPrev;
        delete Spotlight1;
        delete Spotlight2;
        delete Spotlight3;
        delete BackgroundSpotlightRight;
        delete BackgroundSpotlightLeft;
        delete BackgroundSpotlight;
    };
};