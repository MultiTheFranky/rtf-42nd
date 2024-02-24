class GVAR(SuicideVest): V_PlateCarrier2_blk {
    author = ECSTRING(main,Author);
    _generalMacro = QGVAR(SuicideVest);
    displayName = CSTRING(SuicideVestDisplayName);
    model = QPATHTOF(data\suicide_vest.p3d);
    class ItemInfo: VestItem {
        uniformModel = QPATHTOF(data\suicide_vest.p3d);
        containerClass = "Supply140";
        mass = 140;
        armor = 5*0;
        passThrough = 1;
        hitpointName = "HitBody";
    };
};
class GVAR(MiniSuicideVest): V_PlateCarrier2_blk {
    author = ECSTRING(main,Author);
    _generalMacro = QGVAR(MiniSuicideVest);
    displayName = CSTRING(MiniSuicideVestDisplayName);
    model = QPATHTOF(data\mini_suicide_vest.p3d);
    class ItemInfo: VestItem {
        uniformModel = QPATHTOF(data\mini_suicide_vest.p3d);
        containerClass = "Supply140";
        mass = 140;
        armor = 5*0;
        passThrough = 1;
        hitpointName = "HitBody";
    };
};
