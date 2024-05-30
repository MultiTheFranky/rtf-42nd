/*
	Name: FUNC(deleteHelmetCam)
	
	Author(s):
		Gundy

	Description:
		Delete helmet camera
	
	Parameters:
		NONE
	
	Returns:
		BOOLEAN - TRUE
	
	Example:
		call FUNC(deleteHelmetCam);

*/

private ["_cam"];

if (!isNil "cTabHcams") then {
	_cam = cTabHcams select 0;
	_cam cameraEffect ["TERMINATE","BACK"];
	camDestroy _cam;
	deleteVehicle (cTabHcams select 1);
	cTabHcams = nil;
};

true