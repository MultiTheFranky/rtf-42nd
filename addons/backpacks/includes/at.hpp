class GVAR(at): B_Kitbag_rgr {
    displayName = CSTRING(AT);
    _generalMacro = QGVAR(at);
    class TransportItems {
                MACRO_ADDITEM(ACE_EntrenchingTool,1);
                MACRO_ADDITEM(ACE_EarPlugs,1);
                MACRO_ADDITEM(EGVAR(gas,AirPurifyingRespirator),1);
    };
    class TransportMagazines {
    };
};
