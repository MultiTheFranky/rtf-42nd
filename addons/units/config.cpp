#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(randomCivilian)};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main", "rtf42_uniforms", "rtf42_helmets", "rtf42_vests", "rtf42_interrogation", "CUP_Creatures_People_Civil_Takistan", "rtf42_weapons", "rtf42_backpacks"};
        author = ECSTRING(main,Author);
        authors[] = {ECSTRING(main,Author)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
