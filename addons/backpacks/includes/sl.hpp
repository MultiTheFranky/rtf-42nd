class GVAR(sl): B_AssaultPack_rgr {
    displayName = CSTRING(SquadLeader);
    class TransportItems {
                MACRO_ADDITEM(ACE_splint,1);
                MACRO_ADDITEM(ACE_packingBandage,4);
                MACRO_ADDITEM(ACE_quikclot,9);
                MACRO_ADDITEM(ACE_EntrenchingTool,1);
                MACRO_ADDITEM(ACE_SpraypaintBlue,1);
                MACRO_ADDITEM(ACE_MapTools,1);
                MACRO_ADDITEM(ACE_Flashlight_MX991,1);
                MACRO_ADDITEM(ACE_CableTie,10);
                MACRO_ADDITEM(SmokeShellGreen,2);
                MACRO_ADDITEM(SmokeShellRed,2);
                MACRO_ADDITEM(Laserbatteries,2);
                MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),1);
    };
    class TransportMagazines {
                MACRO_ADDMAGAZINE(rhs_mag_m67,1);
                MACRO_ADDMAGAZINE(rhs_mag_mk84,2);
    };
};
