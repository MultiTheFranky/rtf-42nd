#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"rhsusf_m1043_d","rhsusf_m1025_d_m2","rhsusf_m998_d_2dr",QGVAR(m1152_rsv_usarmy_d),QGVAR(b_nm997_df_usa_des)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main", "rhsusf_vehicles","CUP_WheeledVehicles_NewM998","CUP_Vehicles_Core"};
        author = ECSTRING(main,Author);
        authors[] = {ECSTRING(main,Author)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
