class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_Actions {
            class ACE_MainActions {
                class GVAR(action) {
                    displayName = CSTRING(InterrogateAction);
                    distance = 2;
                    condition = QUOTE(_this call DFUNC(canInterrogate));
                    statement = QUOTE(_this call DFUNC(interrogate));
                    icon = "a3\3den\data\cfgwaypoints\talk_ca.paa";
                    showDisabled = 0;
                };
                class GVAR(mreAction) {
                    displayName = CSTRING(MREAction);
                    distance = 2;
                    condition = QUOTE(_this call DFUNC(canGiveMRE));
                    statement = QUOTE(_this call DFUNC(giveMRE));
                    icon = "z\ace\addons\field_rations\ui\item_mre_type3_co.paa";
                    showDisabled = 0;
                };
            };
        };
    };
};