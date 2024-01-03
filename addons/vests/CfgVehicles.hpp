class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(Explode) {
                displayName = ECSTRING(objects,Explode);
                condition = QUOTE([ARR_1(_player)] call FUNC(canExplode));
                exceptions[] = {};
                statement = QUOTE([ARR_2(_player,_target)] call FUNC(explode));
                icon = QPATHTOEF(ui,data\icon_explosion_ca.paa);
            };
        };
    };
};
