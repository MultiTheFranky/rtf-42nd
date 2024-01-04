class CfgWeapons {
    class V_PlateCarrier2_blk;
    class GVAR(Base): V_PlateCarrier2_blk {
        author = "Echo";
        _generalMacro = QGVAR(Base);
        displayName = CSTRING(BaseVestDisplayName);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\rtf42_base_vest_ca.paa)};
    };
    class InventoryItem_Base_F;
    class VestItem: InventoryItem_Base_F
    {
        type = 701;
    };
    class GVAR(SuicideVest): V_PlateCarrier2_blk {
        author = ECSTRING(main,Author);
        _generalMacro = QGVAR(SuicideVest);
        displayName = CSTRING(SuicideVestDisplayName);
        model = QPATHTOF(data\suicide_vest.p3d);
        class ItemInfo : VestItem {
            uniformModel = QPATHTOF(data\suicide_vest.p3d);
            containerClass = "Supply140";
            mass = 140;
            armor = 5*0;
            passThrough = 1;
            hitpointName = "HitBody";
        };
    };
};
