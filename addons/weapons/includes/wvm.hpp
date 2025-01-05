class GVAR(wvm_primaryWeapon): rhs_weap_hk416d145 {
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
        weapon = QGVAR(wvm_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(wvm_primaryWeapon);
};
class GVAR(wvm_secondaryWeapon): crow_x26_blk_yellow {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(wvm_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "X26_Cartridge";
    };
    baseWeapon = QGVAR(wvm_secondaryWeapon);
};
