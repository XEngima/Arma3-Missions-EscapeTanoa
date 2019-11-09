call compile preprocessFileLineNumbers "Engima\ReviveFix\Init.sqf";
call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Init.sqx.sqf"; // Added by Engima.AmbientInfantry
call compile preprocessFileLineNumbers "Sqx\Waypoints\Init.sqx.sqf"; // Added by Sqx.Waypoints
call compile preprocessFileLineNumbers "Sqx\Markers\Init.sqx.sqf"; // Added by Sqx.Markers
call compile preprocessFileLineNumbers "Engima\Civilians\Init.sqf"; // Added by Engima.Civilians
call compile preprocessFileLineNumbers "Engima\Traffic\Init.sqf"; // Added by Engima.Traffic
call compile preprocessFileLineNumbers "Engima\PatrolledAreas\Init.sqf"; // Added by Engima.PatrolledAreas
call compile preprocessFileLineNumbers "Scripts\DRN\CommonLib\CommonLib.sqf";
call compile preprocessFileLineNumbers "Engima\CommonLib\CommonLib.sqf"; // Added by Engima.CommonLib
private ["_volume", "_showIntro", "_showPlayerMapAndCompass", "_fog", "_playerIsImmortal", "_playersEnteredWorld"];

drn_var_playerSide = west;
drn_var_enemySide = east;

// Developer Variables

_showIntro = false;

// Debug Variables

_showPlayerMapAndCompass = true;
_playerIsImmortal = true; // Only works for unit p1

// Initialization

call compile preprocessFileLineNumbers "Scripts\Escape\Functions.sqf";

if (isServer) then {
    execVM "ServerInit.sqf";
    if (isDedicated) exitWith {};
};

waitUntil { !isNil "drn_missionParametrsInitialized" };

drn_var_Escape_firstPreloadDone = false;
drn_var_Escape_playerEnteredWorld = false;

["EH1", "onPreloadFinished", {
	if (!drn_var_Escape_firstPreloadDone) then {
		drn_var_Escape_firstPreloadDone = true;

		if (!isNull player) then {
            drn_var_Escape_playerEnteredWorld = true;
		};
	};
}] call BIS_fnc_addStackedEventHandler;

_volume = soundVolume;
enableSaving [false, false];

if (_showIntro) then {
	0 fadeSound 0;
	enableRadio false;
	0 cutText ["", "BLACK FADED"];
};

if (!isDedicated) then {
    waitUntil {!isNull player};
    player setCaptive true;
};

if (_playerIsImmortal && {!isNil "p1"}) then {
    p1 allowDamage false;
};

// Initialization
drn_arr_JipSpawnPos = [];
call drn_fnc_CL_InitParams;

if (!isNull player) then {
	[didJip] call compile preprocessFileLineNumbers "Briefing.sqf";
};

switch (drn_MissionParam_dynamicWeather) do {
    case 0: { execVM "Scripts\Escape\StaticWeatherEffects.sqf"; }; // Dynamic weather off
    case 1: { [0.01, 0.1, 0, [random 8, random 8]] execVM "Scripts\DRN\DynamicWeatherEffects\DynamicWeatherEffects.sqf"; }; // Dynamic weather (start clear)
    default {
         // Dynamic weather (start random)
        if (random 100 < 75) then {
            _fog = random 0.05;
        }
        else {
            _fog = random 0.1;
        };
        
        [_fog] execVM "Scripts\DRN\DynamicWeatherEffects\DynamicWeatherEffects.sqf";
    };
};

waitUntil {drn_var_Escape_playerEnteredWorld};

