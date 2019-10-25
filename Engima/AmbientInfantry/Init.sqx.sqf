call compile preprocessFileLineNumbers "Engima\AmbientInfantry\HeadlessClient.sqf";

private _headlessClientPresent = !(isNil Engima_AmbientInfantry_HeadlessClientName);
private _runOnThisMachine = false;

if (_headlessClientPresent && isMultiplayer) then {
    if (!isServer && !hasInterface) then {
        _runOnThisMachine = true; }; } else { 



    if (isServer) then {
        _runOnThisMachine = true; }; };



if (_runOnThisMachine) then {
    call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Classes\PlayerPosition.sqx.sqf";
    call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Classes\Helper.sqx.sqf";
    call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Classes\Configuration.sqx.sqf";
    call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Classes\AmbientInfantry.sqx.sqf";

    call compile preprocessFileLineNumbers "Engima\AmbientInfantry\ConfigAndStart.sqf"; };