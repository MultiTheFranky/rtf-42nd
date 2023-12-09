private _category = format ["RTF42 %1", localize LSTRING(DisplayName)];

[QGVAR(enabled), "CHECKBOX", [LSTRING(EnabledDisplayName), LSTRING(EnabledDescription)], _category, false, 1] call CBA_fnc_addSetting;

[QGVAR(endpoint), "EDITBOX", [LSTRING(EndpointDisplayName), LSTRING(EndpointDescription)], _category, "http//:localhost:8086", 1] call CBA_fnc_addSetting;

[QGVAR(token), "EDITBOX", [LSTRING(TokenDisplayName), LSTRING(TokenDescription)], _category, "<token>", 1] call CBA_fnc_addSetting;

[QGVAR(organization), "EDITBOX", [LSTRING(OrganizationDisplayName), LSTRING(OrganizationDescription)], _category, "arma3", 1] call CBA_fnc_addSetting;

[QGVAR(bucket), "EDITBOX", [LSTRING(BucketDisplayName), LSTRING(BucketDescription)], _category, "metrics", 1] call CBA_fnc_addSetting;