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
           item = "rhsusf_acc_saw_bipod";
           slot = "UnderBarrelSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(lmg_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhsusf_200Rnd_556x45_mixed_soft_pouch_coyote";
    };
    baseWeapon = QGVAR(lmg_primaryWeapon);
};
