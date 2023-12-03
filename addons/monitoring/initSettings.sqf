private _category = format ["RTF42 %1", localize LSTRING(DisplayName)];

[QGVAR(enabled), "CHECKBOX", [LSTRING(enabled_DisplayName), LSTRING(enabled_Description)], _category, false, 1] call CBA_fnc_addSetting;

[QGVAR(endpoint), "EDITBOX", [LSTRING(endpoint_DisplayName), LSTRING(endpoint_Description)], _category, "http//:localhost:8086", 1] call CBA_fnc_addSetting;

[QGVAR(token), "EDITBOX", [LSTRING(token_DisplayName), LSTRING(token_Description)], _category, "<token>", 1] call CBA_fnc_addSetting;

[QGVAR(organization), "EDITBOX", [LSTRING(organization_DisplayName), LSTRING(organization_Description)], _category, "arma3", 1] call CBA_fnc_addSetting;

[QGVAR(bucket), "EDITBOX", [LSTRING(bucket_DisplayName), LSTRING(bucket_Description)], _category, "metrics", 1] call CBA_fnc_addSetting;