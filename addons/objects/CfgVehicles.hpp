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
    #include "./data/ceiling_lamp/ceiling_lamp.hpp"
    class House_F;
    #include "./data/door/door.hpp"
    #include "./data/reinforced_door/reinforced_door.hpp"
    class ThingX;
    #include "./data/speaker/speaker.hpp"
    class Leaflet_05_F;
    class Leaflet_05_New_F;
    #include "./data/intel_document/intel_document.hpp"
};
