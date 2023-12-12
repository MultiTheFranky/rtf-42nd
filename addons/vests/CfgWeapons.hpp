class CfgWeapons {
    class V_PlateCarrier2_blk;
    class GVAR(Base): V_PlateCarrier2_blk {
        author = "Echo";
        _generalMacro = QGVAR(Base);
        displayName = CSTRING(BaseVestDisplayName);
        hiddenSelections[] = {"camo"};
        hiddenSelectionsTextures[] = {QPATHTOF(data\rtf42_base_vest_ca.paa)};
    };
};