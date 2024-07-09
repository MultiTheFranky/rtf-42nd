#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {QGVAR(GASMagazine)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main","Facewear_F_JCA_M50"};
        author = ECSTRING(main,Author);
        authors[] = {ECSTRING(main,Author)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgGlasses.hpp"
#include "CfgAmmo.hpp"
#include "CfgSFX.hpp"
#include "CfgVehicles.hpp"

