class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class GVAR(ModuleSound3D): Module_F {
        scope = 2;
        displayName = CSTRING(Sound3DDisplayName);
        icon = "a3\modules_f_curator\data\iconsound_ca.paa";
        category = QEGVAR(main,Modules);
        function = QFUNC(modulePlaySound3D);
        functionPriority = 1;
        isGlobal = 1;
        isDisposable = 1;
        isTriggerActivated = 0;
        author = ECSTRING(main,Author);
        class Arguments {
            class File {
                displayName = CSTRING(FileDisplayName);
                typeName = "STRING";
                defaultValue = "";
                class values {
                    #include "Sounds3D.hpp"
                };
            };
            class Pitch {
                displayName = CSTRING(PitchDisplayName);
                typeName = "NUMBER";
                defaultValue = 1;
            };
            class Distance {
                displayName = CSTRING(DistanceDisplayName);
                typeName = "NUMBER";
                defaultValue = 500;
            };
            class Offset {
                displayName = CSTRING(OffsetDisplayName);
                typeName = "NUMBER";
                defaultValue = 0;
            };
            class Loop {
                displayName = CSTRING(LoopDisplayName);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Sound3DDescription);
            sync[] = {};
        };
    };
};