// Report to all other clients (and server) that player has entered the world
if (isNil "drn_var_Escape_syncronizationDone") then {
    switch (str player) do {
        case "p1": {
            drn_var_Escape_playerEnteredWorld_p1 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p1";
        };
        case "p2": {
            drn_var_Escape_playerEnteredWorld_p2 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p2";
        };
        case "p3": {
            drn_var_Escape_playerEnteredWorld_p3 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p3";
        };
        case "p4": {
            drn_var_Escape_playerEnteredWorld_p4 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p4";
        };
        case "p5": {
            drn_var_Escape_playerEnteredWorld_p5 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p5";
        };
        case "p6": {
            drn_var_Escape_playerEnteredWorld_p6 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p6";
        };
        case "p7": {
            drn_var_Escape_playerEnteredWorld_p7 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p7";
        };
        case "p8": {
            drn_var_Escape_playerEnteredWorld_p8 = true;
            publicVariable "drn_var_Escape_playerEnteredWorld_p8";
        };
        default {
            player sideChat "This should never happen!";
        };
    };
    
    _playersEnteredWorld = 1;
    while {(count call drn_fnc_Escape_GetPlayers != _playersEnteredWorld)} do {
        
        if (_showIntro) then {
            0 cutText ["", "BLACK FADED"];
        };
        
        sleep 0.5;
        
        _playersEnteredWorld = 0;
        if (!isNil "drn_var_Escape_playerEnteredWorld_p1") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p2") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p3") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p4") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p5") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p6") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p7") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
        if (!isNil "drn_var_Escape_playerEnteredWorld_p8") then {
            _playersEnteredWorld = _playersEnteredWorld + 1;
        };
    };
};

drn_var_Escape_syncronizationDone = true;
publicVariable "drn_var_Escape_syncronizationDone";

waitUntil {!isNil "drn_var_Escape_FunctionsInitializedOnServer"};
[] call drn_fnc_Escape_AskForTimeSynchronization;

// Player Initialization

removeAllWeapons player;
removeAllItems player;
player addWeapon "ItemRadio";
player addWeapon "ItemWatch";
player addWeapon "ItemMap";

drn_fnc_Escape_DisableLeaderSetWaypoints = {
    if (!visibleMap) exitwith {};
    
    {
        player groupSelectUnit [_x, false]; 
    } foreach units group player;
};

