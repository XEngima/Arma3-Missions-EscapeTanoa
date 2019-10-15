call compile preprocessFileLineNumbers "Engima\PatrolledAreas\HeadlessClient.sqf";

private _headlessClientPresent =  !(isNil Engima_PatrolledAreas_HeadlessClientName);
private _runOnThisMachine = false;

if (_headlessClientPresent && isMultiplayer) then {
    if (!isServer && !hasInterface) then {
        _runOnThisMachine = true;
    };
}
else {
    if (isServer) then {
        _runOnThisMachine = true;
    };
};

if (_runOnThisMachine) then {
	call compile preprocessFileLineNumbers "Engima\CommonLib\CommonLib.sqf";
	call compile preprocessFileLineNumbers "Engima\PatrolledAreas\Server\Functions.sqf";
	call compile preprocessFileLineNumbers "Engima\PatrolledAreas\ConfigAndStart.sqf";
};
