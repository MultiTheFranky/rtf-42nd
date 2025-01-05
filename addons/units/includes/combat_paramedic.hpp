class GVAR(combat_paramedic): tweed_acu_summer_ocp_crye_knee {
    _generalMacro = QGVAR(combat_paramedic);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(combat_paramedic_DisplayName);
    weapons[] = {QEGVAR(weapons,combat_paramedic_primaryWeapon),QEGVAR(weapons,combat_paramedic_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,combat_paramedic_primaryWeapon),QEGVAR(weapons,combat_paramedic_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,combat_paramedic);
    backpack = QEGVAR(backpacks,combat_paramedic);
    linkedItems[] = {QEGVAR(vests,combat_paramedic),"3DMA_WD_Opscore_V2","G_tweed_ESS_tan","ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ACE_Altimeter"};
    respawnLinkedItems[] = {QEGVAR(vests,combat_paramedic),"3DMA_WD_Opscore_V2","G_tweed_ESS_tan","ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ACE_Altimeter"};
    items[] = {"ACE_EarPlugs","rtf42_items_Cards","ACE_IR_Strobe_Item","HandGrenade","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellGreen"};
    respawnItems[] = {"ACE_EarPlugs","rtf42_items_Cards","ACE_IR_Strobe_Item","HandGrenade","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellGreen"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_Stanag","X26_Cartridge"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_Stanag","X26_Cartridge"};
    #include "disableRandomize.hpp"
};
