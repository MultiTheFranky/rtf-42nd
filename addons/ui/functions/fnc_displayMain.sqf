#include "\a3\Ui_f\hpp\defineResincl.inc"
#include "\a3\Ui_f\hpp\defineResinclDesign.inc"
#include "\a3\Ui_f\hpp\defineDIKCodes.inc"

#define MENU_TIME  0.2
//--- Delay before another spotlight rolls in
#define SPOTLIGHT_DELAY  10
//--- Commit time of spotlight change animation
#define SPOTLIGHT_MOVE  0.7
//--- Commit time of spotlight change animation when triggered manually
#define SPOTLIGHT_MOVE_USER 0.3
//--- Commit time of spotlight button when appearing
#define SPOTLIGHT_BUTTON_IN 0.1
//--- Commit time of spotlight button when disappearing
#define SPOTLIGHT_BUTTON_OUT 0.3
//--- Spotlight picture zoom on hover (disabled at this moment)
#define SPOTLIGHT_ZOOM  1.2
//--- Commit time of the zoom animation (disabled at this moment)
#define SPOTLIGHT_TIME  0.1

disableSerialization;
private _mode = _this select 0;
private _params = _this select 1;
private _class = _this select 2;

switch _mode do
{
    //--- Main menu display is loaded at start of the game and when returning from the profile menu
    case "onLoad":
    {
        _display = _params select 0;

        //--- When pixelGrid command is unavailable, set a replacement variable and redraw. For use with an older EXE.
        if (count supportInfo "n:pixelGrid" == 0) then {
            {
                _ctrl = _x select 0;
                _cfg = _x select 1;
                if !(isNull (_cfg >> "sizeEx")) then {
                    _ctrl ctrlSetFontHeight (if (isNumber (_cfg >> "sizeEx")) then {getNumber (_cfg >> "sizeEx")} else {call compile getText (_cfg >> "sizeEx")});
                };
                if (ctrlType _ctrl in [13,16]) then {
                    _ctrl ctrlSetTooltip toUpper getText (_cfg >> "text")
                };
                _ctrl ctrlSetPosition [
                    if (isNumber (_cfg >> "x")) then {getNumber (_cfg >> "x")} else {call compile getText (_cfg >> "x")},
                    if (isNumber (_cfg >> "y")) then {getNumber (_cfg >> "y")} else {call compile getText (_cfg >> "y")},
                    if (isNumber (_cfg >> "w")) then {getNumber (_cfg >> "w")} else {call compile getText (_cfg >> "w")},
                    if (isNumber (_cfg >> "h")) then {getNumber (_cfg >> "h")} else {call compile getText (_cfg >> "h")}
                ];
                _ctrl ctrlCommit 0;
            } forEach ([_display,configFile >> "RscDisplayMain"] call bis_fnc_controlConfigs);

            _ctrlWarning = _display ctrlCreate ["RscStructuredText",-1];
            _ctrlWarning ctrlSetPosition [0,0.8,1,0.1];
            _ctrlWarning ctrlCommit 0;
            _ctrlWarning ctrlSetStructuredText parseText "<t align='center'>MAIN MENU IS NOT DISPLAYED CORRECTLY BECAUSE OLDER EXE IS USED.<br />NAVIGATE BY TOOLTIPS.</t>";
            _ctrlWarning ctrlSetTextColor [1,0.5,0,1];
        };

        //--- Reset grey background when returning from the profile menu (cutscene didn't actually change)
        missionNamespace setVariable ["RscDisplayMain_grey",true];

        //--- System init
        with uiNamespace do {

            //--- Get colors and grids
            true call bis_fnc_displayColorGet;
            false call bis_fnc_guiGridToProfile;

            //--- Apply colors to main menu
            [configFile >> _class,_display] call bis_fnc_displayColorSet;
        };

        //--- Menu Bar Init
        {
            _ctrlGroup = _display displayCtrl (_x select 0);
            _ctrlGroupPos = ctrlPosition _ctrlGroup;
            _ctrlTitle = _display displayCtrl (_x select 1);
            _ctrlTitleIcon = _display displayCtrl (_x select 2);
            {
                _handler = _x;
                {
                    _x ctrlAddEventHandler [
                        _handler,
                        format ["with uiNamespace do {['menuEnter',[_this select 0,%1],''] call RscDisplayMain_script;};",_ctrlGroupPos select 3]
                    ];
                } forEach [_ctrlTitle,_ctrlTitleIcon];
            } forEach ["MouseEnter","SetFocus"];

            _ctrlGroupPos set [3,0];
            _ctrlGroup ctrlSetPosition _ctrlGroupPos;
            _ctrlGroup ctrlCommit 0;
        } forEach [
            [IDC_MAIN_GROUP_SINGLEPLAYER, IDC_MAIN_TITLE_SINGLEPLAYER, IDC_MAIN_TITLEICON_SINGLEPLAYER],
            [IDC_MAIN_GROUP_MULTIPLAYER, IDC_MAIN_TITLE_MULTIPLAYER, IDC_MAIN_TITLEICON_MULTIPLAYER],
            [IDC_MAIN_GROUP_TUTORIALS, IDC_MAIN_TITLE_TUTORIALS, IDC_MAIN_TITLEICON_TUTORIALS],
            [IDC_MAIN_GROUP_OPTIONS, IDC_MAIN_TITLE_OPTIONS,  IDC_MAIN_TITLEICON_OPTIONS],
            [IDC_MAIN_GROUP_SESSION, IDC_MAIN_TITLE_SESSION,  IDC_MAIN_TITLEICON_SESSION]
        ];

        //--- Info panels
        {
            _ctrlInfo = _display displayCtrl _x;
            {
                _ctrlButton = _ctrlInfo controlsGroupCtrl _x;
                _ctrlButton ctrlAddEventHandler ["MouseEnter",{with uiNamespace do {["infoEnter",_this,""] call RscDisplayMain_script;};}];
                _ctrlButton ctrlAddEventHandler ["SetFocus",{with uiNamespace do {["infoEnter",_this,""] call RscDisplayMain_script;};}];
                _ctrlButton ctrlAddEventHandler ["MouseExit",{with uiNamespace do {["infoExit",_this,""] call RscDisplayMain_script;};}];
                _ctrlButton ctrlAddEventHandler ["KillFocus",{with uiNamespace do {["infoExit",_this,""] call RscDisplayMain_script;};}];
                _ctrlButton ctrlAddEventHandler ["ButtonClick",{with uiNamespace do {["infoClick",_this,""] call RscDisplayMain_script;};}];
            } forEach [
                IDC_MAIN_INFO_BUTTON,
                IDC_MAIN_INFO_BUTTON_DEV
            ];
        } forEach [
            IDC_MAIN_INFO_MODS,
            IDC_MAIN_INFO_DLCS,
            IDC_MAIN_INFO_DLCSOWNED,
            IDC_MAIN_INFO_NEWS,
            IDC_MAIN_INFO_VERSION
        ];

        //--- Version
        _ctrlInfoVersion = _display displayCtrl IDC_MAIN_INFO_VERSION;
        _ctrlInfoVersionButton = _ctrlInfoVersion controlsGroupCtrl IDC_MAIN_INFO_BUTTON;
        _ctrlInfoVersionButtonDev = _ctrlInfoVersion controlsGroupCtrl IDC_MAIN_INFO_BUTTON_DEV;

        //--- Dev version
        _versionBuild = productVersion select 4;
        _version = productVersion select 2;
        if (_versionBuild == "Development") then {
            _version = productVersion select 3;
            _versionName = if (cheatsEnabled) then {localize "STR_A3_RscDisplayMain_Version_Internal"} else {localize "STR_A3_RSCDISPLAY_LOADING_DEV"};

            _ctrlVersion = _display displayCtrl IDC_MAIN_VERSION;
            _ctrlVersion ctrlShow false;

            _ctrlVersionDev = _display displayCtrl IDC_MAIN_VERSION_DEV;
            _ctrlVersionDev ctrlShow true;
            _ctrlVersionDev ctrlSetText format ["%1\n%2",_versionName,ctrlText _ctrlVersion];

            _ctrlInfoVersionButton ctrlShow false;
            _ctrlInfoVersionButtonDev ctrlShow true;
        };

        //--- New version
        if (_version != profileNamespace getVariable ["RscDisplayMain_version" + _versionBuild,0]) then {
            _ctrlInfoVersionNotification = _ctrlInfoVersion controlsGroupCtrl IDC_MAIN_INFO_NOTIFICATION;
            _ctrlInfoVersionNotification ctrlShow true;
            _ctrlInfoVersionButton ctrlSetTooltip format ["%1\n%2",localize "STR_A3_RscDisplayMain_InfoVersion_New_tooltip",localize "STR_A3_RscDisplayMain_InfoVersion_tooltip"];
            _ctrlInfoVersionButtonDev ctrlSetTooltip format ["%1\n%2",localize "STR_A3_RscDisplayMain_InfoVersion_New_tooltip",localize "STR_A3_RscDisplayMain_InfoVersion_tooltip"];
        };

        //--- Mouse Area Init
        _ctrlMouseArea = _display displayCtrl IDC_MAIN_MOUSEAREA;
        //_ctrlMouseArea ctrlAddEventHandler ["MouseEnter",{with uiNamespace do {["menuClear",[ctrlParent (_this select 0),0],""] call RscDisplayMain_script;};}];
        _ctrlMouseArea ctrlAddEventHandler ["MouseButtonDown",{with uiNamespace do {["menuClear",[ctrlParent (_this select 0),0],""] call RscDisplayMain_script;};}];
        //["refresh",[_display],""] call RscDisplayMain_script;

        //--- Close menu when focus is set to any non-menu element apart from the mouse area
        _menuControlIDCs = [
            IDC_MAIN_GROUP_SINGLEPLAYER,
            IDC_MAIN_GROUP_MULTIPLAYER,
            IDC_MAIN_GROUP_TUTORIALS,
            IDC_MAIN_GROUP_OPTIONS,
            IDC_MAIN_GROUP_SESSION,

            IDC_MAIN_TITLE_SINGLEPLAYER,
            IDC_MAIN_TITLE_MULTIPLAYER,
            IDC_MAIN_TITLE_TUTORIALS,
            IDC_MAIN_TITLE_OPTIONS,
            IDC_MAIN_TITLE_SESSION,

            IDC_MAIN_TITLEICON_SINGLEPLAYER,
            IDC_MAIN_TITLEICON_MULTIPLAYER,
            IDC_MAIN_TITLEICON_TUTORIALS,
            IDC_MAIN_TITLEICON_OPTIONS,
            IDC_MAIN_TITLEICON_SESSION
        ];
        {
            if (!(ctrlIDC _x in _menuControlIDCs) && !(ctrlIDC (ctrlParentControlsGroup _x) in _menuControlIDCs)) then {
                _x ctrlAddEventHandler ["MouseEnter",{with uiNamespace do {["menuClear",[ctrlParent (_this select 0),0],""] call RscDisplayMain_script;};}];
                _x ctrlAddEventHandler ["SetFocus",{with uiNamespace do {["menuClear",[ctrlParent (_this select 0),0],""] call RscDisplayMain_script;};}];
            };
        } forEach (allControls _display - [_ctrlMouseArea]);

        //--- Init event handlers
        _display displayAddEventHandler ["ChildDestroyed",{with uiNamespace do {["refresh",_this,""] call RscDisplayMain_script;}}];
        //_display displayAddEventHandler ["keydown",{with uiNamespace do {["keyDown",_this,""] call RscDisplayMain_script;}}];
        _display displayAddEventHandler ["MouseMoving",{with uiNamespace do {["MouseMoving",_this,""] call RscDisplayMain_script;}}];
        _display displayAddEventHandler ["MouseHolding",{with uiNamespace do {["MouseMoving",_this,""] call RscDisplayMain_script;}}];
        _display displayAddEventHandler ["ChildDestroyed","with uiNamespace do {['ChildDestroyed',_this,''] call RscDisplayMain_script;};"];
    };

    case "refresh": {
        _display = _params select 0;
        _ctrlGroupSpotlight1 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_1;
        _ctrlGroupSpotlight2 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_2;
        _ctrlGroupSpotlight3 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_3;

        //--- When screen is too small, show menu bar icons, not texts
        _ctrlTitleOptions = _Display displayCtrl IDC_MAIN_TITLE_OPTIONS;
        _ctrlTitleSession = _Display displayCtrl IDC_MAIN_TITLE_SESSION;
        _showMenuIcons = (((ctrlPosition _ctrlTitleOptions select 0) + (ctrlPosition _ctrlTitleOptions select 2)) > (ctrlPosition _ctrlTitleSession select 0));
        {(_display displayCtrl _x) ctrlShow !_showMenuIcons;} forEach [IDC_MAIN_TITLE_SINGLEPLAYER,IDC_MAIN_TITLE_MULTIPLAYER,IDC_MAIN_TITLE_TUTORIALS,IDC_MAIN_TITLE_OPTIONS];
        {(_display displayCtrl _x) ctrlShow _showMenuIcons;} forEach [IDC_MAIN_TITLEICON_SINGLEPLAYER,IDC_MAIN_TITLEICON_MULTIPLAYER,IDC_MAIN_TITLEICON_TUTORIALS,IDC_MAIN_TITLEICON_OPTIONS];

        //--- Init editor spotlight
        _ctrlPictureSpotlight3 = _ctrlGroupSpotlight3 controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
        _ctrlVideoSpotlight3 = _ctrlGroupSpotlight3 controlsGroupCtrl IDC_MAIN_SPOTLIGHT_VIDEO;
        if (worldName == "") then {
            //--- Empty world
            _spotlightDefault = uiNamespace getVariable ["RscDisplayMain_spotlightDefault",[]];
            _spotlightDefault3 = _spotlightDefault param [2,[]];
            _ctrlPictureSpotlight3 ctrlSetText (_spotlightDefault3 param [0,""]);
            _ctrlVideoSpotlight3 ctrlSetText (_spotlightDefault3 param [1,""]);
        } else {
            //--- Show world picture and video
            _worldPicture = getText (configFile >> "cfgworlds" >> worldName >> "pictureMap");
            _ctrlPictureSpotlight3 ctrlSetText _worldPicture;
            _previewVideo = getText (configFile >> "cfgworlds" >> worldName >> "previewVideo");
            _ctrlVideoSpotlight3 ctrlSetText _previewVideo;
        };

        //--- Clear spotlight
        {
            //["playVideo",[_x,false],""] call RscDisplayMain_script;
            ctrlDelete (_x controlsGroupCtrl 222);
        } forEach ([_ctrlGroupSpotlight2,_ctrlGroupSpotlight3] + (_ctrlGroupSpotlight1 getVariable ["spotlights",[]]));

        //--- Clear menus
        ["menuClear",[ctrlParent _ctrlGroup,0],""] call RscDisplayMain_script;

        //--- Set neutral focus
        _ctrlMouseArea = _display displayCtrl IDC_MAIN_MOUSEAREA;
        ctrlSetFocus _ctrlMouseArea;

        //--- Show Welcome screen
        _showWelcomeScreen = [_display] call (uiNamespace getVariable "bis_fnc_showWelcomeScreen");

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // PLACE CONTROLS MESSAGE BOXES HERE!
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        if (!_showWelcomeScreen) then 
        {
            private _showControlsPrompt = false;
        
            //--- Show Jets control preset prompt
            //---- Apex prompt (RscMsgBoxKeysPreset / RscDisplayKeysPresetMsgBox_shown)
            //---- Jets prompt (RscDisplayKeysPresetMsgBoxJets / RscDisplayKeysPresetMsgBoxJets_shown)

            // Todo: Code cleanup
            // Todo: Make this generic in bis_fnc_controlPrompt which can be triggered from anywhere (_controls, _text, _profileVar, _maxPrompts, _parentDisplay)
            private _presetCustomInfoPanel_count = profileNamespace getVariable ["RscMsgBoxKeysPresetCustomInfoPanel_shown",0];
            if (_presetCustomInfoPanel_count < 2) then
            {
                private _listRightVehicleDisplay = actionKeysNamesArray ["ListRightVehicleDisplay", 1];
                private _nextModeRightVehicleDisplay = actionKeysNamesArray ["NextModeRightVehicleDisplay", 1];
                if (count _listRightVehicleDisplay == 0 || count _nextModeRightVehicleDisplay == 0) then
                {
                    _display ctrlCreate ["RscMsgBoxKeysPresetCustomInfoPanel",-1];
                    profileNamespace setVariable ["RscMsgBoxKeysPresetCustomInfoPanel_shown", (_presetCustomInfoPanel_count + 1)];
                    saveProfileNamespace;
                    _showControlsPrompt = true;
                };

                //--- Check if Apex keys are assigned
                /*_match = true;
                {
                    _force = false;
                    _a = getarray _x;
                    {
                        if (_x isequaltype "") then {
                            _a set [_forEachindex,call compile _x]; //--- Convert macro to single number
                        } else {
                            if (_x isequaltype []) then {_force = true;}; //--- Force match when format is different (i.e., it's a key combination)
                        };
                    } forEach _a;
                    _b = actionKeys (configname _x);
                    _match = _match && (_a isequalto _b || _force);
                } forEach configproperties [configFile >> "CfgDefaultKeysPresets" >> "Arma3Apex" >> "Mappings","isarray _x",false];

                //--- Show prompt when they aren't
                if !(_match) then {_display ctrlCreate ["RscMsgBoxKeysPresetJets",-1];};

                //--- Prevent this int he future (if user is already using Apex controls, he shouldn't get the message after changing it)
                profileNamespace setVariable ["RscDisplayKeysPresetMsgBoxJets_shown",true];
                saveProfileNamespace;*/
            } 
            else 
            {
                //--- Show Hold breath controls preset prompt
                if (
                    !(profileNamespace getVariable ["RscDisplayKeyMapMsgBox_shown",false])
                    &&
                    {
                        !(DIK_LSHIFT in actionKeys "holdbreath")
                        ||
                        !((DIK_SPACE in actionKeys "action") || (DIK_F in actionKeys "action"))
                        ||
                        !(65538 in actionKeys "actioncontext")
                    }
                ) 
                then 
                {
                    _display createDisplay "RscDisplayKeyMapMsgBox";
                    profileNamespace setVariable ["RscDisplayKeyMapMsgBox_shown", true];
                    saveProfileNamespace;
                    _showControlsPrompt = true;
                };
            };
            
            if (!_showControlsPrompt) then 
            {
                //Check if the profile opted out of Arma Invaders entirely, or if the main menu is modded
                private _mainMenuModded = false;
                private _mainMenuMods = configSourceAddonList (configFile >> "RscDisplayMain" >> "Controls");
                _mainMenuMods = _mainMenuMods - //Remove whitelist (these mods change the main menu in a very limited way)
                [
                    "A3_Editor_F", //Vanilla
                    "A3_Ui_F", //Vanilla
                    "ace_optionsmenu" //ACE
                ];
                if ((count _mainMenuMods) > 0) then {_mainMenuModded = true;};
                
                /* if (!(profileNamespace getVariable ["BIN_ArmaInvadersOff", false]) && !_mainMenuModded) then 
                {
                    //Check if the online event is active or the profile opted in manually
                    if (((getStatValue "_pm") > 0) || ((profileNamespace getVariable ["BIN_ArmaInvadersOfflineBypass", 0]) in [1, 2, 3])) then 
                    {
                        "[AI] LAUNCH INVASION" call BIS_fnc_log;
                        with missionNamespace do {true execVM "\A3\Ui_f\scripts\arma_invaders.sqf";};
                    } 
                    else 
                    {
                        //If Arma Invaders was won by this profile, set the special logo always (unless the whole game is disabled)
                        if (profileNamespace getVariable ["BIN_ArmaInvasionStopped", false]) then 
                        {
                            //Main menu logo does not have IDC
                            {
                                if ((ctrlClassName _x) in ["Logo", "LogoApex"]) then 
                                {
                                    if (ctrlShown _x) then 
                                    {
                                        private _logo = "";
                                        if ((getStatValue "InvadersWon") == 1) then {_logo = "\A3\Ui_f\data\Logos\arma3_special_ca"};
                                        if ((getStatValue "InvadersWonNGP") == 1) then {_logo = "\A3\Ui_f\data\Logos\arma3_special_ngp_ca"};
                                        if (_logo != "") then 
                                        {
                                            _x ctrlSetText _logo;
                                        };
                                    };
                                };
                            } forEach (allControls _display);
                        };
                    };
                }; */
                
                //Check if live toggle is active and show pop-up
                //Only pop when only the main menu itself is open
                if ((getStatValue "_pp") == 1) then 
                {
                    private _developmentSupported = true;
                    private _supportTest = objNull playMove "BIS_SupportDevelopment"; if (isNil "_supportTest") then {_supportTest = false};
                    private _profileBypass = profileNamespace getVariable ["BIS_SupportDevelopment", false]; if !(_profileBypass isEqualType true) then {_profileBypass = false};
                    if (_profileBypass || _supportTest) then 
                    {
                        _developmentSupported = false;
                    };

                    if (!_developmentSupported && ((count allDisplays) == 1) && (isNull (findDisplay 169))) then 
                    {
                        private _popup = _display createDisplay "RscDisplayDLCActionMsgBox";
                        private _popImageCtrl = _popup displayCtrl IDC_VEHICLEMSGBOX_BACKGROUND;
                        _popImageCtrl ctrlSetText "\A3\Ui_f\data\GUI\Rsc\RscDisplayDLCActionMsgBox\sale_popupImage_01_ca";
                        private _popLogoCtrl = _popup displayCtrl IDC_VEHICLEMSGBOX_LOGO;
                        _popLogoCtrl ctrlSetText "\A3\Ui_f\data\Logos\arma3_bundle_logo_ca";
                        private _popTextCtrl = _popup displayCtrl IDC_VEHICLEMSGBOX_TEXT;
                        
                        if ((getStatValue "_mpd") != 1) then 
                        {
                            _popTextCtrl ctrlSetText (localize "STR_A3_tacops_popup_developer");
                        } 
                        else 
                        {
                            _popTextCtrl ctrlSetText (localize "STR_A3_tacops_popup_developer_mp");
                        };
                        
                        private _popTextCtrlPos = ctrlPosition _popTextCtrl;
                        _popTextCtrl ctrlSetPosition [_popTextCtrlPos # 0, _popTextCtrlPos # 1, _popTextCtrlPos # 2, ctrlTextHeight _popTextCtrl];
                        _popTextCtrl ctrlCommit 0;
                        
                        private _popPurchaseCtrl = _popup displayCtrl IDC_VEHICLEMSGBOX_PURCHASE;
                        _popPurchaseCtrl ctrlSetURL "https://store.steampowered.com/dlc/107410/Arma_3/";
                        _popPurchaseCtrl ctrlSetURLOverlayMode 1;
                        
                        private _popCloseCtrl = _popup displayCtrl MB_BUTTON_CANCEL;
                        ctrlSetFocus _popCloseCtrl;
                    };
                };    
            };
        };
    };
    case "keyDown": {
        _display = _params select 0;
        _key = _params select 1;
        switch _key do {
            case DIK_ESCAPE: {
                [_display] spawn {
                    _display = _this select 0;
                    _prompt = ["Hm?",nil,true,true,_display,true] call (uiNamespace getVariable "bis_fnc_guiMessage");
                    if (_prompt) then {
                        ctrlActivate (_display displayCtrl IDC_MAIN_QUIT);
                    };
                };
            };
        };
        false
    };
    case "menuEnter": {
        private _ctrlTitle = _params select 0;
        private _display = ctrlParent _ctrlTitle;
        ["menuClear",[_display],""] call RscDisplayMain_script;
        private _ctrlGroup = _display displayCtrl (ctrlIDC _ctrlTitle - 10);
        if (isNull _ctrlGroup) then {_ctrlGroup = _display displayCtrl (ctrlIDC _ctrlTitle - 110)};
        private _ctrlGroupPos = ctrlPosition _ctrlGroup;

        //--- Move buttons group next to the title button
        _ctrlGroupPos set [0,(ctrlPosition _ctrlTitle select 0) min (safeZoneX + safeZoneW - (ctrlPosition _ctrlGroup select 2) - (ctrlPosition _ctrlTitle select 3) * 3/4)];
        _ctrlGroup ctrlSetPosition _ctrlGroupPos;
        _ctrlGroup ctrlCommit 0;

        _ctrlGroupPos set [3,_params select 1];
        _ctrlGroup ctrlSetPosition _ctrlGroupPos;
        _ctrlGroup ctrlCommit MENU_TIME;
    };
    case "menuExit": {
        private _ctrlTitle = _params select 0;
        private _commitTime = _params param [1,MENU_TIME];
        private _ctrlGroup = _display displayCtrl (ctrlIDC _ctrlTitle - 10);
        if (isNull _ctrlGroup) then {_ctrlGroup = _display displayCtrl (ctrlIDC _ctrlTitle - 110)};
        private _ctrlGroupPos = ctrlPosition _ctrlGroup;
        _ctrlGroupPos set [3,0];
        _ctrlGroup ctrlSetPosition _ctrlGroupPos;
        _ctrlGroup ctrlCommit _commitTime;
    };
    case "menuClear": {
        private _display = _params select 0;
        private _commitTime = _params param [1,MENU_TIME];
        {
            ["menuExit",[_display displayCtrl _x,_commitTime],''] call RscDisplayMain_script;
        } forEach [
            IDC_MAIN_TITLE_SINGLEPLAYER,
            IDC_MAIN_TITLE_MULTIPLAYER,
            IDC_MAIN_TITLE_TUTORIALS,
            IDC_MAIN_TITLE_OPTIONS,
            IDC_MAIN_TITLE_SESSION
        ];
    };
    case "spotlightInit": {
        _display = _params select 0;

        //--- Init custom spotlight
        _ctrlGroupSpotlight1 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_1;
        _cfgSpotlights = [];
        {
            _condition = getText (_x >> "condition");
            if (_condition == "") then {_condition = "true";};
            [_condition,_cfgSpotlights,_x] call {
                private ["_display","_ctrlGroupSpotlight1","_ctrlGroupSpotlight2","_ctrlGroupSpotlight3","_condition","_cfgSpotlights","_x"];
                if ([] call compile (_this select 0)) then {(_this select 1) append [_this select 2];};
            };
        } forEach (("isclass _x" configClasses (configFile >> "CfgMainMenuSpotlight")) + ("isclass _x" configClasses (configFile >> "RscDisplayMain" >> "Spotlight")));

        _spotlights = [];
        {
            _cfgSpotlight = _x;
            _idc = IDC_MAIN_SPOTLIGHT_PICTURE + 100 + _forEachindex;
            _ctrlGroupSpotlightX = _display ctrlCreate ["RscMainMenuSpotlight",_idc];
            _ctrlGroupSpotlightX ctrlSetPosition ctrlPosition _ctrlGroupSpotlight1;
            _ctrlGroupSpotlightX ctrlCommit 0;
            _spotlights pushBack _ctrlGroupSpotlightX;

            _ctrlPictureSpotlightX = _ctrlGroupSpotlightX controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
            _ctrlPictureSpotlightX ctrlSetText getText (_cfgSpotlight >> "picture");

            _ctrlVideoSpotlightX = _ctrlGroupSpotlightX controlsGroupCtrl IDC_MAIN_SPOTLIGHT_VIDEO;
            _ctrlVideoSpotlightX ctrlSetText getText (_cfgSpotlight >> "video");

            _ctrlActionSpotlightX = _ctrlGroupSpotlightX controlsGroupCtrl IDC_MAIN_SPOTLIGHT_ACTION;
            _ctrlActionSpotlightX ctrlSetText toUpper getText (_cfgSpotlight >> "actionText");

            _ctrlButtonSpotlightX = _ctrlGroupSpotlightX controlsGroupCtrl IDC_MAIN_SPOTLIGHT_BUTTON;
            _ctrlButtonSpotlightX ctrlSetEventHandler ["ButtonClick",getText (_cfgSpotlight >> "action")];

            _spotlightText = getText (_cfgSpotlight >> "text");
            if (getNumber (_cfgSpotlight >> "textIsQuote") > 0) then {_spotlightText = format ["""%1""",_spotlightText];};
            if (getNumber (_cfgSpotlight >> "disableUpperCase") == 0) then {_spotlightText = toUpper _spotlightText;};
            _ctrlTextSpotlightX = _ctrlGroupSpotlightX controlsGroupCtrl IDC_MAIN_SPOTLIGHT_TEXT;
            _ctrlTextSpotlightX ctrlSetText _spotlightText;
        } forEach _cfgSpotlights;

        //--- Save spotlights
        _ctrlGroupSpotlight1 setVariable ["spotlights",_spotlights];
        RscDisplayMain_spotlightID = (count _spotlights - 1);
        RscDisplayMain_spotlightTime = time + SPOTLIGHT_DELAY;

        //--- Init hardcoded spotlights
        _ctrlGroupSpotlight2 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_2;
        _ctrlButtonSpotlight2 = _ctrlGroupSpotlight2 controlsGroupCtrl IDC_MAIN_SPOTLIGHT_BUTTON;
        _ctrlButtonSpotlight2 ctrlAddEventHandler [
            "ButtonClick",
            {
                _display = ctrlParent (_this select 0);
                ctrlActivate (_display displayCtrl IDC_MAIN_QUICKPLAY);
            }
        ];

        _ctrlGroupSpotlight3 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_3;
        _ctrlButtonSpotlight3 = _ctrlGroupSpotlight3 controlsGroupCtrl IDC_MAIN_SPOTLIGHT_BUTTON;
        _ctrlButtonSpotlight3 ctrlAddEventHandler [
            "ButtonClick",
            {
                _display = ctrlParent (_this select 0);
                ctrlActivate (_display displayCtrl IDC_SP_EDITOR);
            }
        ];
        _ctrlPictureSpotlight3 = _ctrlGroupSpotlight3 controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
        _ctrlVideoSpotlight3 = _ctrlGroupSpotlight3 controlsGroupCtrl IDC_MAIN_SPOTLIGHT_VIDEO;
        uiNamespace setVariable ["RscDisplayMain_spotlightDefault",[[],[],[ctrlText _ctrlPictureSpotlight3,ctrlText _ctrlVideoSpotlight3]]];
        {
            //--- Adjust spotlight texts
            _ctrlGroup = _x;
            _ctrlGroup ctrlSetFade 0;
            _ctrlGroup ctrlCommit 0.1;
            _ctrlText = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_TEXT;
            _text = ctrlText _ctrlText;
            if (_forEachindex < 2) then {_text = toUpper _text;}; //--- Uppercase only QUICK PLAY and EDITOR, custom spotlights are already upped
            _ctrlText ctrlSetStructuredText parseText _text;
            _ctrlTextHeight = ctrlTextHeight _ctrlText;
            _ctrlTextPos = ctrlPosition _ctrlText;
            _ctrlTextPos set [1,((ctrlPosition _ctrlGroup select 3) - _ctrlTextHeight) / 2];
            _ctrlTextPos set [3,_ctrlTextHeight];
            _ctrlText ctrlSetPosition _ctrlTextPos;
            _ctrlText ctrlCommit 0;
            _ctrlText ctrlEnable false;
            _ctrlText setVariable ["pos",_ctrlTextPos];
            //_ctrlTextBackground = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_TEXTBCG;
            //_ctrlTextBackground ctrlSetPosition _ctrlTextPos;
            //_ctrlTextBackground ctrlCommit 0;

            //--- Init spotlight functionality
            _ctrlButton = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_BUTTON;
            {
                _ctrlButton ctrlAddEventHandler [
                    _x,
                    {with uiNamespace do {['spotlightEnter',_this,''] call RscDisplayMain_script;};}
                ];
            } forEach ["MouseEnter","SetFocus"];
            {
                _ctrlButton ctrlAddEventHandler [
                    _x,
                    {with uiNamespace do {['spotlightExit',_this,''] call RscDisplayMain_script;};}
                ];
            } forEach ["MouseExit","KillFocus"];
        } forEach ([_ctrlGroupSpotlight2,_ctrlGroupSpotlight3] + _spotlights);

        //--- Init spotlight buttons
        _ctrlSpotlightPrev = _display displayCtrl IDC_MAIN_SPOTLIGHT_PREV;
        _ctrlSpotlightNext = _display displayCtrl IDC_MAIN_SPOTLIGHT_NEXT;
        if (count _spotlights > 1) then {
            _ctrlSpotlightPrev ctrlAddEventHandler ["ButtonClick",{with uiNamespace do {["spotlightChangeButton",[_this select 0,-1],""] spawn RscDisplayMain_script;};}];
            _ctrlSpotlightNext ctrlAddEventHandler ["ButtonClick",{with uiNamespace do {["spotlightChangeButton",[_this select 0,+1],""] spawn RscDisplayMain_script;};}];
            {
                _x ctrlAddEventHandler ["ButtonClick",{with uiNamespace do {["spotlightChangeButtonEnter",[ctrlParent (_this select 0)],""] spawn RscDisplayMain_script;};}];
                _x ctrlAddEventHandler ["MouseEnter",{with uiNamespace do {["spotlightChangeButtonEnter",[ctrlParent (_this select 0)],""] spawn RscDisplayMain_script;};}];
                _x ctrlAddEventHandler ["SetFocus",{with uiNamespace do {["spotlightChangeButtonEnter",[ctrlParent (_this select 0)],""] spawn RscDisplayMain_script;};}];
                _x ctrlAddEventHandler ["KillFocus",{with uiNamespace do {["spotlightChangeButtonExit",[ctrlParent (_this select 0)],""] call RscDisplayMain_script;};}];
                _x ctrlAddEventHandler ["MouseExit",{with uiNamespace do {["spotlightChangeButtonExit",[ctrlParent (_this select 0)],""] call RscDisplayMain_script;};}];
            } forEach [_ctrlSpotlightPrev,_ctrlSpotlightNext];
        } else {
            _ctrlSpotlightPrev ctrlShow false;
            _ctrlSpotlightNext ctrlShow false;
        };
    };
    case "spotlightEnter": {
        private _ctrlButton = _params select 0;
        private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;
        private _ctrlPicture = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
        private _ctrlHover = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_HOVER;
        private _ctrlGroupPos = ctrlPosition _ctrlGroup;
        //_ctrlPicture ctrlSetPosition [
        // -(_ctrlGroupPos select 2) * (SPOTLIGHT_ZOOM - 1) / 2,
        // -(_ctrlGroupPos select 3) * (SPOTLIGHT_ZOOM - 1) / 2,
        // (_ctrlGroupPos select 2) * SPOTLIGHT_ZOOM,
        // (_ctrlGroupPos select 3) * SPOTLIGHT_ZOOM
        //];
        //_ctrlPicture ctrlCommit SPOTLIGHT_TIME;
        _ctrlHover ctrlSetFade 0;
        _ctrlHover ctrlCommit SPOTLIGHT_TIME;

        //["menuClear",[ctrlParent _ctrlGroup],""] call RscDisplayMain_script;
        ["playVideo",[ctrlParentControlsGroup _ctrlPicture,true],""] call RscDisplayMain_script;
        if !(ctrlIDC _ctrlGroup in [IDC_MAIN_SPOTLIGHT_GROUP_2,IDC_MAIN_SPOTLIGHT_GROUP_3]) then {
            ["spotlightChangeButtonEnter",[ctrlParent _ctrlButton],""] spawn RscDisplayMain_script;
            RscDisplayMain_spotlightTime = -1; //--- Disable animation
        };
    };
    case "spotlightExit": {
        private _ctrlButton = _params select 0;
        private _ctrlGroup = ctrlParentControlsGroup _ctrlButton;
        private _ctrlPicture = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
        private _ctrlHover = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_HOVER;
        private _ctrlGroupPos = ctrlPosition _ctrlGroup;
        //_ctrlPicture ctrlSetPosition [
        // 0,
        // 0,
        // (_ctrlGroupPos select 2),
        // (_ctrlGroupPos select 3)
        //];
        //_ctrlPicture ctrlCommit SPOTLIGHT_TIME;
        _ctrlPicture ctrlSetTextColor [1,1,1,1];
        _ctrlHover ctrlSetFade 1;
        _ctrlHover ctrlCommit SPOTLIGHT_TIME;
        ["playVideo",[_ctrlGroup,false],""] call RscDisplayMain_script;
        if !(ctrlIDC _ctrlGroup in [IDC_MAIN_SPOTLIGHT_GROUP_2,IDC_MAIN_SPOTLIGHT_GROUP_3]) then {
            ["spotlightChangeButtonExit",[ctrlParent _ctrlButton],""] spawn RscDisplayMain_script;
            RscDisplayMain_spotlightTime = time + SPOTLIGHT_DELAY;
        };
    };
    case "spotlightChange": {
        disableSerialization;

        _display = _params select 0;
        _idDelta = _params select 1;
        _delay = _params select 2;

        _ctrlGroupSpotlight1 = _display displayCtrl IDC_MAIN_SPOTLIGHT_GROUP_1;
        if !(ctrlCommitted _ctrlGroupSpotlight1) exitWith {}; //--- Terminate when previous animation is in progress
        _ctrlGroupSpotlight1 ctrlCommit _delay;

        _ctrlGroupSpotlight1Pos = ctrlPosition _ctrlGroupSpotlight1;
        _ctrlGroupSpotlight1PosY = _ctrlGroupSpotlight1Pos select 1;
        _ctrlGroupSpotlight1PosH = _ctrlGroupSpotlight1Pos select 3;

        _spotlights = _ctrlGroupSpotlight1 getVariable ["spotlights",[]];
        if (count _spotlights <= 1 || _idDelta == 0) exitWith {};

        _id = uiNamespace getVariable ["RscDisplayMain_spotlightID",0];
        _id = (_id + _idDelta + count _spotlights) % count _spotlights;
        uiNamespace setVariable ["RscDisplayMain_spotlightID",_id];
        uiNamespace setVariable ["RscDisplayMain_spotlightTime",time + SPOTLIGHT_DELAY];
        {
            _ctrlGroup = _x;
            _ctrlGroupPos = ctrlPosition _ctrlGroup;
            _ctrlPicture = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
            _ctrlPicturePos = ctrlPosition _ctrlPicture;
            _ctrlText = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_TEXT;
            _ctrlTextPos = ctrlPosition _ctrlText;
            _ctrlTextPosDef = _ctrlText getVariable ["pos",[0,0,0,0]];
            _ctrlTextBackground = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_TEXTBCG;
            _ctrlButton = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_BUTTON;
            _inCommit = _delay;

            if (_idDelta < 0) then {

                //--- Prev
                if (_forEachindex == _id) then {
                    _ctrlButton ctrlEnable true;
                    _ctrlGroupPos set [1,_ctrlGroupSpotlight1PosY];
                    _ctrlGroupPos set [3,0];
                    _ctrlGroup ctrlSetPosition _ctrlGroupPos;
                    _ctrlGroup ctrlCommit 0;
                    _ctrlGroupPos set [1,_ctrlGroupSpotlight1PosY];
                    _ctrlGroupPos set [3,_ctrlGroupSpotlight1PosH];
                    _ctrlPicturePos set [1,-_ctrlGroupSpotlight1PosH];
                    _ctrlPicture ctrlSetPosition _ctrlPicturePos;
                    _ctrlPicture ctrlCommit 0;
                    _ctrlPicturePos set [1,0];
                    _ctrlTextPos set [1,(_ctrlTextPosDef select 1) - _ctrlGroupSpotlight1PosH];
                    _ctrlText ctrlSetPosition _ctrlTextPos;
                    _ctrlText ctrlCommit 0;
                    _ctrlTextBackground ctrlSetPosition _ctrlPicturePos;
                    _ctrlTextBackground ctrlCommit 0;
                    _ctrlTextPos = _ctrlTextPosDef;
                } else {
                    _ctrlButton ctrlEnable false;
                    _ctrlGroupPos set [1,_ctrlGroupSpotlight1PosY + _ctrlGroupSpotlight1PosH];
                    _ctrlGroupPos set [3,0];
                    _ctrlPicturePos set [1,0];
                    _ctrlTextPos = _ctrlTextPosDef;
                    _inCommit = 0;
                };
            } else {

                //--- Next
                if (_forEachindex == _id) then {
                    _ctrlButton ctrlEnable true;
                    _ctrlGroupPos set [1,_ctrlGroupSpotlight1PosY + _ctrlGroupSpotlight1PosH];
                    _ctrlGroupPos set [3,0];
                    _ctrlGroup ctrlSetPosition _ctrlGroupPos;
                    _ctrlGroup ctrlCommit 0;
                    _ctrlGroupPos set [1,_ctrlGroupSpotlight1PosY];
                    _ctrlGroupPos set [3,_ctrlGroupSpotlight1PosH];
                    _ctrlPicturePos set [1,0];
                    _ctrlTextPos = _ctrlTextPosDef;
                    _inCommit = 0;
                } else {
                    _ctrlButton ctrlEnable false;
                    //['spotlightExit',[_ctrlGroup],''] call RscDisplayMain_script;
                    _ctrlGroupPos set [1,_ctrlGroupSpotlight1PosY];
                    _ctrlGroupPos set [3,0];
                    _ctrlPicturePos set [1,-_ctrlGroupSpotlight1PosH];
                    _ctrlTextPos set [1,(_ctrlTextPos select 1) - _ctrlGroupSpotlight1PosH];
                };
            };

            _ctrlGroup ctrlSetPosition _ctrlGroupPos;
            _ctrlGroup ctrlCommit _delay;

            _ctrlPicture ctrlSetPosition _ctrlPicturePos;
            _ctrlPicture ctrlCommit _inCommit;

            _ctrlText ctrlSetPosition _ctrlTextPos;
            _ctrlText ctrlCommit _inCommit;

            _ctrlTextBackground ctrlSetPosition _ctrlPicturePos;
            _ctrlTextBackground ctrlCommit _inCommit;
        } forEach _spotlights;

    };
    case "spotlightChangeButton": {
        _ctrlButton = _params select 0;
        _idDelta = _params select 1;
        ["spotlightChange",[ctrlParent _ctrlButton,_idDelta,SPOTLIGHT_MOVE_USER],""] spawn RscDisplayMain_script;
    };
    case "spotlightChangeButtonEnter": {
        _display = _params select 0;
        {
            _ctrlButton = _display displayCtrl _x;
            _ctrlButton ctrlSetFade 0;
            _ctrlButton ctrlCommit SPOTLIGHT_BUTTON_IN;
        } forEach [IDC_MAIN_SPOTLIGHT_PREV,IDC_MAIN_SPOTLIGHT_NEXT];
    };
    case "spotlightChangeButtonExit": {
        _display = _params select 0;
        {
            _ctrlButton = _display displayCtrl _x;
            _ctrlButton ctrlSetFade 1;
            _ctrlButton ctrlCommit SPOTLIGHT_BUTTON_OUT;
        } forEach [IDC_MAIN_SPOTLIGHT_PREV,IDC_MAIN_SPOTLIGHT_NEXT];
    };
    case "infoEnter": {
        _ctrlButton = _params select 0;
        _ctrlInfo = ctrlParentControlsGroup _ctrlButton;
        _ctrlIconBackground = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND_ICON;
        _ctrlIcon = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_ICON;
        _ctrlIconBackground ctrlSetTextColor [1,1,1,1];
        _ctrlIcon ctrlSetTextColor [0,0,0,1];
        if (ctrlClassName _ctrlInfo in ["InfoNews","InfoVersion"]) then {
            _ctrlBackground = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND;
            _ctrlBackground ctrlSetTextColor [1,1,1,1];
        };
        //["menuClear",[ctrlParent _ctrlGroup],""] call RscDisplayMain_script;
    };
    case "infoExit": {
        _ctrlButton = _params select 0;
        _ctrlInfo = ctrlParentControlsGroup _ctrlButton;
        _ctrlIconBackground = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND_ICON;
        _ctrlIcon = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_ICON;
        _ctrlIconBackground ctrlSetTextColor [INFO_BACKGROUND_COLOR];
        _ctrlIcon ctrlSetTextColor [INFO_ICON_COLOR];
        if (ctrlClassName _ctrlInfo in ["InfoNews","InfoVersion"]) then {
            _ctrlBackground = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_BACKGROUND;
            _ctrlBackground ctrlSetTextColor [INFO_BACKGROUND_COLOR];
        };
    };
    case "infoClick": {
        _ctrlButton = _params select 0;
        _ctrlInfo = ctrlParentControlsGroup _ctrlButton;
        _ctrlInfoVersionNotification = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_NOTIFICATION;
        _ctrlInfoVersionNotification ctrlShow false;

        switch (ctrlClassName _ctrlInfo) do {
            case "InfoVersion": {
                //--- Mark the current version as "read"
                _versionBuild = productVersion select 4;
                _version = productVersion select 2;
                if (_versionBuild == "Development") then {_version = productVersion select 3;};
                profileNamespace setVariable ["RscDisplayMain_version" + _versionBuild,_version];
                saveProfileNamespace;

                _ctrlInfoVersionButton = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_BUTTON;
                _ctrlInfoVersionButtonDev = _ctrlInfo controlsGroupCtrl IDC_MAIN_INFO_BUTTON_DEV;
                _ctrlInfoVersionButton ctrlSetTooltip localize "STR_A3_RscDisplayMain_InfoVersion_tooltip";
                _ctrlInfoVersionButtonDev ctrlSetTooltip localize "STR_A3_RscDisplayMain_InfoVersion_tooltip";
            };
        };
        false
    };
    case "playVideo": {
        private _ctrlGroup = _params select 0;
        private _ctrlPicture = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_PICTURE;
        private _ctrlVideoSource = _ctrlGroup controlsGroupCtrl IDC_MAIN_SPOTLIGHT_VIDEO;
        private _file = ctrlText _ctrlVideoSource;

        if (_file == "") exitWith {};

        //--- Delete the previous video (do it in spawn, would crash the game when called from VideoStopped handler)
        [_ctrlGroup controlsGroupCtrl 222] spawn {
            disableSerialization;
            ctrlDelete (_this select 0);
        };
        private _ctrlVideo = controlNull;
        if (_params select 1) then {
            _ctrlVideo = (ctrlParent _ctrlGroup) ctrlCreate ["RscVideo",222,_ctrlGroup];
            _ctrlVideo ctrlSetText _file;
            _ctrlVideo ctrlSetPosition ctrlPosition _ctrlVideoSource;
            _ctrlVideo ctrlCommit 0;
            _ctrlVideo ctrlEnable false;
            _ctrlPicture ctrlSetTextColor [0,0,0,1];
            _ctrlPicture ctrlSetPosition ctrlPosition _ctrlVideoSource;
            _ctrlPicture ctrlCommit 0;

            _ctrlVideo ctrlAddEventHandler [
                "VideoStopped",
                {with uiNamespace do {["playVideo",[ctrlParentControlsGroup (_this select 0),true],""] call RscDisplayMain_script;};}
            ];
        };

        //--- Delete all other videos (do it in spawn, would crash the game when called from VideoStopped handler)
        //[_ctrlVideo] spawn {
        // disableSerialization;
        // {_x call bis_fnc_log;ctrlDelete _x;} forEach (((allControls ctrlParent (_this select 0)) select {ctrlClassName _x == "RscVideo"}) - [_this select 0]);
        //};
    };
    case "MouseMoving": {
        _display = _params select 0;
        if !(_display getVariable ["BIS_init",false]) then {
            _display setVariable ["BIS_init",true];

            "MainMenuDummy" cutRsc ["RscDisplayMainMenuBackground","plain"]; //--- Register empty layer, because layer 0 is the same as no layer (bug?)
            "MainMenu" cutRsc ["RscDisplayMainMenuBackground","plain"];
            (_display displayCtrl IDC_MAIN_BACKGROUND_PICTURE) ctrlShow false;

            //--- Init spotlight (cannot be done onLoad, because stats are not available yet)
            ["spotlightInit",[_display],""] call RscDisplayMain_script;
        };
        if (missionNamespace getVariable ["RscDisplayMain_grey",true]) then {

            //--- Initial refresh (can't be in onLoad, it's too soon for example for stats evaluation)
            ["refresh",[_display],""] call RscDisplayMain_script;
        };
        missionNamespace setVariable ["RscDisplayMain_grey",false];

        //--- Change spotlight
        if (RscDisplayMain_spotlightTime >= 0 && time > RscDisplayMain_spotlightTime) then {
            ["spotlightChange",[_display,+1,SPOTLIGHT_MOVE],""] spawn RscDisplayMain_script;
        };
    };

    //--- Launch Arsenal based on RscDisplayDLCContentBrowser request
    case "ChildDestroyed":
    {
        _display = _params select 0;
        _exit = _params select 2;

        // switch 7 to IDC_EXIT_TO_MAIN, also test there is test request (global variable?) so it doesn't start Arsenal for every exitToMain request.
        if (
            _exit == 7
            &&
            (
                !isNil {uiNamespace getVariable "BIS_fnc_arsenal_defaultClass"}
                ||
                !isNil {uiNamespace getVariable "BIS_fnc_garage_defaultClass"}
            )
        ) then {
            playMission['','\A3\Missions_F_Bootcamp\Scenarios\Arsenal.VR'];
        };

        //--- Reset spotlight changing
        RscDisplayMain_spotlightTime = time + SPOTLIGHT_DELAY;
    };
};