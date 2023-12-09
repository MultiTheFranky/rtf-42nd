#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main"};
        author = "";
        authors[] = {LSTRING(Authors)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
