class CfgVehicles 
{     
    class B_Soldier_F; 
    class B_Helipilot_F;

    class GVAR(ReconBase): B_Soldier_F {
        scope = 0;
        scopeCurator = 0;
        author = LSTRING(Author);
        faction = "RTF42";
    };
        
    class GVAR(Desert): GVAR(ReconBase) {
        scope = 2;
        scopeCurator = 2;
        displayName = LSTRING(DesertSoldierDisplayName);
        uniformClass = QEGVAR(uniforms,Desert);
        hiddenSelectionsTextures[] = {QPATHTOF(data\desert.paa)};
    };

    class GVAR(Forest): GVAR(Desert) {
        displayName = LSTRING(ForestSoldierDisplayName);
        uniformClass = QEGVAR(uniforms,Forest);
        hiddenSelectionsTextures[] = {QPATHTOF(data\forest.paa)};
    };
};