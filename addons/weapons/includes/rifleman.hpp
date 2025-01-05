class GVAR(rifleman_primaryWeapon): rhs_weap_m4a1_carryhandle {
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
        weapon = QGVAR(rifleman_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(rifleman_primaryWeapon);
};
class GVAR(rifleman_secondaryWeapon): crow_x26_blk_yellow {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(rifleman_secondaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "X26_Cartridge";
    };
    baseWeapon = QGVAR(rifleman_secondaryWeapon);
};
