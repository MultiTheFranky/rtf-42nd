#define COMPONENT monitoring
#define COMPONENT_BEAUTIFIED Monitoring
#include "\z\rtf42\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define CBA_DEBUG_SYNCHRONOUS
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MONITORING
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MONITORING
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MONITORING
#endif

#include "\z\rtf42\addons\main\script_macros.hpp"
