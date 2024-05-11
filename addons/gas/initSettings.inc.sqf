private _category = format ["RTF42 %1", LLSTRING(DisplayName)];
// GAS EFFECT RADIO
[QGVAR(gasEffectRadio), "SLIDER", [LSTRING(GasEffectRadioDisplayName), LSTRING(GasEffectRadioDescription)], _category, [10,100,50,0,false], 1] call CBA_fnc_addSetting;
// TIME EFFECT
[QGVAR(timeEffect), "TIME", [LSTRING(TimeEffectDisplayName), LSTRING(TimeEffectDescription)], _category, [10,300,60], 1] call CBA_fnc_addSetting;
// TIME TO UNCONSCIOUSNESS
[QGVAR(timeToUnconsciousness), "TIME", [LSTRING(TimeToUnconsciousnessDisplayName), LSTRING(TimeToUnconsciousnessDescription)], _category, [10,300,30], 1] call CBA_fnc_addSetting;
// TIME TO DEATH (after unconsciousness)
[QGVAR(timeToDeath), "TIME", [LSTRING(TimeToDeathDisplayName), LSTRING(TimeToDeathDescription)], _category, [10,300,60], 1] call CBA_fnc_addSetting;
// GAS MASK CLASSNAME
[QGVAR(gasMaskClassname), "EDITBOX", [LSTRING(GasMaskClassnameDisplayName), LSTRING(GasMaskClassnameDescription)], _category, "gasmask_classname", 1] call CBA_fnc_addSetting;
// GAS CURE CLASSNAME
[QGVAR(gasCureClassname), "EDITBOX", [LSTRING(GasCureClassnameDisplayName), LSTRING(GasCureClassnameDescription)], _category, "cure_classname", 1] call CBA_fnc_addSetting;
// GAS COLOR
[QGVAR(gasColor), "COLOR", [LSTRING(GasColorDisplayName), LSTRING(GasColorDescription)], _category, [0,1,0,1], 1] call CBA_fnc_addSetting;