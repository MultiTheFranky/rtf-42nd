#include "..\script_component.hpp"
/*
    * Author: Franky
    * Function to add an action to the vehicle to add more seats to the vehicle
    *
    * Arguments:
    * 0: <OBJECT> vehicle
    * 1: <HASHMAP> vehicle seats
    *  1.1: <STRING> name of the seat
    *  1.2: <ARRAY> position of the seat and direction
    *
    * Return Value:
    * None
    *
    * Example:
    * [_vehicle, _seats] call rtf42_vehicles_fnc_onInit;
    *
    * Public: No
*/

params ["_vehicle", "_seats"];

private _displayName = getText (configFile >> "CfgVehicles" >> (typeOf (_vehicle select 0)) >> "displayName");
// Add action to vehicle per seat
{
    (_vehicle select 0) addAction [
        format ["Get in %1 as %2", _displayName, _x],
        {
            params ["_target", "_caller", "_actionId", "_args"];
            private _seatPos = _args select 0;
            private _seatDir = _args select 1;
            _caller attachTo [_target, _seatPos];
            _caller setDir ((getDir _target) + _seatDir);
            _caller switchMove format ["passenger_flatground_%1_Idle", [1, 4] call BIS_fnc_randomInt];
            systemChat "Press F1 to exit the vehicle.";
            _target setVariable ["rtf42_vehicles_init_seats_in_use", (_target getVariable ["rtf42_vehicles_init_seats_in_use", []]) + [_seatPos], true];
            GVAR(init_vehicle) = _target;
            GVAR(init_vehiclePos) = _seatPos;
            GVAR(init_vehicleEH) = (findDisplay 46) displayAddEventHandler ["KeyDown", {
                params ["", "_key"];
                switch (_key) do {
                    case 59: {
                        detach player;
                        player setPosATL ((getPosATL GVAR(init_vehicle)) vectorAdd [2, 0, 0]);
                        player switchMove "";
                        (findDisplay 46) displayRemoveEventHandler ["KeyDown",GVAR(init_vehicleEH)];
                        GVAR(init_vehicle) setVariable ["rtf42_vehicles_init_seats_in_use", (GVAR(init_vehicle) getVariable ["rtf42_vehicles_init_seats_in_use", []]) - [GVAR(init_vehiclePos)], true];
                        GVAR(init_vehicle) = nil;
                        GVAR(init_vehicleEH) = nil;
                        if (true) exitWith {true};
                    };
                };
                false
            }];
        },
        _y,
        2,
        false,
        true,
        "",
        "(_target getVariable ['rtf42_vehicles_init_seats_in_use', []]) findIf {(_x select 0) isEqualTo _seatPos} isEqualTo -1",
        5
    ];
} forEach (createHashMapFromArray _seats);
