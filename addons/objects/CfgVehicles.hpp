class CfgVehicles {
    #include "./data/poster/poster.hpp"
    class Item_Base_F;
    class GVAR(Cards): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CardsDisplayName);
        author = ECSTRING(main,Author);
        vehicleClass = "Items";
        editorCategory = QEGVAR(main,Items);
        editorSubcategory = QEGVAR(main,Props);
        editorPreview = QPATHTOEF(items,ui\icon_cards_ca.paa);
        class TransportItems {
            MACRO_ADDITEM(EGVAR(items,Cards),1);
        };
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "Cards";
                selection = "";
                distance = 2.5;
                condition = "true";
                position = "[0,0,-0.5]";
                class GVAR(SeeCards) {
                    displayName = CSTRING(SeeCards);
                    condition = QUOTE(true);
                    statement = "";
                    icon = QPATHTOEF(items,ui\icon_cards_ca.paa);
                    distance = 2;
                    showDisabled = 0;
                    priority = 1.5;
                    exceptions[] = {};
                    insertChildren = QUOTE(_this call EFUNC(cards,addCardActions));
                };
            };
        };
    };
    class Lamps_base_F;
    class GVAR(CeilingLamp): Lamps_base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CeilingLampDisplayName);
        author = ECSTRING(main,Author);
        vehicleClass = "Cargo";
        editorCategory = QEGVAR(main,Items);
        editorSubcategory = QEGVAR(main,Lights);
        model = QPATHTOF(data\ceiling_lamp.p3d);
        _generalMacro = QGVAR(CeilingLamp);
        aggregateReflectors[] = {{"Light_1"}};
        class Reflectors {
            class Light_1 {
                color[] = {1000,1000,1100};
                ambient[] = {10,10,12};
                intensity = 5;
                size = 1;
                innerAngle = 90;
                outerAngle = 360;
                coneFadeCoef = 4;
                position = "Light_1_pos";
                direction = "Light_1_dir";
                selection = "Light_1_pos";
                hitpoint = "";
                useFlare = 1;
                flareSize = 1;
                flareMaxDistance = 250;
                class Attenuation {
                    start = 0;
                    constant = 20;
                    linear = 0;
                    quadratic = 0.5;
                    hardLimitStart = 40;
                    hardLimitEnd = 60;
                };
            };
        };
    };
    class House_F;
    class GVAR(Door): House_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(DoorDisplayName);
        author = ECSTRING(main,Author);
        editorCategory = QEGVAR(main,Items);
        editorSubcategory = QEGVAR(main,Structure);
        model = QPATHTOF(data\door\door.p3d);
        class AnimationSources {
            class Door_source {
                source = QUOTE(user);
                initPhase = 0;
                animPeriod = 1;
                sound = QUOTE(GenericDoorsSound);
            };
        };
        class UserActions {
            class OpenDoor {
                displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
                displayName = CSTRING(OpenDoorDisplayName);
                position = QUOTE(Door_trigger);
                priority = 0.4;
                radius = 1.5;
                onlyForPlayer = 0;
                condition = QUOTE((this animationPhase 'Door_rot') < 0.5);
                statement = QUOTE((ARR_4([this,'Door_rot','Door_Handle_rot_1','Door_Handle_rot_2']) call FUNC(DoorOpen)));
            };
            class CloseDoor: OpenDoor {
                displayName = CSTRING(CloseDoorDisplayName);
                priority = 0.2;
                condition = QUOTE(((this animationPhase 'Door_rot') >= 0.5));
                statement = QUOTE(ARR_4([this,'Door_rot','Door_Handle_rot_1','Door_Handle_rot_2']) call FUNC(DoorClose));
            };
        };
        actionBegin1 = QUOTE(OpenDoor);
        actionEnd1 = QUOTE(CloseDoor);
        numberOfDoors = 1;
    };
    class ThingX;
    class GVAR(Speaker): ThingX {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(SpeakerDisplayName);
        author = ECSTRING(main,Author);
        vehicleClass = "Props";
        editorCategory = QEGVAR(main,Items);
        editorSubcategory = QEGVAR(main,Props);
        editorPreview = QPATHTOF(ui\icon_speaker_ca.paa);
        hiddenSelections[] = {"screen"};
        hiddenSelectionsTextures[] = {"#(rgb,8,8,3)color(0,0,0,0)"}; // Black screen
        hiddenSelectionsMaterials[] = {"\a3\data_f\default.rvmat"};
        model = QPATHTOF(data\speaker\speaker.p3d);
        class Attributes {
            class PlayRadio {
                control = "Checkbox";
                property = "PlayRadio";
                displayName = CSTRING(PlayRadio);
                tooltip = CSTRING(PlayRadioTooltip);
                expression = QUOTE(if (_value) then {[_this] call FUNC(turnOnRadio)} else {[_this] call FUNC(turnOffRadio)});
                typeName = "BOOL";
                defaultValue = "false";
            };
            class Song {
                control = "Combo";
                property = "Song";
                displayName = CSTRING(RadioSong);
                tooltip = CSTRING(RadioSongTooltip);
                expression = QUOTE(_this setVariable [ARR_2(QQEGVAR(music,radioFile),_value]));
                typeName = "STRING";
                defaultValue = QEGVAR(music,5fdp_bad_company);
                class Values {
                    #include "../music/RadioMusic.hpp"
                };
            };
        };
        class ACE_Actions {
            class ACE_MainActions {
                displayName = "Radio";
                selection = "";
                distance = 2.5;
                condition = "alive _target";
                position = "[0,0,0]";
                icon = "a3\ui_f\data\gui\rsc\rscdisplayarsenal\radio_ca.paa";
                class GVAR(TurnOnRadio) {
                    displayName = CSTRING(TurnOnRadio);
                    condition = QUOTE(!(_target getVariable [ARR_2(QQEGVAR(music,radioOn),false)]));
                    statement = QUOTE([_target] remoteExec [ARR_2(QQFUNC(turnOnRadio),[ARR_2(0,-2)] select isDedicated]));
                    icon = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_on_ca.paa";
                    distance = 2;
                    showDisabled = 0;
                    priority = 1.5;
                    exceptions[] = {};
                };
                class GVAR(TurnOffRadio): GVAR(TurnOnRadio) {
                    displayName = CSTRING(TurnOffRadio);
                    condition = QUOTE((_target getVariable [ARR_2(QQEGVAR(music,radioOn),false)]));
                    statement = QUOTE([_target] remoteExec [ARR_2(QQFUNC(turnOffRadio),[ARR_2(0,-2)] select isDedicated]));
                    icon = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_off_ca.paa";
                };
                // UNCOMMENT TO ENABLE FREE RADIO
                /* class GVAR(TurnOnRadio) {
                    displayName = CSTRING(TurnOnRadio);
                    condition = QUOTE(!(_target getVariable [ARR_2(QQEGVAR(music,radioOn),false)]));
                    statement = QUOTE([_target] call FUNC(turnOnRadio));
                    icon = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_on_ca.paa";
                    distance = 2;
                    showDisabled = 0;
                    priority = 1.5;
                    exceptions[] = {};
                };
                class GVAR(TurnOffRadio): GVAR(TurnOnRadio) {
                    displayName = CSTRING(TurnOffRadio);
                    condition = QUOTE((_target getVariable [ARR_2(QQEGVAR(music,radioOn),false)]));
                    statement = QUOTE([_target] call FUNC(turnOffRadio));
                    icon = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_cpt_music_off_ca.paa";
                }; */
                /* class GVAR(TurnOnShuffle): GVAR(TurnOnRadio) {
                    displayName = CSTRING(TurnOnShuffle);
                    condition = QUOTE(!(_target getVariable [ARR_2(QQEGVAR(music,radioShuffle),false)]));
                    statement = QUOTE(_target setVariable [ARR_3(QQEGVAR(music,radioShuffle),true,true)]);
                    icon = "x\zen\addons\compositions\ui\randomize_ca.paa";
                };
                class GVAR(TurnOffShuffle): GVAR(TurnOnShuffle) {
                    displayName = CSTRING(TurnOffShuffle);
                    condition = QUOTE(_target getVariable [ARR_2(QQEGVAR(music,radioShuffle),false)]);
                    statement = QUOTE(_target setVariable [ARR_3(QQEGVAR(music,radioShuffle),false,true)]);
                    icon = "";
                }; */
                /* class GVAR(RadioMusic): GVAR(TurnOnRadio) {
                    displayName = CSTRING(RadioSongs);
                    condition = QUOTE(_target getVariable [ARR_2(QQEGVAR(music,radioOn),false)]);
                    statement = QUOTE([_target] call EFUNC(zeus,radioActions));
                    icon = "a3\modules_f_curator\data\portraitdiary_ca.paa";
                }; */
            };
        };
    };
};
