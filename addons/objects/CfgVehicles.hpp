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
        class SimpleObject
        {
            eden = 0;
            animate[] = {{"light_1_pitch_rot",0},{"light_1_jaw_rot",0.13}};
            hide[] = {"light_1_hide"};
            verticalOffset = 1.084;
            verticalOffsetWorld = 0;
            init = "''";
        };
        class AnimationSources {
            class Light_1_pitch_source {
                source = "user";
                initPhase = 0;
                animPeriod = "1/45";
            };
            class Light_1_jaw_source {
                source = "user";
                initPhase = 0.13;
                animPeriod = 2;
            };
        };
        class Reflectors {
            class Light_1 {
                color[] = {1000,1000,1200};
                ambient[] = {10,10,12};
                intensity = 5;
                size = 1;
                innerAngle = 60;
                outerAngle = 130;
                coneFadeCoef = 6;
                position = "Light_1_pos";
                direction = "Light_1_dir";
                hitpoint = "Light_1_hitpoint";
                selection = "Light_1_hide";
                useFlare = 1;
                flareSize = 0.9;
                flareMaxDistance = 250;
                class Attenuation {
                    start = 0;
                    constant = 0;
                    linear = 2;
                    quadratic = 0.5;
                    hardLimitStart = 50;
                    hardLimitEnd = 70;
                };
            };
        };
    };
};
