private ["_generatorTrailer", "_unit"];
private ["_marker", "_extractionPointNo", "_count", "_text"];

_generatorTrailer = _this select 0;
_unit = _this select 1;

_count = drn_var_Escape_timeToHijack;
if (typeOf _unit == drn_var_Escape_EngineerType) then {
	_count = 5;
};

while { _count > 0 && _unit distance _generatorTrailer < 3 } do
{
	_text = "HIJACKING " + str _count;

	cutText [_text, "Plain", 1];
	sleep 1;

	_count = _count - 1;
};

if (_count > 0 && _unit distance _generatorTrailer > 3) exitWith {
    cutText ["You must get closer!", "Plain", 1];
};

cutText ["", "Plain", 1];

if (_count == 0) then {
    if (isNil "drn_var_EscapeCommunicationCenterHijacked") then {
        
        _extractionPointNo = (floor random 8) + 1;
        
        drn_var_Escape_ExtractionMarkerPos = getMarkerPos ("drn_Escape_ExtractionPos" + str _extractionPointNo);
        publicVariable "drn_var_Escape_ExtractionMarkerPos";
        
        _marker = createMarker ["drn_visibleGoalMarker", drn_var_Escape_ExtractionMarkerPos];
        _marker setMarkerType "hd_pickup";
        _marker setMarkerColor "ColorBlufor";
        
        [_extractionPointNo] call drn_fnc_Escape_CreateExtractionPointServer;
        
        ["drn_hijackTasks", "SUCCEEDED"] call drn_SetTaskStateOnAllMachines;
        ["Task complete: Hijack Communication Center (Rendezvous point marked on map)"] call drn_fnc_CL_ShowTitleTextAllClients;
        
        drn_var_EscapeCommunicationCenterHijacked = true;
        publicVariable "drn_var_EscapeCommunicationCenterHijacked";
    };
};


