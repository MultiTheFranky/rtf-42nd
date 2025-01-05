class GVAR(interpreter): tweed_acu_summer_ocp_blench_tuck_trop {
    _generalMacro = QGVAR(interpreter);
    author = ECSTRING(main,Author);
    scope = 2;
    scopeCurator = 2;
    faction = QEGVAR(main,Faction);
    editorSubcategory = QEGVAR(main,Infantry);
    displayName = CSTRING(interpreter_DisplayName);
    weapons[] = {QEGVAR(weapons,interpreter_primaryWeapon),QEGVAR(weapons,interpreter_secondaryWeapon),"Throw","Put"};
    respawnWeapons[] = {QEGVAR(weapons,interpreter_primaryWeapon),QEGVAR(weapons,interpreter_secondaryWeapon),"Throw","Put"};
    uniformClass = QEGVAR(uniforms,interpreter);
    backpack = QEGVAR(backpacks,interpreter);
    linkedItems[] = {QEGVAR(vests,interpreter),"CUP_H_Ger_M92_Tan",QEGVAR(weapons,interpreter_binoculars),"ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ItemWatch",""};
    respawnLinkedItems[] = {QEGVAR(vests,interpreter),"CUP_H_Ger_M92_Tan",QEGVAR(weapons,interpreter_binoculars),"ItemMap","ItemMicroDAGR","TFAR_rf7800str","ItemCompass","ItemWatch",""};
    items[] = {"tsp_sling"};
    respawnItems[] = {"tsp_sling"};
    magazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","CUP_8Rnd_9x18_Makarov_M","rhs_mag_30Rnd_556x45_M855A1_PMAG","CUP_8Rnd_9x18_Makarov_M"};
    respawnMagazines[] = {"rhs_mag_30Rnd_556x45_M855A1_PMAG","CUP_8Rnd_9x18_Makarov_M","rhs_mag_30Rnd_556x45_M855A1_PMAG","CUP_8Rnd_9x18_Makarov_M"};
    #include "disableRandomize.hpp"
};
