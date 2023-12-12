class CfgVehicles {     
    class B_CTRG_soldier_GL_LAT_F;
    class B_CTRG_Soldier_3_F;
    class GVAR(UnitBase): B_CTRG_soldier_GL_LAT_F {
        author = "Echo";
        scope = 0;
        scopeCurator = 0;
        faction = QEGVAR(main,Faction);
        editorSubcategory = QEGVAR(main,Infantry);
    };
        
    class GVAR(MC): GVAR(UnitBase) {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(UnitMCDisplayName);
        uniformClass = QEGVAR(uniforms,MC);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS}; 
        respawnLinkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS}; 

    };

    class GVAR(MCGreenBeret): GVAR(MC) {
        displayName = CSTRING(UnitGreenBeretMCDisplayName);
        uniformClass = QEGVAR(uniforms,MCGreenBeret);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_green_beret_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS}; 
        respawnLinkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS}; 
    };

    class GVAR(AOR1): GVAR(MC) {
        displayName = CSTRING(UnitAOR1DisplayName);
        uniformClass = QEGVAR(uniforms,AOR1);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_aor1_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),BASEITEMS}; 
        respawnLinkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),BASEITEMS}; 
    };

    class GVAR(AOR1GreenBeret): GVAR(AOR1) {
        displayName = CSTRING(UnitGreenBeretAOR1DisplayName);
        uniformClass = QEGVAR(uniforms,AOR1GreenBeret);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_aor1_green_beret_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),"ItemMap","ItemCompass","ItemWatch","ItemRadio"}; 
        respawnLinkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),"ItemMap","ItemCompass","ItemWatch","ItemRadio"}; 
    };

    // Long sleeve uniforms

    class GVAR(UnitBaseS): B_CTRG_Soldier_3_F {
        author = "Echo";
        scope = 0;
        scopeCurator = 0;
        faction = QEGVAR(main,Faction);
        editorSubcategory = QEGVAR(main,Infantry);
    };

    class GVAR(MCS): GVAR(UnitBaseS) {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(UnitMCSDisplayName);
        uniformClass = QEGVAR(uniforms,MCS);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS};
        respawnLinkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS};
    };

    class GVAR(MCGreenBeretS): GVAR(MCS) {
        displayName = CSTRING(UnitGreenBeretMCSDisplayName);
        uniformClass = QEGVAR(uniforms,MCSGreenBeret);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_green_beret_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS};
        respawnLinkedItems[] = {QEGVAR(helmets,MC),QEGVAR(vests,Base),BASEITEMS};
    };

    class GVAR(AOR1S): GVAR(MCS) {
        displayName = CSTRING(UnitAOR1SDisplayName);
        uniformClass = QEGVAR(uniforms,AOR1S);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_aor1_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),BASEITEMS};
        respawnLinkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),BASEITEMS};
    };

    class GVAR(AOR1GreenBeretS): GVAR(AOR1S) {
        displayName = CSTRING(UnitGreenBeretAOR1SDisplayName);
        uniformClass = QEGVAR(uniforms,AOR1SGreenBeret);
        hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_aor1_green_beret_ca.paa)};
        linkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),BASEITEMS};
        respawnLinkedItems[] = {QEGVAR(helmets,AOR1),QEGVAR(vests,Base),BASEITEMS};
    };
};