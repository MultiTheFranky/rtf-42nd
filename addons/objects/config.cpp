#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(Cards),QGVAR(CeilingLamp)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main", "rtf42_items", "rtf42_cards"};
        author = ECSTRING(main,Author);
        authors[] = {ECSTRING(main,Author)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"

