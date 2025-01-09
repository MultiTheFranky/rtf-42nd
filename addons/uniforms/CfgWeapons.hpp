class CfgWeapons {
    class U_tweed_acu_summer_ocp_crye_knee_jedi;
    class U_tweed_acu_summer_ocp_crye_knee;
    class U_tweed_acu_summer_ocp_crye_knee_trop;
    class U_tweed_acu_summer_ocp_blench_tuck_trop;

    class UniformItem;
    class GVAR(UniformItemBase): UniformItem {
        containerClass = "Supply50";
        mass = 50;
    };

    #include "includes\interpreter.hpp"
    
    class GVAR(base): U_tweed_acu_summer_ocp_crye_knee {
        scope = 2;
        displayName = CSTRING(baseUniformDisplayName);
        class ItemInfo: GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,rifleman);
        };
    };

    class GVAR(semisleeve): U_tweed_acu_summer_ocp_crye_knee_jedi {
        scope = 2;
        displayName = CSTRING(semisleeveUniformDisplayName);
        class ItemInfo: GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,sl);
        };
    };

    class GVAR(sleeve): U_tweed_acu_summer_ocp_crye_knee_trop {
        scope = 2;
        displayName = CSTRING(sleeveUniformDisplayName);
        class ItemInfo: GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,tl);
        };
    };
};
