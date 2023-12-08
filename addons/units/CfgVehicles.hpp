class CfgVehicles 
{     
    class B_Soldier_F; 
    class B_Helipilot_F;

    class GVAR(ReconBase): B_Soldier_F {
        scope = 0;
        scopeCurator = 0;
        author = "42nd RTF"; //TODO: Localize
        faction = "RTF42";
    };
        
    class GVAR(Desert): GVAR(ReconBase) {
        scope = 2;
        scopeCurator = 2;
        displayName = "Soldado (Desierto)"; //TODO: Localize
        uniformClass = QEGVAR(uniforms,Desert);
        hiddenSelectionsTextures[] = {QPATHTOF(data\desert.paa)};
    };

    class GVAR(Forest): GVAR(Desert) {
        displayName = "Soldado (Bosque)"; //TODO: Localize
        uniformClass = QEGVAR(uniforms,Forest);
        hiddenSelectionsTextures[] = {QPATHTOF(data\forest.paa)};
    };
};