class CfgVehicles {
    class Item_Base_F;
    class GVAR(Cards): Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CardsDisplayName);
        author = ECSTRING(main,Author);
        vehicleClass = "Items";
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
    class GVAR(CeilingLamp): Lamps_base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CeilingLampDisplayName);
        author = ECSTRING(main,Author);
        vehicleClass = "Cargo";
        editorCategory = "EdCat_Things";
        editorSubcategory = "EdSubcat_Lamps";
        model = QPATHTOF(data\ceiling_lamp.p3d);
        _generalMacro = QGVAR(CeilingLamp);
        aggregateReflectors[] = {{"Light_1"}};
        class Reflectors {
            class Light_1 {
                color[] = {1000,1000,1100};
                ambient[] = {10,10,12};
                intensity = 5;
                size = 1;
                innerAngle = 90;
                outerAngle = 360;
                coneFadeCoef = 4;
                position = "Light_1_pos";
                direction = "Light_1_dir";
                selection = "Light_1_pos";
                hitpoint = "";
                useFlare = 1;
                flareSize = 1;
                flareMaxDistance = 250;
                class Attenuation {
                    start = 0;
                    constant = 20;
                    linear = 0;
                    quadratic = 0.5;
                    hardLimitStart = 40;
                    hardLimitEnd = 60;
                };
            };
        };
    };
};
