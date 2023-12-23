#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main", "rtf42_uniforms", "rtf42_helmets", "rtf42_vests", "rtf42_interrogation"};
        author = ECSTRING(common,RTF42Team);
        authors[] = {ECSTRING(common,RTF42Team)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
