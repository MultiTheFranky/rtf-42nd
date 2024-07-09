// Define animation macro
#define RTF42ACTION(var) class GVAR(var) { \
    displayName = CSTRING(var); \
    condition = QUOTE([ARR_1(ace_player)] call FUNC(canPerformAnimation)); \
    statement = QUOTE([ARR_2(ace_player,QQGVAR(var))] call FUNC(performAnimation)); \
    showDisabled = 0; \
    exceptions[] = {}; \
    icon = ""; \
} \

#define RTF42FULLPOSE(var) class GVAR(var): GVAR(base) { \
    file = QPATHTOF(data\fullpose\rtf42_##var##.rtm); \
    speed = 1e-10; \
    ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.01}; \
    InterpolateTo[] = {}; \
} \

#define RTF42FULLPOSEPISTOL(var) class GVAR(var): GVAR(base_pistol) { \
    file = QPATHTOF(data\fullpose\rtf42_##var##.rtm); \
    speed = 1e-10; \
    ConnectTo[] = {"AmovPercMstpSnonWnonDnon",0.01}; \
    InterpolateTo[] = {}; \
} \
