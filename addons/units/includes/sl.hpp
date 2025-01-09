class GVAR(sl): tweed_acu_summer_ocp_crye_knee_jedi {
    _generalMacro = QGVAR(sl);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(sl_DisplayName);
    weapons[] = {QEGVAR(weapons,sl_primaryWeapon),QEGVAR(weapons,glock),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,sl_primaryWeapon),QEGVAR(weapons,glock),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,semisleeve);
    backpack = QEGVAR(backpacks,sl);
    linkedItems[] = {QEGVAR(vests,sl),"rhsusf_mich_bare_norotos_alt","G_tweed_tacticool_weiss_oak",QEGVAR(weapons,vector),"ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,sl),"rhsusf_mich_bare_norotos_alt","G_tweed_tacticool_weiss_oak",QEGVAR(weapons,vector),"ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    items[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","rhsusf_acc_wmx_bk","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","ItemcTabHCam","tsp_sling","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellOrange"};
    respawnItems[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","rhsusf_acc_wmx_bk","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","ItemcTabHCam","tsp_sling","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellOrange"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_m67","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_FMJ","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_m67","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_FMJ","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP"};
    #include "disableRandomize.hpp"
};
