class CfgWeapons
{
    class U_B_CTRG_1;
    class UniformItem;
    class GVAR(UniformItemBase): UniformItem
    {
        containerClass = "Supply50";
        mass = 50;
    };
    
    class GVAR(MC): U_B_CTRG_1
    { 
        author = "Echo";
        scope = 2;
        displayName = CSTRING(UniformGreenBeretMCDisplayName);
        class ItemInfo : GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,MC); 
        };
    };

    class GVAR(MCGreenBeret): GVAR(MC)
    { 
        displayName = CSTRING(UniformGreenBeretMCDisplayName);
        class ItemInfo : GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,MCGreenBeret); 
        }; 
    }; 
    
    class GVAR(AOR1): GVAR(MC)
    { 
        displayName = CSTRING(UniformGreenBeretAOR1DisplayName);
        class ItemInfo : GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,AOR1); 
        };
    };

    class GVAR(AOR1GreenBeret): GVAR(AOR1)
    { 
        displayName = CSTRING(UniformGreenBeretAOR1DisplayName);
        class ItemInfo : GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,AOR1GreenBeret); 
        };
    };
};