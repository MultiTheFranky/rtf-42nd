class GVAR(officer_primaryWeapon): rhs_weap_hk416d145 {
    class LinkedItems {
       class LinkedItemsAcc {
           item = "rhsusf_acc_nt4_tan";
           slot = "PointerSlot";
       };
       class LinkedItemsOptic {
           item = "rhsusf_acc_su230a";
           slot = "CowsSlot";
       };
       class LinkedItemsUnder {
           item = "rhsusf_acc_grip2";
           slot = "UnderBarrelSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(officer_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(officer_primaryWeapon);
};
class GVAR(officer_secondaryWeapon): rhsusf_weap_glock17g4 {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(officer_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhsusf_mag_17Rnd_9x19_JHP";
    };
    baseWeapon = QGVAR(officer_secondaryWeapon);
};
class GVAR(officer_binoculars): ACE_Vector {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(officer_binoculars);
    };
    baseWeapon = QGVAR(officer_binoculars);
};
