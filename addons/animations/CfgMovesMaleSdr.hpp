class CfgMovesMaleSdr {
    class States {
        class Acts_AidlPercMstpSloWWpstDnon_warmup_1_loop;
        class AmovPercMstpSnonWnonDnon;
        class GVAR(base): AmovPercMstpSnonWnonDnon {
            enableDirectControl = 1;
            showWeaponAim = 0;
            relSpeedMin = 1;
            relSpeedMax = 1;
            disableWeaponsLong = 1;
            disableWeapons = 1;
            enableOptics = 0;
            head = "headNo";
            enableBinocular = 0;
            headBobMode = 5;
            headBobStrength = -1;
            forceAim = 1;
            ConnectTo[] = {};
            InterpolateTo[] = {};
            actions = "NoActions";
        };
        class GVAR(base_pistol): Acts_AidlPercMstpSloWWpstDnon_warmup_1_loop {};
        RTF42FULLPOSE(fullpose_standby);
        RTF42FULLPOSE(fullpose_holdvest);
        RTF42FULLPOSE(fullpose_cradle);
    };
};
