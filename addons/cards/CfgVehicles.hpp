class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class GVAR(SeeCards) {
                displayName = ECSTRING(objects,SeeCards);
                condition = QUOTE([ARR_2(_player,_target)] call FUNC(canSeeCards));
                exceptions[] = {};
                statement = "";
                icon = QPATHTOEF(items,ui\icon_cards_ca.paa);
                insertChildren = QUOTE(_this call FUNC(addCardActions));
            };
        };
    };
};
