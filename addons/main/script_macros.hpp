#include "\z\ace\addons\main\script_macros.hpp"

#define BASEITEMS "ItemMap","ItemCompass","ItemWatch","ItemRadio"
#define MPMISSION(var,name,dir) class var { \
    briefingName = name; \
    directory = dir; \
}; \
