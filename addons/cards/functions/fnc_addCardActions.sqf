#include "..\script_component.hpp"
/*
 * Author: Franky
 * Returns children actions for the actions cards.
 *
 * Arguments:
 * 0: Target <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [_target] call rft42_cards_fnc_addCardActions
 *
 * Public: No
 */

params ["_target"];

private _images = createHashMapFromArray [
    [LLSTRING(Hearts10), QPATHTOF(ui\hearts1.jpg)],
    [LLSTRING(HeartsAS), QPATHTOF(ui\hearts2.jpg)],
    [LLSTRING(HeartsJ), QPATHTOF(ui\hearts3.jpg)],
    [LLSTRING(HeartsK), QPATHTOF(ui\hearts4.jpg)],
    [LLSTRING(HeartsQ), QPATHTOF(ui\hearts5.jpg)],
    [LLSTRING(Spades10), QPATHTOF(ui\spades1.jpg)],
    [LLSTRING(SpadesAS), QPATHTOF(ui\spades2.jpg)],
    [LLSTRING(SpadesJ), QPATHTOF(ui\spades3.jpg)],
    [LLSTRING(SpadesK), QPATHTOF(ui\spades4.jpg)],
    [LLSTRING(SpadesQ), QPATHTOF(ui\spades5.jpg)]
];

private _actions = [];

{
    private _action = [_x, _x, _y, FUNC(seeCard), {true}, {}, [_x, _y]] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _target];
} forEach _images;


_actions;
