class GVAR(at_specialist): B_CTRG_soldier_GL_LAT_F {
    _generalMacro = QGVAR(at_specialist);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(at_specialist_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat)};
    weapons[] = {QEGVAR(weapons,at_specialist_primaryWeapon),QEGVAR(weapons,at_specialist_secondaryWeapon),QEGVAR(weapons,at_specialist_launcher),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,at_specialist_primaryWeapon),QEGVAR(weapons,at_specialist_secondaryWeapon),QEGVAR(weapons,at_specialist_launcher),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,at_specialist);
    backpack = QEGVAR(backpacks,at_specialist);
    linkedItems[] = {QEGVAR(vests,at_specialist),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,at_specialist),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ACE_Altimeter"};
    items[] = {"rtf42_items_Cards","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_IR_Strobe_Item","tsp_sling","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green","SmokeShellRed","SmokeShellRed"};
    respawnItems[] = {"rtf42_items_Cards","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_IR_Strobe_Item","tsp_sling","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green","SmokeShellRed","SmokeShellRed"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","X26_Cartridge"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","X26_Cartridge"};
    #include "disableRandomize.hpp"
};
