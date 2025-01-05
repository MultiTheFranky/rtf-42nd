class GVAR(wvm): B_CTRG_soldier_GL_LAT_F {
    _generalMacro = QGVAR(wvm);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(wvm_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat)};
    weapons[] = {QEGVAR(weapons,wvm_primaryWeapon),QEGVAR(weapons,wvm_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,wvm_primaryWeapon),QEGVAR(weapons,wvm_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,wvm);
    backpack = QEGVAR(backpacks,wvm);
    linkedItems[] = {QEGVAR(vests,wvm),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,wvm),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    items[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","rhsusf_acc_wmx_bk","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","iedd_item_notebook","tsp_sling","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green"};
    respawnItems[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","rhsusf_acc_wmx_bk","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","iedd_item_notebook","tsp_sling","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","X26_Cartridge"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","X26_Cartridge"};
    #include "disableRandomize.hpp"
};
