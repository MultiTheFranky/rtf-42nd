class CfgWeapons {
    class U_B_CTRG_1;
    class U_B_CTRG_3;
    class UniformItem;
    class GVAR(UniformItemBase): UniformItem {
        containerClass = "Supply50";
        mass = 50;
    };
    class GVAR(mc): U_B_CTRG_1 {
        scope = 2;
        displayName = CSTRING(mc_displayName);
        picture = QPATHTOF(ui\mc_ca.paa);
        class ItemInfo: UniformItem {
            uniformModel = "-";
            uniformClass = QEGVAR(units,rifleman);
            containerClass = "Supply50";
            mass = 50;
        };
    };
    class GVAR(mc_sleeve): U_B_CTRG_3 {
        scope = 2;
        displayName = CSTRING(mc_sleeve_displayName);
        picture = QPATHTOF(ui\mc_sleeve_ca.paa);
        class ItemInfo: UniformItem {
            uniformModel = "-";
            uniformClass = QEGVAR(units,rto);
            containerClass = "Supply50";
            mass = 50;
        };
    };
    class GVAR(mc_beret): U_B_CTRG_1 {
        scope = 2;
        displayName = CSTRING(mc_beret_displayName);
        picture = QPATHTOF(ui\mc_beret_ca.paa);
        class ItemInfo: UniformItem {
            uniformModel = "-";
            uniformClass = QEGVAR(units,leader);
            containerClass = "Supply50";
            mass = 50;
        };
    };
    class GVAR(mc_beret_sleeve): U_B_CTRG_3 {
        scope = 2;
        displayName = CSTRING(mc_beret_sleeve_displayName);
        picture = QPATHTOF(ui\mc_beret_sleeve_ca.paa);
        class ItemInfo: UniformItem {
            uniformModel = "-";
            uniformClass = QEGVAR(units,operator);
            containerClass = "Supply50";
            mass = 50;
        };
    };
};