// If multiplayer, then disable the cheating "move to" waypoint feature.
if (isMultiplayer) then {
    [] spawn {
        waitUntil {!isNull(findDisplay 46)}; 
        // (findDisplay 46) displayAddEventHandler ["KeyDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
        (findDisplay 46) displayAddEventHandler ["MouseButtonDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
    };
};

if (!isMultiplayer) then {
    {
        /*
        _x setCaptive true;
        
        removeAllWeapons _x;
        removeAllItems _x;
        _x addWeapon "ItemRadio";
        _x addWeapon "ItemWatch";
        _x addWeapon "ItemMap";
        */
        
        if (_x != p1) then {
            deleteVehicle _x;
        };
    } foreach units group player;
};

// Add end event handler

"drn_var_Escape_MissionEndResult" addPublicVariableEventHandler {
	[drn_var_Escape_MissionEndResult] call drn_fnc_Escape_PlayEndScene;
};


// Run start sequence for all players
if (!isNull player) then {
    [_volume, _showIntro, _showPlayerMapAndCompass, didJip] spawn {
        private ["_volume", "_showIntro", "_showPlayerMapAndCompass", "_isJipPlayer"];
        private ["_marker"];
        
        _volume = _this select 0;
        _showIntro = _this select 1;
        _showPlayerMapAndCompass = _this select 2;
        _isJipPlayer = _this select 3;
        
        waitUntil {!(isNil "drn_startPos")};
        waitUntil {!(isNil "drn_fenceIsCreated")};
        
        if (_isJipPlayer) then {
            private ["_anotherPlayer"];
            
            _anotherPlayer = (call drn_fnc_Escape_GetPlayers) select 0;
            if (player == _anotherPlayer) then {
                _anotherPlayer = (call drn_fnc_Escape_GetPlayers) select 1;
            };
            
            if (_anotherPlayer distance drn_startPos > 50) then {
            	private _pos = getPos _anotherPlayer;
                player setPos [(_pos select 0) - 5 + random 10, (_pos select 1) - 5 + random 10, 0.1];
                //player setUnconscious true;
                player setDamage 0.9;
            }
            else {
                player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
            };

/*
            [] spawn {
                private ["_marker"];
                
                // Communication center markers
                waitUntil {!isNil "drn_var_Escape_communicationCenterPositions"};
                
                for "_i" from 0 to (count drn_var_Escape_communicationCenterPositions) - 1 do {
                    _marker = createMarkerLocal ["drn_Escape_ComCenJipMarker" + str _i, (drn_var_Escape_communicationCenterPositions select _i)];
                    _marker setMarkerTypeLocal "mil_flag";
                };
                
                // Ammo depot markers
                waitUntil {!isNil "drn_var_Escape_ammoDepotPositions"};
                
                for "_i" from 0 to (count drn_var_Escape_ammoDepotPositions) - 1 do {
                    _marker = createMarkerLocal ["drn_Escape_AmmoDepotJipMarker" + str _i, (drn_var_Escape_ammoDepotPositions select _i)];
                    _marker setMarkerTypeLocal "Depot";
                };
                
                // Extraction marker
                if (!isNil "drn_var_Escape_ExtractionMarkerPos") then {
                    _marker = createMarkerLocal ["drn_visibleGoalJipMarker", drn_var_Escape_ExtractionMarkerPos];
                    _marker setMarkerTypeLocal "Faction_US";
                };
            };
*/
        }
        else {
            sleep 1;
            if (_showIntro) then {
/*
			    [
			    	[
			    		["CAMP ROGAIN,", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t>"],
			    		["RESUPPLY POINT", "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>"],
			    		["10 MINUTES LATER ...", "<t align = 'center' shadow = '1' size = '1.0'>%1</t>", 15]
			    	]
			    ] spawn BIS_fnc_typeText;
*/			    
                ["<t size='0.9'>" + "Engima" + "</t>",0.02,0.1,2,-1,0,3010] spawn bis_fnc_dynamicText;
                sleep 1.5;
                ["<t size='0.7'>" + "Author of the very first Escape mission - ""Escape Chernarus"" (Arma 2)" + "</t>",0.02,0.2,2,-1,0,3011] spawn bis_fnc_dynamicText;
                sleep 1.5;
                ["<t size='0.9'>" + "proudly presents" + "</t>",0.02,0.3,2,-1,0,3012] spawn bis_fnc_dynamicText;
            };
            
            player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
            if (!isMultiplayer) then {
                {
                	if (!isPlayer _x) then {
                		deleteVehicle _x;
                	};
//                    _x setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
//                    _x disableAI "MOVE";
                } foreach units group player;
            };
            
            while {!([drn_startPos] call drn_fnc_Escape_AllPlayersOnStartPos) && !isNil "drn_escapeHasStarted"} do {
                sleep 0.1;
            };
            
            if (_showIntro) then {            
                0 cutText ["", "BLACK FADED"];
                sleep 2;
            
                ["<t size='1.5'>" + "Escape Tanoa" + "</t>",0.02,0.4,2,-1,0,3013] spawn bis_fnc_dynamicText;
                sleep 1;
                
                ["Somewhere on Tanoa", str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;
            };
        };

        1 fadeSound _volume;
        
        if (_showPlayerMapAndCompass) then {
            _marker = createMarkerLocal ["drn_startPosMarker", drn_startPos];
            _marker setMarkerType "mil_dot";
            _marker setMarkerColor "ColorOpfor";
            _marker setMarkerText "Prison";
            
            player assignItem "ItemMap";
            player addWeapon "ItemMap";
            player assignItem "ItemCompass";
            player addWeapon "ItemCompass";
        }
        else {
	        player unlinkItem "ItemGps";
	        player unlinkItem "NVGoggles";
	        player unlinkItem "NVGogglesB_blk_F";
	        player unlinkItem "NVGogglesB_grn_F";
	        player unlinkItem "NVGogglesB_gry_F";
	        removeBackpack player;
	        removeHeadgear player;
	        removeGoggles player;
	        removeAllItems player;
	        
            player unlinkItem "ItemMap";
            player unlinkItem "ItemCompass";
        };

        if (_showIntro && !_isJipPlayer) then {
            sleep 1;
        };
        
        enableRadio true;

        // Set position again (a fix for the bug that makes players run away after server restart and before fence is built by server)
        //player setPos [(drn_startPos select 0) + (random 4) - 2, (drn_startPos select 1) + (random 6) - 3, 0];
        //sleep 0.1;
        
        [] spawn {
	        // Set action on all hackable comcenter items (the power generator)
	        
	        waitUntil { !isNil "drn_arr_HackableComCenterItems" };
	        waitUntil { !isNil "drn_HackableComCenterItemsArrayFilled" };
	        
	        {
				_x addAction ["Hijack communication center", "Scripts\Escape\Hijack.sqf"];
	        } foreach drn_arr_HackableComCenterItems;
        };
        
        player setVariable ["drn_var_initializing", false, true];
        waitUntil {!(isNil "drn_escapeHasStarted")};
        
        {
            _x setCaptive false;
            _x enableAI "MOVE";
        } foreach units group player;
    };
};

if (true) exitWith {};
