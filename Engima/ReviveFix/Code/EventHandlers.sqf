// Event handler that fires when player respawns. A player respawns when healed by someone (and not
// when hit).
player addEventHandler ["Respawn", {
	player allowDamage true;
	ENGIMA_RESPAWNFIX_playerIsIncapacitated = false;
}];

// Event handler that fires when player is hurt.
if (ENGIMA_REVIVEFIX_alwaysUnconscious) then
{
 	player removeAllEventHandlers "HandleDamage";
 	
	player addEventHandler ["HandleDamage", {
    	params ["_unit", "_hitSelection", "_damage"];
    	
    	scopeName "main";

		if (ENGIMA_RESPAWNFIX_playerIsIncapacitated) then
		{
			_damage = 0;
		}
		else
		{
			// If player is hurt to death, throw out of vehicle and return 0.99
			if (_damage >= 1) then
			{
				ENGIMA_RESPAWNFIX_playerIsIncapacitated = true;
					
				// If playe is in a vehicle, throw him/her out, because vanilla Arma
				// will have him/her killed.
				if (vehicle player != player) then {
					moveOut player;
/*
					player allowDamage false;
					
					[] spawn {
						sleep 1;					
						player setDamage 0.99;
					};
					
					_damage = 0;
				}
				else {
*/
				};
				
				_damage = 0.99;
				
				[] spawn {
					waitUntil {!ENGIMA_RESPAWNFIX_playerIsIncapacitated || !(player getVariable ["BIS_revive_incapacitated", false]) };
					
					player allowDamage true;
					ENGIMA_RESPAWNFIX_playerIsIncapacitated = false;
				};
			};
		};
		
		_damage
	}];
};

// Event handler that fires when player is healed by someone.
if (ENGIMA_REVIVEFIX_treatSelfHealsTo100Percent) then {
	player addEventHandler ["HandleHeal", {
		_this spawn {
			params ["_victim","_healer"];
			private ["_damage"];
			
			// If treated self
			if (_victim == _healer) then {
				_damage = damage _victim;
	
				waitUntil { damage _victim != _damage };
				if (damage _victim < _damage) then {
					_victim setDamage 0;
				};
			};
		};
	}];
};
