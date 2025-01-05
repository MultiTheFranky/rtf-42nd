class GVAR(officer): tweed_acu_summer_ocp_crye_knee_trop {
    _generalMacro = QGVAR(officer);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(officer_DisplayName);
    weapons[] = {QEGVAR(weapons,officer_primaryWeapon),QEGVAR(weapons,officer_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,officer_primaryWeapon),QEGVAR(weapons,officer_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,officer);
    backpack = QEGVAR(backpacks,officer);
    linkedItems[] = {QEGVAR(vests,officer),"rhsusf_mich_bare_norotos_alt_tan","G_tweed_tacticool_weiss_oak",QEGVAR(weapons,officer_binoculars),"ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,officer),"rhsusf_mich_bare_norotos_alt_tan","G_tweed_tacticool_weiss_oak",QEGVAR(weapons,officer_binoculars),"ItemMap","ItemcTab","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    items[] = {"rtf42_items_Cards","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_adenosine","ACE_morphine","ACE_epinephrine","ACE_IR_Strobe_Item","SmokeShell","SmokeShell","SmokeShell"};
    respawnItems[] = {"rtf42_items_Cards","ACE_EarPlugs","ACE_CableTie","ACE_CableTie","ACE_adenosine","ACE_morphine","ACE_epinephrine","ACE_IR_Strobe_Item","SmokeShell","SmokeShell","SmokeShell"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_FMJ","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_m67","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhsusf_mag_17Rnd_9x19_JHP"};
    #include "disableRandomize.hpp"
};
