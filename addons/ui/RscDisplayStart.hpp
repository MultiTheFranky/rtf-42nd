class RscDisplayStart: RscStandardDisplay {
    onLoad = "[2] call compile preprocessfilelinenumbers gettext (configFile >> 'CfgFunctions' >> 'init');['onLoad',_this,'RscDisplayLoading','Loading'] call (uiNamespace getVariable 'BIS_fnc_initDisplay');[1201,(_this) select 0,'RscDisplayStart',true] call (uiNamespace getVariable 'rtf42_ui_fnc_setRandomBackground');";
    onUnload = "['onUnload',_this,'RscDisplayLoading'] call (uiNamespace getVariable 'BIS_fnc_initDisplay')";
    class controlsBackground {
        class CA_Vignette: RscVignette {
            colorText[] = {0,0,0,1};
        };
        class Map: RscPicture {
            idc = 999;
            text = "#(argb,8,8,3)color(0,0,0,1)";
            colorText[] = {1,1,1,0.1};
            x = "safezoneX";
            y = "safezoneY - (safezoneW * 4/3) / 4";
            w = "safezoneW";
            h = "safezoneW * 4/3";
        };
        class Noise: RscPicture {
            idc = 1202;
            text = "";
            colorText[] = {1,1,1,0.9};
            x = "safezoneX";
            y = "safezoneY";
            w = "safezoneW";
            h = "safezoneH";
        };
    };
    class controls {
        delete Text;
        delete Progress;
        delete Progress2;
        delete Title;
        delete Name;
        delete Briefing;
        delete Date;
        delete Logo3DEN;
        delete Mission;
        delete Disclaimer;
        delete MapBackTop;
        delete MapName;
        delete ProgressNameMap;
        delete ProgressNameMission;
        delete MapAuthor;
        delete MapBackBottom;
        delete MapDescription;
        delete ProgressMap;
        delete ProgressMission;
        delete LoadingStart;
        class LoadingStart: RscControlsGroup {
            idc = 2310;
            x = "0 * safezoneW + safezoneX";
            y = "0 * safezoneH + safezoneY";
            w = "1 * safezoneW";
            h = "1 * safezoneH";
            class controls {
                class Black: RscText {
                    idc = 1000;
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                    colorBackground[] = {0,0,0,1};
                };
                class Noise: RscPicture {
                    idc = 1201;
                    text = "";
                    x = "0 * safezoneW";
                    y = "0 * safezoneH";
                    w = "1 * safezoneW";
                    h = "1 * safezoneH";
                };
            };
        };
    };
};