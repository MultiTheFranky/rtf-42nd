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