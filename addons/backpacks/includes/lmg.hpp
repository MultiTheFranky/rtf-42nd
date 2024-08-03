class GVAR(lmg): B_Kitbag_rgr {
    displayName = CSTRING(LMG);
    _generalMacro = QGVAR(lmg);
    class TransportItems {
                MACRO_ADDITEM(rtf42_items_Cards,1);
                MACRO_ADDITEM(ACE_EarPlugs,1);
                MACRO_ADDITEM(ACE_EntrenchingTool,1);
                MACRO_ADDITEM(ACE_IR_Strobe_Item,1);
                MACRO_ADDITEM(ACE_splint,1);
                MACRO_ADDITEM(ACE_CableTie,10);
                MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),1);
    };
    class TransportMagazines {
                MACRO_ADDMAGAZINE(rhsusf_100Rnd_556x45_mixed_soft_pouch,1);
                MACRO_ADDMAGAZINE(rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote,1);
    };
};
