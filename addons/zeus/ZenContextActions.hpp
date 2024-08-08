class zen_context_menu_actions {
    class ADDON {
        displayName = CSTRING(ContextRadioZeusDisplayName);
        condition = QUOTE((_objects select 0) isKindOf QQEGVAR(objects,Speaker) && {alive (_objects select 0)});
        priority = 5;
        class TurnOnRadio {
            displayName = CSTRING(ContextRadioZeusTurnOnRadio);
            statement = QUOTE([(_objects select 0)] call EFUNC(objects,turnOnRadio));
            condition = QUOTE(!((_objects select 0) getVariable [ARR_2(QQEGVAR(music,radioOn),false)]));
        };
        class TurnOffRadio: TurnOnRadio {
            displayName = CSTRING(ContextRadioZeusTurnOffRadio);
            statement = QUOTE([(_objects select 0)] call EFUNC(objects,turnOffRadio));
            condition = QUOTE((_objects select 0) getVariable [ARR_2(QQEGVAR(music,radioOn),false)]);
        };
        class SetMusic: TurnOnRadio {
            displayName = CSTRING(ContextRadioZeusSetMusic);
            statement = QUOTE([(_objects select 0)] call FUNC(radioActions));
            condition = QUOTE((_objects select 0) getVariable [ARR_2(QQEGVAR(music,radioOn),false)]);
        };
    }; 
};