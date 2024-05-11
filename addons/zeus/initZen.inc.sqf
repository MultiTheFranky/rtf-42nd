private _category = format ["RTF42 %1", LLSTRING(DisplayName)];

[_category, LSTRING(SetInformantDisplayName), {_this call FUNC(setInformant)}, QPATHTOF(ui\Icon_Module_Interrogation_ca.paa)] call zen_custom_modules_fnc_register;
[_category, LSTRING(SetTranslatorDisplayName), {_this call FUNC(setTranslator)}, QPATHTOF(ui\Icon_Module_Interrogation_ca.paa)] call zen_custom_modules_fnc_register;
[_category, LSTRING(SetInformantWithAnswersDisplayName), {_this call FUNC(setInformantWithAnswers)}, QPATHTOF(ui\Icon_Module_Interrogation_ca.paa)] call zen_custom_modules_fnc_register;
[_category, ELSTRING(music,Sound3DDisplayName), {_this call FUNC(generatePlayMusic3D)}, "a3\modules_f_curator\data\iconsound_ca.paa"] call zen_custom_modules_fnc_register;
[_category, LSTRING(GasZeusDisplayName), {_this call FUNC(setGas)}, ""] call zen_custom_modules_fnc_register;
// Generate Cards modules
call FUNC(generateCardModules);
