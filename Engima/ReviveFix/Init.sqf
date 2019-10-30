ENGIMA_RESPAWNFIX_playerIsIncapacitated = false;
	
if (!isDedicated) then {
	call compile preprocessFile "Engima\ReviveFix\Config.sqf";
	call compile preprocessFile "Engima\ReviveFix\Code\Functions.sqf";
	
	ENGIMA_REVIVEFIX_alwaysUnconscious = [ENGIMA_REVIVEFIX_OPTIONS, "ALWYAS_UNCONSCIOUS", true] call ENGIMA_REVIVEFIX_GetParamValue;
	ENGIMA_REVIVEFIX_treatSelfHealsTo100Percent = [ENGIMA_REVIVEFIX_OPTIONS, "TREAT_SELF_HEALS_TO_100_PERCENT", false] call ENGIMA_REVIVEFIX_GetParamValue;
	
	[] spawn {
		waitUntil { player == player };
		
		// Wait some time to ensure that the HandleDamage event handler will be ours
		sleep 3;
		
		call compile preprocessFile "Engima\ReviveFix\Code\EventHandlers.sqf";
	};
};
