class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(actions) {
                displayName = CSTRING(DisplayName_Actions);
                icon = "a3\ui_f_orange\data\cfgorange\missions\action_fragment_back_ca.paa";
                class GVAR(actions_pose) {
                    displayName = CSTRING(DisplayName_Pose);
                };
                class GVAR(actions_fullpose) {
                    displayName = CSTRING(DisplayName_FullPose);
                    RTF42ACTION(fullpose_standby);
                    RTF42ACTION(fullpose_holdvest);
                    RTF42ACTION(fullpose_cradle);
                };
                class GVAR(actions_animation) {
                    displayName = CSTRING(DisplayName_Animation);
                };
                class GVAR(actions_cancel) {
                    displayName = CSTRING(DisplayName_Cancel);
                    icon = "a3\ui_f\data\igui\cfg\actions\obsolete\ui_action_cancel_ca.paa";
                    condition = "true";
                    exceptions[] = {};
                    statement = "ace_player playActionNow 'GestureNod';[ace_player, ''] remoteExec ['switchMove', 0];ace_player action ['SwitchWeapon', ace_player, ace_player, 0];";
                };
            };
        };
    };
};
