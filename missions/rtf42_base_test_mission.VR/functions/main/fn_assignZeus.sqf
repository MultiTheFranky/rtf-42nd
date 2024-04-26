private _uid = getPlayerUID _this;
if (!(_uid in rtf42_editors)) exitWith {};
private _alreadyExists = _uid in rtf42_zeusArray;
if (!_alreadyExists) then {
	"[RTF42] Creating Zeus..." remoteExec ["systemChat", _this];
	// New zeus module
	private _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];// Logic Server
	_curator setVariable ["showNotification", false];

	unassignCurator _curator;
	private _cfg = (configFile >> "CfgPatches");
	private _newAddons = [];
	for "_i" from 0 to((count _cfg) - 1) do {
		private _name = configName(_cfg select _i);
		_newAddons pushBack _name;
	};
	if (count _newAddons > 0) then {
		_curator addCuratorAddons _newAddons
	};

	_curator setcuratorcoef["place", 0];
	_curator setcuratorcoef["delete", 0];
	[_curator] spawn {
		params ["_curator"];
		while { !isNull _curator } do {
			_curator addCuratorEditableObjects[(allMissionObjects "All"), true];
			sleep 60;
		};
	};
	rtf42_zeusArray set [_uid, _curator];
	_curator remoteExec ["unassignCurator", 0];
	unassignCurator _curator;
	sleep 0.4;
	_this assignCurator _curator;
	"[RTF42] Created Zeus..." remoteExec ["systemChat", _this];
	true;
} else {
	// Existing zeus module
	"[RTF42] Deleting Zeus..." remoteExec ["systemChat", _this];
	_curator = rtf42_zeusArray get _uid;
	deleteVehicle _curator;
	rtf42_zeusArray deleteAt _uid;
	"[RTF42] Zeus Deleted..." remoteExec ["systemChat", _this];
	_this call rtf42_fnc_assignZeus;
};