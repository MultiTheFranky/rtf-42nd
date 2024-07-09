class CfgVehicles {
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
    class GVAR(CeilingLamp): Lamps_base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(CeilingLampDisplayName);
        author = ECSTRING(main,Author);
        vehicleClass = "Cargo";
        editorCategory = QEGVAR(main,Items);
        editorSubcategory = QEGVAR(main,Lights);
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
    class House_F;
    class GVAR(Door): House_F {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(DoorDisplayName);
        author = ECSTRING(main,Author);
        editorCategory = QEGVAR(main,Items);
        editorSubcategory = QEGVAR(main,Structure);
        model = QPATHTOF(data\door\door.p3d);
        class AnimationSources {
            class Door_source {
                source = QUOTE(user);
                initPhase = 0;
                animPeriod = 1;
                sound = QUOTE(GenericDoorsSound);
            };
        };
        class UserActions {
            class OpenDoor {
                displayNameDefault = "<img image='\A3\Ui_f\data\IGUI\Cfg\Actions\open_door_ca.paa' size='2.5' />";
                displayName = CSTRING(OpenDoorDisplayName);
                position = QUOTE(Door_trigger);
                priority = 0.4;
                radius = 1.5;
                onlyForPlayer = 0;
                condition = QUOTE((this animationPhase 'Door_rot') < 0.5);
                statement = QUOTE((ARR_4([this,'Door_rot','Door_Handle_rot_1','Door_Handle_rot_2']) call FUNC(DoorOpen)));
            };
            class CloseDoor: OpenDoor {
                displayName = CSTRING(CloseDoorDisplayName);
                priority = 0.2;
                condition = QUOTE(((this animationPhase 'Door_rot') >= 0.5));
                statement = QUOTE(ARR_4([this,'Door_rot','Door_Handle_rot_1','Door_Handle_rot_2']) call FUNC(DoorClose));
            };
        };
        actionBegin1 = QUOTE(OpenDoor);
        actionEnd1 = QUOTE(CloseDoor);
        numberOfDoors = 1;
    };
};
