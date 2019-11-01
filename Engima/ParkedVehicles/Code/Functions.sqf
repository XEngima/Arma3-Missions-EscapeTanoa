/*
 * Summary: Gets a parameter value in a paired list on format ["KEY", value].
 * Arguments:
 *   _params: List of paired value parameters.
 *   _key: String with key to look for.
 *   _default: Value that is returned if key was not found.
 * Returns: Value associated with key. ObjNull if no key was found.
 */
PARKEDVEHICLES_GetParamValue = {
  	private ["_params", "_key"];
  	private ["_value"];

   	_params = _this select 0;
   	_key = _this select 1;
	_value = if (count _this > 2) then { _this select 2 } else { objNull };

   	{
   		if (_x select 0 == _key) then {
   			_value = _x select 1;
   		};
   	} foreach (_params);
    	
   	_value
};

// Gets a building definition.
// _buildingClassName (String): The class name of the building.
// Returns (Array): The building definition. Empty array if building does not exist.
PARKEDVEHICLES_GetBuildingDefinition = {
	params ["_buildingClassName"];
	
	scopeName "main";
	
	{
		if ((_x select 0) == _buildingClassName) then {
			_x breakOut "main";
		};
	} foreach PARKEDVEHICLES_GarageDefinitions;
	
	[];
};

// Spawns all vehicles matching the provided parameter set.
PARKEDVEHICLES_PlaceVehiclesOnMap = {
	_this spawn {
		private _buildingClasses = [_this, "BUILDING_TYPES", ["Land_FuelStation_02_workshop_F"]] call PARKEDVEHICLES_GetParamValue;
		private _vehicleClasses = [_this, "VEHICLE_CLASSES", ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"]] call PARKEDVEHICLES_GetParamValue;
		private _probabilityOfPresence = [_this, "PROBABILITY_OF_PRESENCE", 1] call PARKEDVEHICLES_GetParamValue;
		private _onVehicleSpawned = [_this, "ON_VEHICLE_CREATED", {}] call PARKEDVEHICLES_GetParamValue;
		private _debug = [_this, "DEBUG", false] call PARKEDVEHICLES_GetParamValue;
		
		sleep 1;
		
		private _spawnedVehiclesCount = 0;
		
		{
			private _buildingClass = _x;
			private _buildingDefinition = [_x] call PARKEDVEHICLES_GetBuildingDefinition;
			
			private _buildingPosIndex = _buildingDefinition select 1;
			private _offsetPosition = _buildingDefinition select 2;
			private _vehicleDir = _buildingDefinition select 3;
			
			private _buildings = nearestObjects [player, [_buildingClass], 99999999];
			
			{
				private _building = _x;
				
				private _spawnVehicleHere = _building getVariable ["SpawnVehicleHere", (random 1 < _probabilityOfPresence)];
				
				if (_spawnVehicleHere) then
				{
					private _buildingPositions = [_building] call BIS_fnc_buildingPositions;
					if (count _buildingPositions > 0 || _buildingPosIndex == -1) then
					{
						private _buildingPos = getPos _building;
						
						if (_buildingPosIndex >= 0) then {
							_buildingPos = _buildingPositions select _buildingPosIndex;
						};
						
						private _buildingDir = getDir _building;
						
						private _spawnPos = _buildingPos getPos [_offsetPosition select 1, _buildingDir]; // y
						_spawnPos = _spawnPos getPos [_offsetPosition select 0, _buildingDir + 90]; // x
						_spawnPos = [_spawnPos select 0, _spawnPos select 1, _offsetPosition select 2]; // z
						
						private _objectsTooClose = false;
						private _nearObjects = (_spawnPos nearObjects 3) + (nearestTerrainObjects [_spawnPos, [], 3]);
						
						{
							private _box = boundingBox _x;
							private _corner1 = _box select 0;
							private _corner2 = _box select 1;
							private _size = _corner1 distance _corner2;
							
							if (_size > 0.5 && _x != _building) then {
								//player sideChat str _size;
								_objectsTooClose = true; 
							};
						} foreach _nearObjects;
						
						if (!_objectsTooClose) then {
							private _vehicleClass = selectRandom _vehicleClasses;
							private _vehicle = createVehicle [_vehicleClass, [_spawnPos select 0, _spawnPos select 1, 1000], [], 0, "CAN_COLLIDE"];
							
							_vehicle setDir (_buildingDir + _vehicleDir);
							_vehicle setPos _spawnPos;
							
							// Monitor vehicle health
							[_vehicle, _buildingClass, _vehicleClass, _spawnPos, _onVehicleSpawned, _debug] spawn {
								params ["_vehicle", "_buildingClass", "_vehicleClass", "_spawnPos", "_onVehicleSpawned", "_debug"];
								
								sleep 1;
								
								// If vehicle exploded or flew away upon spawn
								if (alive _vehicle && _vehicle distance _spawnPos < 3) then {
									[_vehicle] call _onVehicleSpawned;
								}
								else {
									private _msg = "Vehicle class " + _vehicleClass + " destroyed when put in building class " + _buildingClass + " on " + worldName + " at " + (str _spawnPos) + ".";
									diag_log _msg;
									
									if (_debug) then {
										player sideChat _msg;
										
										private _marker = createMarker ["ParkedVehiclesFailMarker" + str PARKEDVEHICLES_UniqueMarkerNo, _spawnPos];
										PARKEDVEHICLES_UniqueMarkerNo = PARKEDVEHICLES_UniqueMarkerNo + 1;
									
										_marker setMarkerType "mil_dot";
										_marker setMarkerColor "ColorBlack";
										_marker setMarkerText "Destroyed";
									};
									
									deleteVehicle _vehicle;
								};
							};
							
							if (_debug) then
							{
								private _debugMarker = createMarker [format ["parked_vehicles_marker%1", PARKEDVEHICLES_UniqueMarkerNo], _spawnPos];
								PARKEDVEHICLES_UniqueMarkerNo = PARKEDVEHICLES_UniqueMarkerNo + 1;
								
								_debugMarker setMarkerShape "ICON";
								_debugMarker setMarkerType "mil_dot";
								_debugMarker setMarkerColor "ColorWhite";
								_spawnedVehiclesCount = _spawnedVehiclesCount + 1;
							};
						}
						else {
							if (_debug) then {
								player sideChat _buildingClass + ": Object too close! Vehicle not spawned.";
								
								private _debugMarker = createMarker [format ["parked_vehicles_marker%1", PARKEDVEHICLES_UniqueMarkerNo], _spawnPos];
								PARKEDVEHICLES_UniqueMarkerNo = PARKEDVEHICLES_UniqueMarkerNo + 1;
								
								_debugMarker setMarkerShape "ICON";
								_debugMarker setMarkerType "mil_dot";
								_debugMarker setMarkerColor "ColorRed";
								_debugMarker setMarkerText "Too Close";
							};
						};
					};
				};
				
				sleep 0.2;
			} foreach _buildings;
			
			sleep 0.2;
		} foreach _buildingClasses;
		
		if (_debug) then {
			player sideChat (str _spawnedVehiclesCount) + " vehicles spawned in or near garages/buildings."
		};
	};
};

/* Functions that may be of help when creating more building definitions. */

PARKEDVEHICLES_InvestigateClosestBuilding = {
	private _building = nearestBuilding player;
	player sideChat (typeOf (_building));
	
	private _positions = [_building] call BIS_fnc_buildingPositions;
	player sideChat (str count _positions) + " positions.";
	
	{
		createVehicle ["Sign_Arrow_Blue_F", _x, [], 0, "CAN_COLLIDE"];
	} foreach _positions;
};
