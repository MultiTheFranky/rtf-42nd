class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class GVAR(ModuleSetInterrogation): Module_F {
        scope = 2;
        displayName = CSTRING(InterrogationDisplayName);
        icon = QPATHTOF(ui\Icon_Module_Interrogation_ca.paa);
        category = QEGVAR(main,Modules);
        function = QFUNC(moduleSetInformant);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(main,Author);
        class Arguments {
            class Answer1 {
                displayName = ECSTRING(interrogation,AnswerDisplayName);
                typeName = "STRING";
                defaultValue = "";
            };
            class Answer1Chance {
                displayName = ECSTRING(interrogation,SuccessChanceDisplayName);
                typeName = "NUMBER";
                defaultValue = 50;
            };
            class Answer2 {
                displayName = ECSTRING(interrogation,AnswerDisplayName);
                typeName = "STRING";
                defaultValue = "";
            };
            class Answer2Chance {
                displayName = ECSTRING(interrogation,SuccessChanceDisplayName);
                typeName = "NUMBER";
                defaultValue = 50;
            };
            class Answer3 {
                displayName = ECSTRING(interrogation,AnswerDisplayName);
                typeName = "STRING";
                defaultValue = "";
            };
            class Answer3Chance {
                displayName = ECSTRING(interrogation,SuccessChanceDisplayName);
                typeName = "NUMBER";
                defaultValue = 50;
            };
            class Answer4 {
                displayName = ECSTRING(interrogation,AnswerDisplayName);
                typeName = "STRING";
                defaultValue = "";
            };
            class Answer4Chance {
                displayName = ECSTRING(interrogation,SuccessChanceDisplayName);
                typeName = "NUMBER";
                defaultValue = 50;
            };
            class Answer5 {
                displayName = ECSTRING(interrogation,AnswerDisplayName);
                typeName = "STRING";
                defaultValue = "";
            };
            class Answer5Chance {
                displayName = ECSTRING(interrogation,SuccessChanceDisplayName);
                typeName = "NUMBER";
                defaultValue = 50;
            };
        };
        class ModuleDescription {
            description = CSTRING(Interrogation);
            sync[] = {"AnyAI"};
        };
    };

    class GVAR(ModuleSetTranslator): Module_F {
        scope = 2;
        displayName = CSTRING(TranslatorDisplayName);
        icon = QPATHTOF(ui\Icon_Module_Interrogation_ca.paa);
        category = QEGVAR(main,Modules);
        function = QFUNC(moduleSetTranslator);
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = ECSTRING(main,Author);
        class ModuleDescription {
            description = CSTRING(Interrogation);
            sync[] = {"AnyAI"};
        };
    };
};
