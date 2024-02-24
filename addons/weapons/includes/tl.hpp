class GVAR(tl_primaryWeapon): rhs_weap_m4a1_carryhandle {
    class LinkedItems {
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
        weapon = QGVAR(tl_primaryWeapon);
    };
    class TransportMagazines {
        count = 1;
        magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
    };
    baseWeapon = QGVAR(tl_primaryWeapon);
};
class GVAR(tl_binoculars): Binocular {
    class LinkedItems {
    };
    class TransportWeapons {
        count = 1;
        weapon = QGVAR(tl_binoculars);
    };
    baseWeapon = QGVAR(tl_binoculars);
};
