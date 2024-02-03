private _category = format ["RTF42 %1", LLSTRING(DisplayName)];

[QGVAR(enabled), "CHECKBOX", [LSTRING(EnabledDisplayName), LSTRING(EnabledDescription)], _category, false, 1] call CBA_fnc_addSetting;

GVAR(amountOfAnswers) = 5;

for "_i" from 1 to GVAR(amountOfAnswers) do {
    private _answer = QGVAR(answer) + str _i;
    [_answer, "EDITBOX", [LSTRING(AnswerDisplayName), LSTRING(AnswerDescription)], _category, "answer", 1] call CBA_fnc_addSetting;
    private _successChance = QGVAR(successChance) + str _i;
    [_successChance, "SLIDER", [LSTRING(SuccessChanceDisplayName), LSTRING(SuccessChanceDescription)], _category, [0,1,0.5,0,true], 1] call CBA_fnc_addSetting;
};

[QGVAR(improveChance), "CHECKBOX", [LSTRING(ImproveChanceDisplayName), LSTRING(ImproveChanceDescription)], _category, false, 1] call CBA_fnc_addSetting;

[QGVAR(amountOfImprove), "SLIDER", [LSTRING(AmountOfImproveDisplayName), LSTRING(AmountOfImproveDescription)], _category, [0,1,0.5,0,true], 1] call CBA_fnc_addSetting;

[QGVAR(cooldownMin), "TIME", [LSTRING(CooldownMinDisplayName), LSTRING(CooldownMinDescription)], _category, [0,3600,300], 1] call CBA_fnc_addSetting;
[QGVAR(cooldownMax), "TIME", [LSTRING(CooldownMaxDisplayName), LSTRING(CooldownMaxDescription)], _category, [GVAR(cooldownMin),3600,GVAR(cooldownMin) + 600], 1] call CBA_fnc_addSetting;