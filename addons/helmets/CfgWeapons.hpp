class CfgWeapons {
	class rhsusf_lwh_helmet_marpatwd_headset_blk2;

	class GVAR(AOR1): rhsusf_lwh_helmet_marpatwd_headset_blk2 {
		author = "Echo";
		displayName = CSTRING(HelmetAOR1DisplayName);
		hiddenSelectionsTextures[] = {
			QPATHTOF(data\rtf42_helmet_ranger_aor1_ca.paa)
		};
	};

	class GVAR(MC): GVAR(AOR1) {
		displayName = CSTRING(HelmetMCDisplayName);
		hiddenSelectionsTextures[] = {
			QPATHTOF(data\rtf42_helmet_ranger_mc_ca.paa)
		};
	};
};