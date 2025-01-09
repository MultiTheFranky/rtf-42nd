class CfgWeapons {
    class rhs_weap_hk416d145;
    class crow_x26_blk_yellow;
    class rhs_weap_M136_hedp;
    class rhsusf_weap_glock17g4;
    class vtf_MK13;
    class rhs_weap_m16a4;
    class CUP_hgun_Makarov;
    class CUP_LRTV;
    class rhs_weap_m249_pip_ris;
    class ACE_Vector;
    class rhs_weap_m4a1_carryhandle;
    class rhs_weap_m4;

    class GVAR(hk416): rhs_weap_hk416d145 {
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
            weapon = QGVAR(hk416);
        };
        class TransportMagazines {
            count = 1;
            magazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG";
        };
        baseWeapon = QGVAR(hk416);
    };

    class GVAR(x26): crow_x26_blk_yellow {
        class LinkedItems {
        };
        class TransportWeapons {
            count = 1;
            weapon = QGVAR(x26);
        };
        class TransportMagazines {
            count = 1;
            magazine = "X26_Cartridge";
        };
        baseWeapon = QGVAR(x26);
    };
    
    class GVAR(glock): rhsusf_weap_glock17g4 {
        class LinkedItems {
        };
        class TransportWeapons {
            count = 1;
            weapon = QGVAR(glock);
        };
        class TransportMagazines {
            count = 1;
            magazine = "rhsusf_mag_17Rnd_9x19_JHP";
        };
        baseWeapon = QGVAR(glock);
    };

    class GVAR(vector): ACE_Vector {
        class LinkedItems {
        };
        class TransportWeapons {
            count = 1;
            weapon = QGVAR(vector);
        };
        baseWeapon = QGVAR(vector);
    };

    #include "includes\at_specialist.hpp"
    #include "includes\grenadier.hpp"
    #include "includes\interpreter.hpp"
    #include "includes\lmg.hpp"
    #include "includes\rifleman.hpp"
    #include "includes\sl.hpp"
};
