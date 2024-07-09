#include "\z\ace\addons\main\script_macros.hpp"

#define BASEITEMS "ItemMap","ItemCompass","ItemWatch","rhsusf_radio_anprc152"
#define MPMISSION(var,name,dir) class var { \
    briefingName = name; \
    directory = dir; \
}; \
