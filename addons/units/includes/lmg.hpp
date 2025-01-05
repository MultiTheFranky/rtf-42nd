class GVAR(lmg): tweed_acu_summer_ocp_crye_knee {
    _generalMacro = QGVAR(lmg);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(lmg_DisplayName);
    weapons[] = {QEGVAR(weapons,lmg_primaryWeapon),QEGVAR(weapons,lmg_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,lmg_primaryWeapon),QEGVAR(weapons,lmg_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,lmg);
    backpack = QEGVAR(backpacks,lmg);
    linkedItems[] = {QEGVAR(vests,lmg),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,lmg),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ACE_Altimeter"};
    items[] = {"ACE_tourniquet","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","tsp_sling","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green"};
    respawnItems[] = {"ACE_tourniquet","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_CableTie","tsp_sling","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green"};
    magazines[] = {"rhsusf_200rnd_556x45_M855_mixed_box","X26_Cartridge"};
    respawnMagazines[] = {"rhsusf_200rnd_556x45_M855_mixed_box","X26_Cartridge"};
    #include "disableRandomize.hpp"
};
