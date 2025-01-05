class GVAR(eod_primaryWeapon): rhs_weap_hk416d145 {
    class LinkedItems {
       class LinkedItemsAcc {
           item = "rhsusf_acc_nt4_black";
           slot = "PointerSlot";
       };
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
        weapon = QGVAR(eod_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(eod_primaryWeapon);
};
class GVAR(eod_secondaryWeapon): rhsusf_weap_glock17g4 {
    class LinkedItems {
       class LinkedItemsMuzzle {
           item = "acc_flashlight_pistol";
           slot = "MuzzleSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(eod_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhsusf_mag_17Rnd_9x19_JHP";
    };
    baseWeapon = QGVAR(eod_secondaryWeapon);
};
