class GVAR(combat_medic): tweed_acu_summer_ocp_crye_knee {
    _generalMacro = QGVAR(combat_medic);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(combat_medic_DisplayName);
    weapons[] = {QEGVAR(weapons,combat_medic_primaryWeapon),QEGVAR(weapons,combat_medic_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,combat_medic_primaryWeapon),QEGVAR(weapons,combat_medic_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,combat_medic);
    backpack = QEGVAR(backpacks,combat_medic);
    linkedItems[] = {QEGVAR(vests,combat_medic),"CUP_H_OpsCore_Tan","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,combat_medic),"CUP_H_OpsCore_Tan","G_tweed_tacticool_weiss_oak","ItemMap","ItemMicroDAGR","TFAR_anprc152","ItemCompass","ACE_Altimeter"};
    items[] = {"ACE_EarPlugs","rtf42_items_Cards","rhsusf_acc_wmx_bk","ACE_IR_Strobe_Item","tsp_sling","HandGrenade","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellGreen"};
    respawnItems[] = {"ACE_EarPlugs","rtf42_items_Cards","rhsusf_acc_wmx_bk","ACE_IR_Strobe_Item","tsp_sling","HandGrenade","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellGreen"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_Stanag","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhsusf_mag_17Rnd_9x19_JHP"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_Stanag","rhsusf_mag_17Rnd_9x19_JHP","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_Stanag","rhsusf_mag_17Rnd_9x19_JHP"};
    #include "disableRandomize.hpp"
};
