/** ACE3 Cargo Supply Truck (CUSTOM) **/
class TransportBackpacks {};
class TransportMagazines {
    MACRO_ADDMAGAZINE(CUP_IllumFlareWhite_265_M,2);
    MACRO_ADDMAGAZINE(CUP_FlareGreen_265_M,1);
    MACRO_ADDMAGAZINE(ACE_Chemlight_HiBlue,3);
    MACRO_ADDMAGAZINE(ACE_Chemlight_HiGreen,3);
    MACRO_ADDMAGAZINE(ACE_HandFlare_Green,1);
    MACRO_ADDMAGAZINE(ACE_HandFlare_Red,1);
    MACRO_ADDMAGAZINE(ACE_HandFlare_White,1);
    MACRO_ADDMAGAZINE(ACE_HandFlare_Yellow,1);
    MACRO_ADDMAGAZINE(SmokeShellBlue,2);
    MACRO_ADDMAGAZINE(SmokeShell,5);
    MACRO_ADDMAGAZINE(SmokeShellGreen,2);
    MACRO_ADDMAGAZINE(SmokeShellRed,2);
};
class TransportItems {
    MACRO_ADDITEM(ACE_EntrenchingTool,3);
    MACRO_ADDITEM(ACE_SpraypaintBlue,4);
    MACRO_ADDITEM(ACRE_PRC152,1);
    MACRO_ADDITEM(ACE_CableTie,15);
    MACRO_ADDITEM(ACE_EarPlugs,5);
    MACRO_ADDITEM(ACE_M26_Clacker,2);
    MACRO_ADDITEM(MineDetector,3);
    MACRO_ADDITEM(ace_marker_flags_red,5);
    MACRO_ADDITEM(ace_marker_flags_blue,5);
    MACRO_ADDITEM(ACE_DefusalKit,2);
    MACRO_ADDITEM(Laserbatteries,2);
    MACRO_ADDITEM(ACE_SpareBarrel,2);
    MACRO_ADDITEM(ACE_rope6,3);
    MACRO_ADDITEM(ACE_rope15,1);
    MACRO_ADDITEM(ACE_rope12,1);
    MACRO_ADDITEM(ACE_IR_Strobe_Item,5);
    MACRO_ADDITEM(ACE_Flashlight_MX991,4);
    MACRO_ADDITEM(ToolKit,4);
    MACRO_ADDITEM(Binocular,1);
    MACRO_ADDITEM(ACE_RangeTable_82mm,1);
    MACRO_ADDITEM(JCA_G_AirPurifyingRespirator_03_black_clear_F,2);
};
class TransportWeapons {
    MACRO_ADDWEAPON(CUP_hgun_FlareGun,1);
};
ace_cargo_size = 9;
ace_cargo_space = 9;
class ACE_Cargo {
    class Cargo {
        class ACE_Wheel {
            type = "ACE_Wheel";
            amount = 3;
        };
        class GVAR(b_m252_us) {
            type = QGVAR(b_m252_us);
            amount = 1;
        };
    };
};
