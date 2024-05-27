player remoteExec ["rtf42_fnc_assignZeus", 2];
if ((getPlayerUID player) in rtf42_editors) then {
    [player] call rtf42_fnc_addActions;
};