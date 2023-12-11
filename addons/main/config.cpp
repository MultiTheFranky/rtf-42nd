#include "script_component.hpp"

class CfgPatches
{
    class ADDON
    {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = LSTRING(Author);
        authors[] = {LSTRING(Author)};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgSettings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgModuleCategories.hpp"
#include "CfgEditorSubcategories.hpp"