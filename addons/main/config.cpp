#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(main,Author);
        authors[] = {ECSTRING(main,Author)};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "CfgSettings.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFactionsClasses.hpp"
#include "CfgEditorCategories.hpp"
#include "CfgEditorSubcategories.hpp"
