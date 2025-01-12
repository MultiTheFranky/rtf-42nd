private _category = format ["RTF42 %1", LLSTRING(DisplayName)];

[QGVAR(enabled), "CHECKBOX", [LSTRING(EnabledDisplayName), LSTRING(EnabledDescription)], _category, false, 1] call CBA_fnc_addSetting;

[QGVAR(activationDistance), "SLIDER", [LSTRING(ActivationDistanceDisplayName), LSTRING(ActivationDistanceDescription)], _category, [0,5000,1000,0,false], 1] call CBA_fnc_addSetting;

[QGVAR(loopTime), "TIME", [LSTRING(LoopTimeDisplayName), LSTRING(LoopTimeDescription)], _category, [0,3600,60], 1] call CBA_fnc_addSetting;

[QGVAR(maxNumberOfActiveLocations), "SLIDER", [LSTRING(MaxNumberOfActiveLocationsDisplayName), LSTRING(MaxNumberOfActiveLocationsDescription)], _category, [0,10,5,0,false], 1] call CBA_fnc_addSetting;

[QGVAR(maxCiviliansPerLocation), "SLIDER", [LSTRING(MaxCiviliansPerLocationDisplayName), LSTRING(MaxCiviliansPerLocationDescription)], _category, [0,100,20,0,false], 1] call CBA_fnc_addSetting;

[QGVAR(minCiviliansPerLocation), "SLIDER", [LSTRING(MinCiviliansPerLocationDisplayName), LSTRING(MinCiviliansPerLocationDescription)], _category, [0,100,20,0,false], 1] call CBA_fnc_addSetting;

[QGVAR(useHouseAgents), "CHECKBOX", [LSTRING(UseHouseAgentsDisplayName), LSTRING(UseHouseAgentsDescription)], _category, true, 1] call CBA_fnc_addSetting;

[QGVAR(useStreetAgents), "CHECKBOX", [LSTRING(UseStreetAgentsDisplayName), LSTRING(UseStreetAgentsDescription)], _category, true, 1] call CBA_fnc_addSetting;

[QGVAR(useVehicleAgents), "CHECKBOX", [LSTRING(UseVehicleAgentsDisplayName), LSTRING(UseVehicleAgentsDescription)], _category, true, 1] call CBA_fnc_addSetting;

[QGVAR(civiliansClassnames), "EDITBOX", [LSTRING(CiviliansClassnamesDisplayName), LSTRING(CiviliansClassnamesDescription)], _category, 
    '["rtf42_units_randomCivilian"]'
, 1] call CBA_fnc_addSetting;

[QGVAR(civiliansVehiclesClassnames), "EDITBOX", [LSTRING(CiviliansVehiclesClassnamesDisplayName), LSTRING(CiviliansVehiclesClassnamesDescription)], _category, 
    '["C_CUPTAKCIVS_Datsun_Pickup_Covered_01","C_CUPTAKCIVS_Datsun_Pickup_Old_01","C_CUPTAKCIVS_Datsun_Pickup_Tubeframe_01","C_CUPTAKCIVS_Ikarus_01","C_CUPTAKCIVS_Land_Rover_01","C_CUPTAKCIVS_Skoda_Blue_01","C_CUPTAKCIVS_Skoda_Red_01","C_CUPTAKCIVS_Skoda_White_01","C_CUPTAKCIVS_Truck_Boxer_01","C_CUPTAKCIVS_UAZ_01","C_CUPTAKCIVS_Ural_Blue_01","C_CUPTAKCIVS_Ural_Worker_01","C_CUPTAKCIVS_Zamak_01"]'
, 1] call CBA_fnc_addSetting;

[QGVAR(locationTypes), "EDITBOX", [LSTRING(LocationTypesDisplayName), LSTRING(LocationTypesDescription)], _category, 
    '["Name","NameCity","NameCityCapital","NameLocal","NameVillage"]'
, 1] call CBA_fnc_addSetting;

[QGVAR(locationBlacklisted), "EDITBOX", [LSTRING(LocationBlacklistedDisplayName), LSTRING(LocationBlacklistedDescription)], _category, 
    '[]'
, 1] call CBA_fnc_addSetting;