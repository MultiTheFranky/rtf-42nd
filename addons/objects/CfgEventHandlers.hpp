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

class Extended_Deleted_EventHandlers {
    class GVAR(Speaker) {
        class ADDON {
            serverDeleted = QUOTE(call COMPILE_FILE(XEH_deleted));
        };
    };
};
