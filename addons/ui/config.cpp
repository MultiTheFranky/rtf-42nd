#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main", "rtf42_music", "A3_Data_F_Enoch_Loadorder"};
        author = LSTRING(Author);
        authors[] = {LSTRING(Author)};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "RcsDisplayMain.hpp"
