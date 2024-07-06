class GVAR(officer): B_AssaultPack_rgr {
    displayName = CSTRING(Officer);
    class TransportItems {
                MACRO_ADDITEM(ACE_splint,1);
                MACRO_ADDITEM(ACE_packingBandage,4);
                MACRO_ADDITEM(ACE_quikclot,9);
                MACRO_ADDITEM(ACE_EntrenchingTool,1);
                MACRO_ADDITEM(ACE_SpraypaintBlue,1);
                MACRO_ADDITEM(ACE_MapTools,1);
                MACRO_ADDITEM(ACE_Flashlight_MX991,1);
                MACRO_ADDITEM(ACE_CableTie,5);
                MACRO_ADDITEM(SmokeShellGreen,2);
                MACRO_ADDITEM(SmokeShellRed,2);
                MACRO_ADDITEM(Laserbatteries,2);
                MACRO_ADDITEM(ACE_HandFlare_Green,1);
                MACRO_ADDITEM(ACE_HandFlare_Red,1);
                MACRO_ADDITEM(ACE_HandFlare_White,1);
                MACRO_ADDITEM(ACE_HandFlare_Yellow,1);
                MACRO_ADDITEM(SmokeShellBlue,2);
                MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),1);
    };
    class TransportMagazines {
                MACRO_ADDMAGAZINE(rhs_mag_m67,1);
                MACRO_ADDMAGAZINE(rhs_mag_mk84,2);
    };

    // TFAR Radio Settings
    tf_dialogUpdate = "call TFAR_fnc_updateLRDialogToChannel;";
    tf_hasLRradio = 1;
    tf_range = 8000;
    tf_encryptionCode = "tf_west_radio_code";
    tf_dialog = "rt1523g_radio_dialog";
    tf_subtype = "digital_lr";
};
