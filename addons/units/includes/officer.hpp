class GVAR(officer): B_CTRG_soldier_GL_LAT_F {
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(officer_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa),QUOTE(\CUP\Weapons\CUP_Weapons_Items\data\insignia\insignia_75th_ranger.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat),QUOTE(\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat)};
    weapons[] = {QEGVAR(weapons,officer_primaryWeapon),QEGVAR(weapons,officer_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,officer_primaryWeapon),QEGVAR(weapons,officer_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,mc);
    backpack = QEGVAR(backpacks,officer);
    linkedItems[] = {QEGVAR(vests,officer),"rhsusf_mich_bare_norotos_alt_tan","rhsusf_oakley_goggles_clr",QEGVAR(weapons,officer_binoculars),"ItemMap","ItemcTab","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    respawnLinkedItems[] = {QEGVAR(vests,officer),"rhsusf_mich_bare_norotos_alt_tan","rhsusf_oakley_goggles_clr",QEGVAR(weapons,officer_binoculars),"ItemMap","ItemcTab","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    items[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","acc_flashlight","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellOrange"};
    respawnItems[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","acc_flashlight","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellOrange"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_FMJ","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_FMJ","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP"};
    #include "disableRandomize.hpp"
};
