class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(actions) {
                displayName = "Actions"; //TODO: Translate
                icon = ""; //TODO: Add icon
                class GVAR(actions_pose) {
                    displayName = "Pose"; //TODO: Translate
                };
                class GVAR(actions_fullpose) {
                    displayName = "Full Pose"; //TODO: Translate
                    RTF42ACTION(fullpose_standby)
                };
                class GVAR(actions_animation) {
                    displayName = "Animation"; //TODO: Translate
                };
                class GVAR(actions_cancel) {
                    displayName = "Cancel"; //TODO: Translate
                    icon = ""; // TODO: Add icon
                    condition = "true";
                    exceptions[] = {};
                    statement = "ace_player playActionNow 'GestureNod';[ace_player, ''] remoteExec ['switchMove', 0];ace_player action ['SwitchWeapon', ace_player, ace_player, 0];";
                };
            };
        };
    };
};
