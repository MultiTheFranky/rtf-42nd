class GVAR(lmg_primaryWeapon): rhs_weap_m249_pip_ris {
    class LinkedItems {
       class LinkedItemsAcc {
           item = "rhsusf_acc_SFMB556";
           slot = "PointerSlot";
       };
       class LinkedItemsOptic {
           item = "rhsusf_acc_su230";
           slot = "CowsSlot";
       };
       class LinkedItemsUnder {
           item = "rhsusf_acc_grip4_bipod";
           slot = "UnderBarrelSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(lmg_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhsusf_200rnd_556x45_M855_mixed_box";
    };
    baseWeapon = QGVAR(lmg_primaryWeapon);
};
class GVAR(lmg_secondaryWeapon): crow_x26_blk_yellow {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(lmg_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "X26_Cartridge";
    };
    baseWeapon = QGVAR(lmg_secondaryWeapon);
};
