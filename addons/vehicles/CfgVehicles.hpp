class CfgVehicles {
    class rhsusf_m1025_w;
    class rhsusf_m1025_w_m2: rhsusf_m1025_w {
        class Turrets;
    };
    class rhsusf_m1025_d_m2: rhsusf_m1025_w_m2 {
        class Turrets: Turrets {
            class M2_Turret;
            class CargoTurret_01;
            class CargoTurret_02;
            class CargoTurret_03;
        };
        class EventHandlers;
    };
    class GVAR(m1025): rhsusf_m1025_d_m2 {
        class EventHandlers: EventHandlers {
            class GVAR(m1025) {
                getIn = QUOTE(_this call FUNC(onGetIn));
            };
        };
    };
};
