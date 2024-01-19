class RscEdit;
class RscDisplayPassword: RscStandardDisplay {
    class controls {
        class ValuePassword: RscEdit {
            colorText[] = {0,0,0,0};
            colorSelection[] = {0,0,0,0};
            onLoad = "rtf42_fnc_hidePassword_EH = addMissionEventHandler ['Draw3D',{ if (isNull (findDisplay 64)) exitWith {removeMissionEventHandler ['Draw3D',_thisEventHandler]} ; private _disp = findDisplay 64 ; private _return = '' ; private _ctrl = (_disp displayCtrl 101) ; private _dummy = (_disp displayCtrl 10001) ; for '_i' from 1 to count ctrlText _ctrl do { _return = _return + '*' } ; _dummy ctrlSetText _return ; }]";
        };
        class ValuePassword_dummy: ValuePassword {
            idc = 10001;
            colorText[] = {0.95,0.95,0.95,1};
            colorDisabled[] = {0.95,0.95,0.95,1};
            onLoad = "_this select 0 ctrlEnable false";
            onKeyDown = "";
        };
    };
};
