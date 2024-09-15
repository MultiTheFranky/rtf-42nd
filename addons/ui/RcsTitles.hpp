class RscTitles {
	class RscDisplayMainMenuBackground {
		scriptName = "RscDisplayMainMenuBackground";
		scriptPath = "GUI";
		onLoad = "[""onLoad"",_this,""RscDisplayMainMenuBackground"",'GUI'] call  (uiNamespace getVariable 'BIS_fnc_initDisplay');[102,(_this) select 0,'RscDisplayMainMenuBackground',false,'menu_principal'] call (uiNamespace getVariable 'rtf42_ui_fnc_setRandomBackground');";
		onUnload = "[""onUnload"",_this,""RscDisplayMainMenuBackground"",'GUI'] call  (uiNamespace getVariable 'BIS_fnc_initDisplay')";
		idd = -1;
		fadein = 2;
		fadeout = 2;
		duration = 1e+10;
		class Controls {
			class Background: RscText {
				idc = 101;
				colorBackground[] = {0.1,0.1,0.1,0};
				x = "safezoneXAbs";
				y = "- 10";
				w = "safezoneWAbs";
				h = "2 *  10";
			};
			class BackgroundLeft: Background {
				x = "- 10";
				w = "safezoneX +  10";
			};
			class BackgroundRight: Background {
				x = "safezoneX + safezoneW";
				w = 10;
			};
			class Picture: RscPicture {
				idc = 102;
				text = "";
				x = "safezoneX";
				y = "safezoneY";
				w = "safezoneW";
				h = "safezoneH";
			};
		};
	};
	class SplashNoise {
		onLoad = "[2] call compile preprocessfilelinenumbers gettext (configFile >> 'CfgFunctions' >> 'init'); [1,(_this) select 0,'SplashNoise',true] call (uiNamespace getVariable 'rtf42_ui_fnc_setRandomBackground')";
		idd = -1;
		movingEnable = 0;
		duration = 11;
		fadein = 2;
		fadeout = 2;
		controls[] = {"BackgroundNoise"};
		class BackgroundNoise: RscPicture {
			idc = 1;
			text = "";
			colorText[] = {1,1,1,0.7};
			x = "safezoneXAbs";
			y = "safezoneY";
			w = "safezoneWAbs";
			h = "safezoneH";
		};
	};
	class SplashBohemia {
		idd = -1;
		movingEnable = 0;
		duration = 0;
		fadein = 0;
		fadeout = 0;
		name = "";
		controls[] = {"Picture","TextPresents"};
		class Picture: RscPicture {
			idc = 1200;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (48 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (31.7 *   (0.025 * SafezoneH)) / 2";
			w = "48 *   (0.01875 * SafezoneH)";
			h = "24 *   (0.025 * SafezoneH)";
		};
		class TextPresents: RscText {
			idc = 1000;
			text = "";
			style = 2;
			sizeEx = "0.03*SafezoneH";
			shadow = 0;
			x = "SafeZoneX + SafeZoneW / 2 - (46.5 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH - (0.505 * SafezoneH)";
			w = "48 *   (0.01875 * SafezoneH)";
			h = "0.03 * SafezoneH";
		};
	};
	class SplashArma3 {
		idd = -1;
		movingEnable = 0;
		duration = 3;
		fadein = 2;
		fadeout = 2;
		name = "";
		controls[] = {"Picture"};
		class Picture: RscPicture {
			idc = 1200;
			text = "";
			x = "0.5 - 10 *   (0.01875 * SafezoneH)";
			y = "0.5 - 6 *   (0.025 * SafezoneH)";
			w = "20 *   (0.01875 * SafezoneH)";
			h = "10 *   (0.025 * SafezoneH)";
		};
	};
	class SplashArma3Apex: SplashArma3 {
		class Picture: Picture {
			text = "";
			y = "0.5 - 7 *   (0.025 * SafezoneH)";
		};
	};
	class SplashArma3Lite {
		idd = -1;
		movingEnable = 0;
		duration = 3;
		fadein = 2;
		fadeout = 2;
		controls[] = {"Picture","Tagline"};
		class Picture: RscPicture {
			idc = 1200;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (20 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (17 *   (0.025 * SafezoneH)) / 2";
			w = "20 *   (0.01875 * SafezoneH)";
			h = "10 *   (0.025 * SafezoneH)";
		};
		class Tagline: RscPicture {
			idc = 1201;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (16.1 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (2.9 *   (0.025 * SafezoneH)) / 2";
			w = "16.1 *   (0.01875 * SafezoneH)";
			h = "8.05 *   (0.025 * SafezoneH)";
		};
		
	};
	class SplashTagline {
		idd = -1;
		movingEnable = 0;
		duration = 3;
		fadein = 2;
		fadeout = 2;
		name = "$STR_A3_SplashTagline_0";
		controls[] = {"Picture"};
		class Picture: RscPicture {
			idc = 1200;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (48 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (31.7 *   (0.025 * SafezoneH)) / 2";
			w = "48 *   (0.01875 * SafezoneH)";
			h = "24 *   (0.025 * SafezoneH)";
		};
	};
	class SplashESRB {
		idd = -1;
		movingEnable = 0;
		duration = 5;
		fadein = 2;
		fadeout = 2;
		name = "$STR_A3_SplashESRB_0";
		controls[] = {"Picture"};
		class Picture: RscPicture
		{
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (72 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (36 *   (0.025 * SafezoneH)) / 2";
			w = "72 *   (0.01875 * SafezoneH)";
			h = "36 *   (0.025 * SafezoneH)";
		};
	};
	class SplashCopyright {
		idd = -1;
		movingEnable = 0;
		duration = 5;
		fadein = 2;
		fadeout = 2;
		name = "$STR_A3_SplashCopyright_0";
		controls[] = {"PictureA3Logo","PictureBIlogo","PicturePhysXLogo","LegalText"};
		class PictureA3Logo: RscPicture {
			idc = 1200;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (36 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (13.7 *   (0.025 * SafezoneH)) / 2";
			w = "8 *   (0.01875 * SafezoneH)";
			h = "4 *   (0.025 * SafezoneH)";
		};
		class PictureBIlogo: RscPicture {
			idc = 1201;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 - (33 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (25.7 *   (0.025 * SafezoneH)) / 2";
			w = "32 *   (0.01875 * SafezoneH)";
			h = "16 *   (0.025 * SafezoneH)";
		};
		class PicturePhysXLogo: RscPicture {
			idc = 1202;
			text = "";
			x = "SafeZoneX + SafeZoneW / 2 + (16.5 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH / 2 - (13.6 *   (0.025 * SafezoneH)) / 2";
			w = "16 *   (0.01875 * SafezoneH)";
			h = "4 *   (0.025 * SafezoneH)";
		};
		class LegalText: RscStructuredText {
			idc = -1;
			text = "327th Star Corps";
			size = "0.02 * SafezoneH";
			shadow = 0;
			x = "SafeZoneX + SafeZoneW / 2 - (50 *   (0.01875 * SafezoneH)) / 2";
			y = "SafeZoneY + SafeZoneH - (0.38 * SafezoneH)";
			w = "50 *   (0.01875 * SafezoneH)";
			h = "0.39 * SafezoneH";
			class Attributes {
				align = "center";
				shadow = 0;
			};
		};
	};
};