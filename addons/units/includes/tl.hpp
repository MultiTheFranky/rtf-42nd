class GVAR(tl): B_CTRG_soldier_GL_LAT_F {
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(tl_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa),QUOTE(\CUP\Weapons\CUP_Weapons_Items\data\insignia\insignia_75th_ranger.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat),QUOTE(\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat)};
    weapons[] = {QEGVAR(weapons,tl_primaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,tl_primaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,mc);
    backpack = QEGVAR(backpacks,tl);
    linkedItems[] = {QEGVAR(vests,tl),"CUP_H_OpsCore_Spray","rhsusf_oakley_goggles_clr",QEGVAR(weapons,tl_binoculars),"ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    respawnLinkedItems[] = {QEGVAR(vests,tl),"CUP_H_OpsCore_Spray","rhsusf_oakley_goggles_clr",QEGVAR(weapons,tl_binoculars),"ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    items[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","acc_flashlight","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellOrange"};
    respawnItems[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","acc_flashlight","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellOrange"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG"};
    #include "disableRandomize.hpp"
};
