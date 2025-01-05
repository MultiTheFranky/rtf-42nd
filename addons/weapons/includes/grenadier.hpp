class GVAR(grenadier_primaryWeapon): rhs_weap_hk416d145 {
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
        weapon = QGVAR(grenadier_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(grenadier_primaryWeapon);
};
class GVAR(grenadier_secondaryWeapon): vtf_MK13 {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(grenadier_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "1Rnd_HE_Grenade_shell";
    };
    baseWeapon = QGVAR(grenadier_secondaryWeapon);
};
