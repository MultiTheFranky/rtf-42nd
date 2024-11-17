#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"rtf42_main", "rtf42_music", "A3_Data_F_Enoch_Loadorder", "A3_Weapons_F", "A3_Data_F", "A3_Functions_F", "A3_UiFonts_F", "A3_Ui_F", "A3_3DEN","A3_Map_Altis", "CUP_Worlds_Intros", "ace_weather", "real_fix_terrains","CUP_Worlds_EnvSounds"};
        author = ECSTRING(main,Author);
        authors[] = {ECSTRING(main,Author)};
        VERSION_CONFIG;
    };
};

// Configs imports
class RscPicture;
class RscText;
class RscStandardDisplay;
class RscVignette;
class RscStructuredText;
class RscProgress;
class RscControlsGroup;
class RscPictureKeepAspect;
class RscActivePicture;

// Override base classes
#include "Backgrounds.hpp"
#include "Cards.hpp"
#include "CfgEventHandlers.hpp"
#include "RcsDisplayMain.hpp"
#include "RscDisplayPassword.hpp"
#include "RscDisplayLoading.hpp"
#include "RscDisplayLoadMission.hpp"
#include "RscDisplayNotFreeze.hpp"
#include "RcsTitles.hpp"
#include "RscDisplayStart.hpp"
#include "RscDisplayLoadCustom.hpp"
