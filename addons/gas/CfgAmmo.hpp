class CfgAmmo {
    class SmokeShell;
    class GVAR(GasAmmo): SmokeShell {
        model = "\A3\Weapons_f\ammo\smokegrenade_green_throw.p3d";
        effectsSmoke = "";
    };
    class M_Mo_82mm_AT_LG;
    class GVAR(Missile): M_Mo_82mm_AT_LG {
        hit = 0;
        indirectHit = 0;
        indirectHitRange = 0;
        typicalSpeed = 0;
    };
};