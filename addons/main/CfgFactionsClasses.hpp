class CfgFactionClasses {
    class NO_CATEGORY;
    class Default;
    class GVAR(Faction): NO_CATEGORY {
        displayName = CSTRING(FactionDisplayName);
        priority = 2;
        side = 7;
    };
    class GVAR(Faction_Props): Default {
        displayName = CSTRING(FactionPropsDisplayName);
        priority = 2;
    };
    class GVAR(Modules): NO_CATEGORY {
        displayName = CSTRING(ModulesDisplayName);
    };
};
