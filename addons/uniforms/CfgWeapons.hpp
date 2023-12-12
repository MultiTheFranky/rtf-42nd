class CfgWeapons
{
    class U_B_CTRG_1;
    class U_B_CTRG_Soldier_3_F;
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
        displayName = CSTRING(UniformMCDisplayName);
        class ItemInfo: GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,MC); 
        };
    };

    class GVAR(MCGreenBeret): GVAR(MC)
    { 
        displayName = CSTRING(UniformGreenBeretMCDisplayName);
        class ItemInfo: GVAR(UniformItemBase) {
            uniformClass = QEGVAR(units,MCGreenBeret); 
        }; 
    }; 
    
    class GVAR(AOR1): GVAR(MC)
    { 
        displayName = CSTRING(UniformAOR1DisplayName);
        class ItemInfo: GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,AOR1); 
        };
    };

    class GVAR(AOR1GreenBeret): GVAR(AOR1)
    { 
        displayName = CSTRING(UniformGreenBeretAOR1DisplayName);
        class ItemInfo: GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,AOR1GreenBeret); 
        };
    };

    // Long sleeve uniforms

    class GVAR(MCS): U_B_CTRG_Soldier_3_F
    { 
        author = "Echo";
        scope = 2;
        displayName = CSTRING(UniformMCSDisplayName);
        class ItemInfo: GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,MCS); 
        };
    };

    class GVAR(MCSGreenBeret): GVAR(MCS)
    { 
        displayName = CSTRING(UniformGreenBeretMCDisplayName);
        class ItemInfo: GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,MCSGreenBeret); 
        };
    };

    class GVAR(AOR1S): GVAR(MCS)
    { 
        displayName = CSTRING(UniformAOR1SDisplayName);
        class ItemInfo: GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,AOR1S); 
        };
    };

    class GVAR(AOR1SGreenBeret): GVAR(AOR1S)
    { 
        displayName = CSTRING(UniformGreenBeretAOR1SDisplayName);
        class ItemInfo: GVAR(UniformItemBase) { 
            uniformClass = QEGVAR(units,AOR1SGreenBeret); 
        };
    };
};