/** ACE3 Cargo Ambulance Supply (CUSTOM) **/
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
    MACRO_ADDITEM(ACE_personalAidKit,8);
    MACRO_ADDITEM(ACE_suture,2);
    MACRO_ADDITEM(ACE_splint,12);
    MACRO_ADDITEM(ACE_bodyBag,12);
    MACRO_ADDITEM(ACE_morphine,15);
    MACRO_ADDITEM(ACE_epinephrine,15);
    MACRO_ADDITEM(ACE_adenosine,15);
    MACRO_ADDITEM(ACE_salineIV,5);
    MACRO_ADDITEM(ACE_salineIV_500,5);
    MACRO_ADDITEM(ACE_salineIV_250,5);
    MACRO_ADDITEM(ACE_bloodIV,3);
    MACRO_ADDITEM(ACE_bloodIV_500,3);
    MACRO_ADDITEM(ACE_bloodIV_250,3);
    MACRO_ADDITEM(ACE_elasticBandage,10);
    MACRO_ADDITEM(ACE_packingBandage,20);
    MACRO_ADDITEM(ACE_quikclot,30);
    MACRO_ADDITEM(ACE_tourniquet,15);
    MACRO_ADDITEM(ACRE_PRC152,1);
    MACRO_ADDITEM(ACE_CableTie,10);
    MACRO_ADDITEM(ACE_EarPlugs,5);
    MACRO_ADDITEM(ACE_rope6,1);
    MACRO_ADDITEM(ACE_IR_Strobe_Item,3);
    MACRO_ADDITEM(ACE_Flashlight_MX991,1);
    MACRO_ADDITEM(ACE_surgicalKit,1);
    MACRO_ADDITEM(Binocular,1);
    MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),2);
};
class TransportWeapons {
    MACRO_ADDWEAPON(CUP_hgun_FlareGun,1);
};
ace_cargo_size = 8;
ace_cargo_space = 8;
class ACE_Cargo {
    class Cargo {
        class ACE_Wheel {
            type = "ACE_Wheel";
            amount = 1;
        };
    };
};
