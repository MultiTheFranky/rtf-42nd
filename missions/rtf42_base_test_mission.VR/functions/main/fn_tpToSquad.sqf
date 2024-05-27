#include "..\..\cau\extendedchat\functions\_macros.inc"
#include "..\..\cau\extendedchat\functions\_defines.inc"

[] spawn {
    waitUntil {!isNil "cau_xchat_commands"};
    ["tp",{
        params ["_param"];
        // Check if player is alive
        if (!alive player) exitWith {
            player sideChat "You must be alive to use this command.";
        };

        if ((count _this) > 0) exitWith {
            private _messageMentionType = _param select [0,1];
            if (_messageMentionType != "p") exitWith {
                player sideChat "You must mention a player to teleport to.";
            };
            private _messageMentionID = _param select [2];
            private _messageMentionIDChars = _messageMentionID splitString "1234567890";
            private _playerName = "";
            if (count _messageMentionIDChars == 0) then {
                {
                    private _unitID = str(UNIT_OID(_x));
                    if (_unitID isEqualTo _messageMentionID) exitWith {
                        _playerName = (["StreamSafeName",[getPlayerUID _x,UNIT_NAME(_x)]] call FUNC(commonTask));
                    };
                } forEach allPlayers;
            };
            if (_playerName isEqualTo "") exitWith {
                player sideChat format ["Player with ID %1 not found.", _messageMentionID];
            };
            // Get the player to teleport to
            private _playerToTeleportTo = (allPlayers select {name _x == _playerName}) select 0;
            if (isNil "_playerToTeleportTo") exitWith {
                player sideChat format ["Player %1 not found.", _playerName];
            };
            player setPos (getPos _playerToTeleportTo);
            [format ["%1 has teleported to %2.", name player, name _playerToTeleportTo]] remoteExec ["hint", 0];
        };

        // Check if the player is in a group
        if ((count (units (group player))) == 1) exitWith {
            player sideChat "You are not in a group.";
        };

        // Check if the player is the leader of the group
        if (leader group player == player) exitWith {
            player sideChat "You are the leader of the group. I will try to teleport you to the second in command.";
            player setPos (getPos ((units player) select 0));
            [format ["%1 has teleported to %2 that is the second in command.", name player, name ((units player) select 0)]] remoteExec ["hint", 0];
        };
        // TP to leader of the group
        player setPos (getPos (leader player));
        [format ["%1 has teleported to %2 that is the leader of the group.", name player, name (leader player)]] remoteExec ["hint", 0];
    }] call CAU_xChat_fnc_addCommand;
};