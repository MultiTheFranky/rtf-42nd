// Define animation macro
#define RTF42ACTION(var) class var { \
    displayName = CSTRING(var); \
    condition = QUOTE([ARR_1(ace_player)] call FUNC(canPerformAnimation)); \
    statement = QUOTE([ARR_2(ace_player,'var')] call FUNC(performAnimation)); \
    showDisabled = 0; \
    exceptions[] = {}; \
    icon = ""; \
}; \
