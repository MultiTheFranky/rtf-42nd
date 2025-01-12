class GVAR(interpreter_primaryWeapon): rhs_weap_m16a4 {
    class LinkedItems {
       class LinkedItemsOptic {
           item = "rhsusf_acc_su230";
           slot = "CowsSlot";
       };
       class LinkedItemsUnder {
           item = "rhsusf_acc_grip2";
           slot = "UnderBarrelSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(interpreter_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(interpreter_primaryWeapon);
};

class GVAR(interpreter_secondaryWeapon): CUP_hgun_Makarov {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(interpreter_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "CUP_8Rnd_9x18_Makarov_M";
    };
    baseWeapon = QGVAR(interpreter_secondaryWeapon);
};
class GVAR(interpreter_binoculars): CUP_LRTV {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(interpreter_binoculars);
    };
    class TransportMagazines {
        count = 1;
        magazine = "Laserbatteries";
    };
    baseWeapon = QGVAR(interpreter_binoculars);
};
