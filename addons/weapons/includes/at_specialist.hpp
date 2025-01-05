class GVAR(at_specialist_primaryWeapon): rhs_weap_hk416d145 {
    class LinkedItems {
       class LinkedItemsAcc {
           item = "rhsusf_acc_nt4_black";
           slot = "PointerSlot";
       };
       class LinkedItemsMuzzle {
           item = "rhsusf_acc_wmx_bk";
           slot = "MuzzleSlot";
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
        weapon = QGVAR(at_specialist_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(at_specialist_primaryWeapon);
};
class GVAR(at_specialist_secondaryWeapon): crow_x26_blk_yellow {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(at_specialist_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "X26_Cartridge";
    };
    baseWeapon = QGVAR(at_specialist_secondaryWeapon);
};
class GVAR(at_specialist_launcher): rhs_weap_M136_hedp {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(at_specialist_launcher);
    };
    baseWeapon = QGVAR(at_specialist_launcher);
};
