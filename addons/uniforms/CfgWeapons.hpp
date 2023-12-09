class CfgWeapons
{
    class ItemCore; 
    class UniformItem;
    class Uniform_Base: ItemCore 
    { 
        class ItemInfo; 
    };

    class GVAR(UniformItemBase): UniformItem
    {
        containerClass = "Supply50";
        mass = 50;
    };
    
    class GVAR(Desert): Uniform_Base
    { 
        scope = 2; 
        displayName = "Uniforme Desértico"; // TODO: Localize
        picture = "\A3\Characters_F\data\ui\icon_U_B_CombatUniform_mcam_CA.paa"; 
        model = "\A3\characters_f\BLUFOR\b_soldier_01.p3d"; 
        class ItemInfo : GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,Desert); 
        }; 
    }; 
    
    class GVAR(Forest): GVAR(Desert)
    { 
        displayName = "Uniforme Boscoso"; // TODO: Localize
        class ItemInfo : GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,Forest); 
        }; 
    }; 
};