class GVAR(paramedic): B_CTRG_soldier_GL_LAT_F {
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(paramedic_DisplayName);
    hiddenSelectionsTextures[] = {QPATHTOEF(uniforms,data\rtf42_uniform_mc_ca.paa),QUOTE(\CUP\Weapons\CUP_Weapons_Items\data\insignia\insignia_75th_ranger.paa)};
    hiddenSelectionsMaterials[] = {QPATHTOEF(uniforms,data\clothing1.rvmat),QUOTE(\A3\Ui_f\data\GUI\Cfg\UnitInsignia\default_insignia.rvmat)};
    weapons[] = {QEGVAR(weapons,paramedic_primaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,paramedic_primaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,mc);
    backpack = QEGVAR(backpacks,paramedic);
    linkedItems[] = {QEGVAR(vests,paramedic),"CUP_H_OpsCore_Covered_MCAM","rhsusf_oakley_goggles_clr","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    respawnLinkedItems[] = {QEGVAR(vests,paramedic),"CUP_H_OpsCore_Covered_MCAM","rhsusf_oakley_goggles_clr","ItemMap","ItemGPS","rhsusf_radio_anprc152","ItemCompass","ACE_Altimeter","rhsusf_ANPVS_15"};
    items[] = {"ACE_EarPlugs","rtf42_items_Cards","ACE_IR_Strobe_Item","HandGrenade","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellGreen"};
    respawnItems[] = {"ACE_EarPlugs","rtf42_items_Cards","ACE_IR_Strobe_Item","HandGrenade","SmokeShell","SmokeShell","Chemlight_green","Chemlight_green","SmokeShellGreen"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_Stanag"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_Stanag","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_PMAG","rhs_mag_30Rnd_556x45_M855A1_Stanag"};
    #include "disableRandomize.hpp"
};
