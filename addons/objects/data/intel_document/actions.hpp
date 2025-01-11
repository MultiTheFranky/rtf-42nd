class ACE_Actions {
        class ACE_MainActions {
            displayName = "Intel Document";
            selection = "";
            distance = 2.5;
            condition = "alive _target";
            position = "[0,0,0]";
            icon = "z\ace\addons\intelitems\ui\notepad_ca.paa";
            class GVAR(PickUp) {
                displayName = CSTRING(PickUp);
                condition = QUOTE(true);
                statement = QUOTE(deleteVehicle _target);
                icon = "a3\ui_f\data\igui\rscingameui\rscunitinfoairrtdfull\ico_insp_hand_ca.paa";
                distance = 2;
                showDisabled = 0;
                priority = 1.5;
                exceptions[] = {};
            };
        };
    };