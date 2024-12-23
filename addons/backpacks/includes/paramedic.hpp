class GVAR(paramedic): milgp_b_patrol_01_rgr {
    displayName = CSTRING(Paramedic);
    _generalMacro = QGVAR(paramedic);
    class TransportItems {
                MACRO_ADDITEM(ACE_packingBandage,20);
                MACRO_ADDITEM(ACE_quikclot,25);
                MACRO_ADDITEM(ACE_elasticBandage,10);
                MACRO_ADDITEM(ACE_salineIV_500,5);
                MACRO_ADDITEM(ACE_salineIV_250,5);
                MACRO_ADDITEM(ACE_splint,10);
                MACRO_ADDITEM(ACE_tourniquet,10);
                MACRO_ADDITEM(ACE_morphine,15);
                MACRO_ADDITEM(ACE_epinephrine,10);
                MACRO_ADDITEM(ACE_EntrenchingTool,1);
                MACRO_ADDITEM(ACE_CableTie,10);
                MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),1);
    };
    class TransportMagazines {
    };
};
