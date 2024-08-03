/** ACE3 Cargo Base (CUSTOM) **/
class TransportBackpacks {};
class TransportMagazines {
    MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote,2);
    MACRO_ADDMAGAZINE(CUP_IllumFlareWhite_265_M,2);
    MACRO_ADDMAGAZINE(CUP_FlareGreen_265_M,2);
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
    MACRO_ADDITEM(ACE_EntrenchingTool,1);
    MACRO_ADDITEM(ACE_SpraypaintBlue,2);
    MACRO_ADDITEM(ACE_CableTie,10);
    MACRO_ADDITEM(ACE_EarPlugs,5);
    MACRO_ADDITEM(ACE_M26_Clacker,1);
    MACRO_ADDITEM(ACE_bodyBag,2);
    MACRO_ADDITEM(MineDetector,1);
    MACRO_ADDITEM(ace_marker_flags_red,5);
    MACRO_ADDITEM(ace_marker_flags_blue,5);
    MACRO_ADDITEM(ACE_DefusalKit,1);
    MACRO_ADDITEM(Laserbatteries,2);
    MACRO_ADDITEM(ACE_SpareBarrel,1);
    MACRO_ADDITEM(ACE_rope6,1);
    MACRO_ADDITEM(ACE_IR_Strobe_Item,3);
    MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),2);
};
class TransportWeapons {
    MACRO_ADDWEAPON(rhs_weap_M136_hedp,1);
    MACRO_ADDWEAPON(CUP_hgun_FlareGun,1);
};
ace_cargo_size = 6;
ace_cargo_space = 6;
class ACE_Cargo {
    class Cargo {
        class ACE_Wheel {
            type = "ACE_Wheel";
            amount = 1;
        };
    };
};
