class GVAR(lmg): B_CTRG_soldier_GL_LAT_F {
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(lmg_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa),QUOTE(\CUP\Weapons\CUP_Weapons_Items\data\insignia\insignia_75th_ranger.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat),QUOTE(\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat)};
    weapons[] = {QEGVAR(weapons,lmg_primaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,lmg_primaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,mc);
    backpack = QEGVAR(backpacks,lmg);
    linkedItems[] = {QEGVAR(vests,lmg),"CUP_H_OpsCore_Covered_MCAM","rhsusf_oakley_goggles_clr","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    respawnLinkedItems[] = {QEGVAR(vests,lmg),"CUP_H_OpsCore_Covered_MCAM","rhsusf_oakley_goggles_clr","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    items[] = {"ACE_tourniquet","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green"};
    respawnItems[] = {"ACE_tourniquet","ACE_morphine","ACE_epinephrine","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green"};
    magazines[] = {"rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote","rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote"};
    respawnMagazines[] = {"rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote","rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote"};
    #include "disableRandomize.hpp"
};
