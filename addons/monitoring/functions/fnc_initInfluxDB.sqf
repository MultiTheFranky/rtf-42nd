#include "..\script_component.hpp"
/*
	 * Author: Franky
	 * Start InfluxDB client
	 *
	 * Arguments:
	 * None
	 *
	 * Return Value:
	 * None
	 *
	 * Example:
	 * [] call rtf42_monitoring_fnc_initInfluxDB
	 *
	 * Public: No
*/

if (!isServer) exitWith {};

diag_log str("influxdb" callExtension ["start", [GVAR(endpoint), GVAR(token), GVAR(organization), GVAR(bucket)]]);