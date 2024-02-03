class CfgVehicles {
    class rhsusf_m1043_w;
    class rhsusf_m1043_d: rhsusf_m1043_w {
        editorPreview = "rhsusf\addons\rhsusf_editorPreviews\data\rhsusf_m1043_d.paa";
        faction = "rhs_faction_usarmy_d";
        vehicleClass = "rhs_vehclass_car";
        crew = "rhsusf_army_ocp_rifleman";
        author = "$STR_RHSUSF_AUTHOR_FULL";
        HiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_hmmwv\textures\m998_exterior_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_interior_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\A2_parts_D_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\wheel_wranglermt_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_mainbody_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\gratting_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\tile_exmetal_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m1043_d_co.paa"};
        #include "./inventoryPresets/Base.hpp"
    };
    class rhsusf_m1025_w_m2;
    class rhsusf_m1025_d_m2: rhsusf_m1025_w_m2 {
        editorPreview = "rhsusf\addons\rhsusf_editorPreviews\data\rhsusf_m1025_d_m2.paa";
        faction = "rhs_faction_usarmy_d";
        vehicleClass = "rhs_vehclass_car";
        crew = "rhsusf_army_ocp_rifleman";
        author = "$STR_RHSUSF_AUTHOR_FULL";
        HiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_hmmwv\textures\m998_exterior_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_interior_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\A2_parts_D_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\wheel_wranglermt_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_mainbody_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\gratting_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\tile_exmetal_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m1025_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\mk64mount_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\unitdecals\101stab_502reg_2ndbn_a12_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\unitdecals\a12^_co.paa"};
        #include "./inventoryPresets/Base.hpp"
    };
    class rhsusf_m998_w_2dr;
    class rhsusf_m998_d_2dr: rhsusf_m998_w_2dr {
        editorPreview = "rhsusf\addons\rhsusf_editorPreviews\data\rhsusf_m998_d_2dr.paa";
        faction = "rhs_faction_usarmy_d";
        vehicleClass = "rhs_vehclass_car";
        crew = "rhsusf_army_ocp_rifleman";
        author = "$STR_RHSUSF_AUTHOR_FULL";
        hiddenSelectionsTextures[] = {"rhsusf\addons\rhsusf_hmmwv\textures\m998_exterior_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_interior_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\A2_parts_D_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\wheel_wranglermt_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_mainbody_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\gratting_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_interior_wood_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\m998_2drcargo_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\textures\tile_exmetal_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\unitdecals\101stab_502reg_2ndbn_a12_d_co.paa", "rhsusf\addons\rhsusf_hmmwv\unitdecals\a12^_co.paa"};
        #include "./inventoryPresets/Base.hpp"
    };

    class rhsusf_m1152_rsv_usarmy_d;
    class GVAR(m1152_rsv_usarmy_d): rhsusf_m1152_rsv_usarmy_d {
        #include "./inventoryPresets/SupplyTruck.hpp"
    };
    class CUP_nM997_amb_DF_Base;
    class CUP_B_nM997_DF_USA_DES: CUP_nM997_amb_DF_Base {
        editorPreview = "CUP\WheeledVehicles\CUP_WheeledVehicles_NewM998\Data\preview\CUP_B_nM997_DF_USA_DES.jpg";
        scope = 2;
        scopeCurator = 2;
        side = 1;
        accuracy = 0.3;
        author = "$STR_CUP_AUTHOR_STRING";
        faction = "CUP_B_US_Army";
        crew = "CUP_B_US_Soldier_OEFCP";
        typicalCargo[] = {};
        textureList[] = {"USDesert", 1};
        animationList[] = {"hide_jerrycans", 0.8, "hide_spare_wheel", 0.5, "front_grille_move", 0, "hide_brushguard", 1, "hide_new_front_bumper", 0, "hide_new_rear_bumper", 0, "hide_old_front_bumper", 1, "hide_old_rear_bumper", 1, "hide_front_right_antenna", 0.2, "hide_rear_right_antenna", 0.5};
        maximumLoad = 5000;
        hiddenSelectionsTextures[] = {"CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\body_co.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewM998\Data\rear_997_amb_co.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\snorkel_mesh_ca.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\chassis_co.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\attachments_co.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\interior_co.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\interior_detail_co.paa","CUP\WheeledVehicles\CUP_WheeledVehicles_NewM998\Data\int_997_amb_co.paa","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,1)","CUP\WheeledVehicles\CUP_WheeledVehicles_NewHMMWV\Data\chassis_co.paa","#(argb,8,8,3)color(0,0,0,0)","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)","#(argb,8,8,3)color(0,0,0,1)"};
        #include "./inventoryPresets/AmbulanceSupply.hpp"
    };
};
