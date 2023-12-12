class RscPicture;
class RscStandardDisplay;
class RscDisplayMain: RscStandardDisplay {
    idd = 0;
    scriptName = "RscDisplayMain";
    scriptPath = "GUI";
    onLoad = "[""onLoad"",_this,""RscDisplayMain"",'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay')";
    onUnload = "[""onUnload"",_this,""RscDisplayMain"",'GUI'] call (uinamespace getvariable 'BIS_fnc_initDisplay')";
    class ControlsBackground {
        class Picture: RscPicture {
            idc = 998;
            text = QPATHTOEF(ui,data\background_main_ca.paa);
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls {
        class Logo: RscPicture {
            text = QPATHTOF(data\logo2_rtf42_ca.paa);
            delete tooltip;
            color[] = {0.9,0.9,0.9,1};
            colorActive[] = {1,1,1,1};
            shadow = 0;
            x = "0.5 - 	2.3 * 	(pixelW * pixelGrid * 2)";
            y = "safezoneY + (3 - 0.5 * 	5) * 	(pixelH * pixelGrid * 2)";
            w = "1 * 	5 * 	(pixelW * pixelGrid * 2)";
            h = "1 * 	5 * 	(pixelH * pixelGrid * 2)";
            onKillFocus = "(_this select 0) ctrlsettextcolor [0.9,0.9,0.9,1];";
        };
        delete SpotlightPrev;
        delete SpotlightNext;
        delete Spotlight1;
        delete Spotlight2;
        delete Spotlight3;
        delete BackgroundSpotlightRight;
        delete BackgroundSpotlightLeft;
        delete BackgroundSpotlight;
    };
};
class RscText;
class RscTitles {
    class RscDisplayMainMenuBackground {
        scriptName = "RscDisplayMainMenuBackground";
        scriptPath = "GUI";
        onLoad = "[""onLoad"",_this,""RscDisplayMainMenuBackground"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay')";
        onUnload = "[""onUnload"",_this,""RscDisplayMainMenuBackground"",'GUI'] call 	(uinamespace getvariable 'BIS_fnc_initDisplay');'' call (uinamespace getvariable 'rtf42_music_fnc_stopMusic')";
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 1e+10;
        class Controls {
            class Background: RscText {
                idc = 101;
                colorBackground[] = {0.1,0.1,0.1,1};
                x = "safezoneXAbs";
                y = "-	10";
                w = "safezoneWAbs";
                h = "2 * 	10";
            };
            class BackgroundLeft: Background {
                x = "-	10";
                w = "safezoneX + 	10";
            };
            class BackgroundRight: Background {
                x = "safezoneX + safezoneW";
                w = 10;
            };
            class Picture: RscPicture {
                idc = 102;
                text = QPATHTOEF(ui,data\background_main_ca.paa);
                x = "safezoneX";
                y = "safezoneY";
                w = "safezoneW";
                h = "safezoneH";
            };
        };
    };
};