class GVAR(Speaker): ThingX {
    scope = 2;
    scopeCurator = 2;
    displayName = CSTRING(SpeakerDisplayName);
    author = ECSTRING(main,Author);
    vehicleClass = "Props";
    editorCategory = QEGVAR(main,Items);
    editorSubcategory = QEGVAR(main,Props);
    editorPreview = QPATHTOF(ui\icon_speaker_ca.jpg);
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
                #include "../../../music/RadioMusic.hpp"
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