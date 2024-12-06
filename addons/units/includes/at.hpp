class GVAR(at): B_CTRG_soldier_GL_LAT_F {
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(at_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa),QUOTE(\CUP\Weapons\CUP_Weapons_Items\data\insignia\insignia_75th_ranger.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat),QUOTE(\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat)};
    weapons[] = {QEGVAR(weapons,at_primaryWeapon),QEGVAR(weapons,at_launcher),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,at_primaryWeapon),QEGVAR(weapons,at_launcher),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,mc);
    backpack = QEGVAR(backpacks,at);
    linkedItems[] = {QEGVAR(vests,at),"CUP_H_OpsCore_Covered_MCAM","rhsusf_oakley_goggles_clr","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    respawnLinkedItems[] = {QEGVAR(vests,at),"CUP_H_OpsCore_Covered_MCAM","rhsusf_oakley_goggles_clr","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    items[] = {"rtf42_items_Cards","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_IR_Strobe_Item","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green","SmokeShellRed","SmokeShellRed"};
    respawnItems[] = {"rtf42_items_Cards","ACE_epinephrine","ACE_morphine","ACE_tourniquet","ACE_splint","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_packingBandage","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_quikclot","ACE_IR_Strobe_Item","HandGrenade","HandGrenade","SmokeShell","SmokeShell","SmokeShellGreen","SmokeShellGreen","Chemlight_green","Chemlight_green","SmokeShellRed","SmokeShellRed"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG"};
    #include "disableRandomize.hpp"
};
