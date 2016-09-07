/*
 * Author: ACRE2Team
 * SHORT DESCRIPTION
 *
 * Arguments:
 * 0: ARGUMENT ONE <TYPE>
 * 1: ARGUMENT TWO <TYPE>
 *
 * Return Value:
 * RETURN VALUE <TYPE>
 *
 * Example:
 * [ARGUMENTS] call acre_COMPONENT_fnc_FUNCTIONNAME
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_currentState", "_buttonFunction"];
params["_button"];

[(_this select 0)] call FUNC(toggleButtonPressDown);

_currentState = ["getState", "currentState"] call GUI_DATA_EVENT;
_buttonFunction = QUOTE(ADDON) + "_fnc_" + _currentState + "_" + _button;
//acre_player sideChat format["BUTTON: %1", _buttonFunction];
//diag_log text format["EDIT: %1", GET_STATE(editEntry)];
if(!GET_STATE(editEntry)) then {
    //diag_log text format["trying: %1", _buttonFunction];
    _this call (missionNamespace getVariable [_buttonFunction, FUNC(defaultButtonHandler)]);
} else {
    //diag_log text format["doing: %1", _buttonFunction];
    _this call FUNC(defaultButtonHandler);
};