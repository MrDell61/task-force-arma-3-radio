private ["_request", "_result", "_listener"];
_request = _this call TFAR_fnc_preparePositionCoordinates;
_result = "task_force_radio_pipe" callExtension _request;

if ((_result != "OK") and {_result != "SPEAKING"} and {_result != "NOT_SPEAKING"}) then 
{
	[parseText (_result), 10] call TFAR_fnc_showHint;
	tf_lastError = true;
} else {
	if (tf_lastError) then {
		call TFAR_fnc_hideHint;
		tf_lastError = false;
	};
};
if (_result == "SPEAKING") then {
	_this setRandomLip true;
	_this setVariable ["tf_start_speaking", diag_tickTime];
} else {
	_this setRandomLip false;
};