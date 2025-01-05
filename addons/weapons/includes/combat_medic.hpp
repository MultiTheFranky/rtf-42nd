class GVAR(combat_medic_primaryWeapon): rhs_weap_hk416d145 {
    class LinkedItems {
       class LinkedItemsAcc {
           item = "rhsusf_acc_nt4_black";
           slot = "PointerSlot";
       };
       class LinkedItemsOptic {
           item = "rhsusf_acc_su230";
           slot = "CowsSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(combat_medic_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_Stanag";
    };
    baseWeapon = QGVAR(combat_medic_primaryWeapon);
};
class GVAR(combat_medic_secondaryWeapon): rhsusf_weap_glock17g4 {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(combat_medic_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhsusf_mag_17Rnd_9x19_JHP";
    };
    baseWeapon = QGVAR(combat_medic_secondaryWeapon);
};
