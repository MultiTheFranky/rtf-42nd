class GVAR(at_primaryWeapon): rhs_weap_m4a1_carryhandle {
    class LinkedItems {
       class LinkedItemsMuzzle {
           item = "rhsusf_acc_wmx_bk";
           slot = "MuzzleSlot";
       };
       class LinkedItemsOptic {
           item = "rhsusf_acc_eotech_xps3";
           slot = "CowsSlot";
       };
       class LinkedItemsUnder {
           item = "rhsusf_acc_grip2";
           slot = "UnderBarrelSlot";
       };
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(at_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(at_primaryWeapon);
};
class GVAR(at_launcher): rhs_weap_M136_hedp {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(at_launcher);
    };
    baseWeapon = QGVAR(at_launcher);
};
