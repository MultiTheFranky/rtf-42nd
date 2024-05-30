// cTab - Commander's Tablet with FBCB2 Blue Force Tracking
// Battlefield tablet to access real time intel and blue force tracker.
// By - Riouken
// http://forums.bistudio.com/member.php?64032-Riouken
// You may re-use any of this work as long as you provide credit back to me.
#undef GUI_GRID_H
#define GUI_GRID_H	(0.048)
#undef GUI_GRID_W
#define GUI_GRID_W	(GUI_GRID_H * 3/4)
#undef GUI_GRID_X
#define GUI_GRID_X	(safezoneX + safezoneW * (1 - 0.00675) - GUI_GRID_W)
#undef GUI_GRID_Y
#define GUI_GRID_Y	(safezoneY + safezoneH * 0.25)

class cTab_Mail_ico_disp {
	idd = 13672;
	name= QUOTE(__cTabMailico);
	onLoad = "uiNamespace setVariable ['cTab_Mail_ico_disp', _this select 0]";
	fadein = 0;
	fadeout = 0;
	duration = 10e10;
	controlsBackground[] = {};
	objects[] = {};
	class controls {
		class trin_image {
			idc = 1110;
			type = CT_STATIC;
			style = ST_PICTURE;
			colorBackground[] = { };
			colorText[] = { };
			font = QUOTE(puristaLight);
			sizeEx = 0.053;
			x = QUOTE(GUI_GRID_X);
			y = QUOTE(GUI_GRID_Y);
			w = QUOTE(GUI_GRID_W);
			h = QUOTE(GUI_GRID_H);
			text = QPATHTOF(ui\icon_mail_ca.paa);
		};
	};
};
