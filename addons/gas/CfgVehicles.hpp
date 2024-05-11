class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(wakeUpAction) {
                    displayName = CSTRING(WakeUpDisplayName);
                    condition = QUOTE(_this call DFUNC(canWakeUp));
                    statement = QUOTE(_this call DFUNC(wakeUp));
                };
            };
        };
    };

    class Sound;
    class GVAR(Sound_Cough_Min): Sound {
        sound = QGVAR(Cough_Min);
    };
    class GVAR(Sound_Cough_Mid): Sound {
        sound = QGVAR(Cough_Mid);
    };
    class GVAR(Sound_Cough_Max): Sound {
        sound = QGVAR(Cough_Max);
    };
    class GVAR(Sound_Cough_Custom): Sound {
        sound = QGVAR(Cough_Custom);
    };
    class GVAR(Sound_Breath): Sound {
        sound = QGVAR(Breath);
    };
};