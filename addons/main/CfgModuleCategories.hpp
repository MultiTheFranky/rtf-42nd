class CfgFactionClasses {
    class NO_CATEGORY;
    class GVAR(Faction): NO_CATEGORY {
        displayName = CSTRING(FactionDisplayName);
        priority = 2;
        side = 7;
    };
};

class CfgVehicleClasses {
    class GVAR(Vehicles) {
        displayName = CSTRING(VehicleDisplayName);
    };
};
