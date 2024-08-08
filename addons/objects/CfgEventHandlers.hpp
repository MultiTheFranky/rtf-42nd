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

class Extended_Killed_EventHandlers {
    class GVAR(Speaker) {
        class ADDON {
            serverKilled = QUOTE(call COMPILE_FILE(XEH_killed));
        };
    };
};
