class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;
    class GVAR(Cards): ACE_ItemCore {
        author = ECSTRING(main,Author);
        scope = 2;
        displayName = CSTRING(CardsDisplayName);
        descriptionShort = CSTRING(CardsDescription);
        model = QPATHTOF(data\cards.p3d);
        picture = QPATHTOF(ui\icon_cards_ca.paa);
        icon = "iconObject_circle";
        mapSize = 0.034;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 1;
        };
    };
};
