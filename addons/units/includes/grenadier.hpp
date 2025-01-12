class GVAR(grenadier): GVAR(tweed_acu_summer_ocp_crye_knee) {
    _generalMacro = QGVAR(grenadier);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(grenadier_DisplayName);
    weapons[] = {QEGVAR(weapons,hk416),QEGVAR(weapons,grenadier_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,hk416),QEGVAR(weapons,grenadier_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,base);
    backpack = QEGVAR(backpacks,grenadier);
    linkedItems[] = {QEGVAR(vests,grenadier),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,grenadier),"3DMA_WD_Opscore_V2","G_tweed_tacticool_weiss_oak","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter"};
    items[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","acc_flashlight","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","tsp_sling"};
    respawnItems[] = {"ACE_EarPlugs","ACE_tourniquet","ACE_morphine","ACE_epinephrine","rtf42_items_Cards","acc_flashlight","ACE_IR_Strobe_Item","ACE_quikclot","ACE_packingBandage","tsp_sling"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","1Rnd_HE_Grenade_shell","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","1Rnd_HE_Grenade_shell"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","1Rnd_HE_Grenade_shell","rhs_mag_m67","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","1Rnd_HE_Grenade_shell"};
    #include "disableRandomize.hpp"
};
