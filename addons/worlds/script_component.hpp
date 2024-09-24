#define COMPONENT worlds
#define COMPONENT_BEAUTIFIED Worlds
#include "\z\rtf42\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE // https://ace3.acemod.org/wiki/development/setting-up-the-development-environment.html#71-disabling-cba-function-caching
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_WORLDS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_WORLDS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_WORLDS
#endif

#include "\z\rtf42\addons\main\script_macros.hpp"
