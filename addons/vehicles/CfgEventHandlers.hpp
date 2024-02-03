class Extended_PreStart_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preStart));
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_InitPost_EventHandlers {
    /* class rhsusf_m1025_w {
        class ADDON {
            init = "[_this, [['Passenger (Right Trunk)', [[0.5,-1.2,-1.3],-90]], ['Passenger (Left Trunk)', [[-0.5,-1.2,-1.3],90]]]] call rtf42_vehicles_fnc_onInit";
        };
    }; */
};
