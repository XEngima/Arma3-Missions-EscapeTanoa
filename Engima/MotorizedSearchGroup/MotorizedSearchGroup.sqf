/* 
 * This file contains the logic for Engima's Motorized Search script and should not be edited.
 * See file Engima\MotorizedSearchGroup\Documentation.txt for a full documentation and customizion options.
 */

if (!isServer) exitWith {};

private ["_vehicle", "_searchAreaMarker", "_debug"];
private ["_maxStationaryTimeSec", "_maxWalkDistanceMeters", "_state", "_searchAreaExists", "_shownMissingSearchAreaMsg", "_searchGroupExists", "_destinationPos", "_group", "_soldiers"];
private ["_side", "_garbageGroup", "_lastPos", "_stationaryTimeSec", "_useVehicle", "_enemyPos", "_enemySighted", "_waypoint", "_currentEntityNo"];
private ["_fnc_isMounted", "_fnc_getRandomMarkerPos", "_fnc_isUnMounted", "_fnc_ClearAllWaypoints", "_fnc_GetKnownEnemyPosition", "_fnc_SetNewState"];

_maxStationaryTimeSec = 60;
_maxWalkDistanceMeters = 300;

_vehicle = _this select 0;
_searchAreaMarker = _this select 1;
if (count _this > 2) then {_debug = _this select 2;} else {_debug = false;};

if (_debug) then {
    player sideChat "Starting motorized search group script...";
};

/*
 * Summary: Gets a random position inside a marker of shape RECTANGLE or ELLIPSE with any angle.
 * Arguments:
 *   _markerName: Name of marker to get a random position inside.
 * Returns: A position (array) inside current marker. If marker doesn't exist, [0, 0, 0] is returned.
 */
_fnc_getRandomMarkerPos = {
    private ["_markerName"];
    private ["_isInside", "_px", "_py", "_mpx", "_mpy", "_msx", "_msy", "_ma", "_rpx", "_rpy", "_i"];
    
    _markerName = _this select 0;
    
    _isInside = false;
    _i = 0;
    
    while {!_isInside} do {
        _mpx = (getMarkerPos _markerName) select 0;
        _mpy = (getMarkerPos _markerName) select 1;
        _msx = (getMarkerSize _markerName) select 0;
        _msy = (getMarkerSize _markerName) select 1;
        _ma = (markerDir _markerName);
        
        _px = _mpx -_msx + random (_msx * 2);
        _py = _mpy -_msy + random (_msy * 2);
        
        //Now, rotate point as marker is rotated
        _rpx = ( (_px - _mpx) * cos(_ma) ) + ( (_py - _mpy) * sin(_ma) ) + _mpx;
        _rpy = (-(_px - _mpx) * sin(_ma) ) + ( (_py - _mpy) * cos(_ma) ) + _mpy;
        
        if ([_rpx, _rpy, 0] inArea _markerName) then {
            _isInside = true;
        };

        _i = _i + 1;
        if (_i > 1000) exitWith {
            _rpx = 0;
            _rpy = 0;
        };
    };
    
    [_rpx, _rpy, 0]
};

_fnc_isUnMounted = {
    private ["_units"];
    private ["_result"];
    
    _units = _this select 0;
    _result = true;
    if (({vehicle _x != _x} count _units) > 0) then {
        _result = false;
    };
    
    _result
};

_fnc_isMounted = {
    private ["_units"];
    private ["_result"];

    _units = _this select 0;
    
    if (count _units == 0) then {
        _result = false;
    }
    else {
        _result = true;
        if (({vehicle _x == _x} count _units) > 0) then {
            _result = false;
        };
    };
    
    _result
};

_fnc_ClearAllWaypoints = {
    private ["_group"];
    private ["_waypointCount", "_i"];
    
    _group = _this select 0;

    _waypointCount = count waypoints _group;
    
    for [{_i = _waypointCount - 1}, {_i >= 0}, {_i = _i - 1}] do {
        deleteWaypoint [_group, _i];
    };
};

_fnc_GetKnownEnemyPosition = {
    private ["_leader"];
    private ["_supposedPosition", "_nearestEnemyUnit", "_distanceToNearestUnit"];
    
    _leader = _this select 0;
    
    _supposedPosition = [];
    
    scopeName "mainScope";
    
    _nearestEnemyUnit = _leader findNearestEnemy _leader;
    if (!isNull _nearestEnemyUnit) then {
        
        _distanceToNearestUnit = (_leader distance _nearestEnemyUnit);
        
        {
            private ["_detectedUnit"];
            _detectedUnit = _x select 4;
            
            if (_detectedUnit == _nearestEnemyUnit) then {
                private ["_enemysSupposedPos", "_positionAccuracy"];
                
                _enemysSupposedPos = (_x select 0);
                _positionAccuracy = (_x select 5);
                
                // Check if position is enough accurate
                if (_positionAccuracy < 100) then {
                    _supposedPosition = _enemysSupposedPos;
                };
                
                breakTo "mainScope";
            };
        } foreach (_leader nearTargets _distanceToNearestUnit + 50);
    };
    
    _supposedPosition
};

_fnc_SetNewState = {
    private ["_state", "_debug"];
    
    _state = _this select 0;
    _debug = _this select 1;
    
    if (_debug) then {
        player sideChat "Motorized search group state = " + _state;
    };
    
    _state
};

// Name vehicle
sleep random 0.25;
if (isNil "dre_MotorizedSearchGroup_CurrentEntityNo") then {
    dre_MotorizedSearchGroup_CurrentEntityNo = 0;
}
else {
    dre_MotorizedSearchGroup_CurrentEntityNo = dre_MotorizedSearchGroup_CurrentEntityNo + 1;
};

_currentEntityNo = dre_MotorizedSearchGroup_CurrentEntityNo;

if (isNull _vehicle) exitWith {};

_group = group _vehicle;
_side = side _group;
_soldiers =+ assignedCargo _vehicle;
{
    if (vehicle _x == _x) then {
        _soldiers set [count _soldiers, _x];
    };
} foreach units _group;

_searchAreaExists = false;
_shownMissingSearchAreaMsg = false;

while {!_searchAreaExists} do {
    if (((getMarkerPos _searchAreaMarker) select 0) != 0 || ((getMarkerPos _searchAreaMarker) select 1 != 0)) then {
        _searchAreaExists = true;
    }
    else {
        if (_debug && !_shownMissingSearchAreaMsg) then {
            player sideChat "Motorized search group waiting for search area assignment...";
            _shownMissingSearchAreaMsg = true;
        };
    };
    sleep 1;
};

if (_debug) then {
    player sideChat "Search area exists. Motorized search group on its way!";
};

_searchGroupExists = true;

_state = "READY";
_lastPos = [0, 0, 0];
_destinationPos = [];
_useVehicle = false;
_enemySighted = false;
_stationaryTimeSec = 0;
if (canMove _vehicle && fuel _vehicle > 0) then {
    _useVehicle = true;
};

scopeName "mainScope";

private _vehicleDebugMarker = "";

if (_debug) then {
	_vehicleDebugMarker = createMarker ["dre_MotorizedSearchGroup_VehicleDebugMarker" + str _currentEntityNo, getPos vehicle (leader group _vehicle)];
	_vehicleDebugMarker setMarkerType "mil_dot";
	_vehicleDebugMarker setMarkerColor "ColorRed";
	_vehicleDebugMarker setMarkerText "MSG" + str _currentEntityNo;
};

private _destinationDebugMarker = "";

while {_searchGroupExists} do
{    
    if (_debug) then
    {
    	_vehicleDebugMarker setMarkerPos getPos (vehicle leader group _vehicle);
    };    
    
    if ((str _lastPos) == (str getPos leader _group)) then {
        _stationaryTimeSec = _stationaryTimeSec + 1;
    }
    else {
        _stationaryTimeSec = 0;
        _lastPos = + (getPos leader _group);
    };
    
    if (_stationaryTimeSec > _maxStationaryTimeSec) then {
        [_group] call _fnc_ClearAllWaypoints;
        
        if (_debug) then {
            player sideChat "Motorized search group stationary for long time. Reseting...";
        };
        
        _stationaryTimeSec = 0;
        _state = ["READY", _debug] call _fnc_SetNewState;
    };
    
    if (count _destinationPos > 0) then
    {
        if (_state != "ENGAGING" && !(_destinationPos inArea _searchAreaMarker)) then
        {
            [_group] call _fnc_ClearAllWaypoints;
            _state = ["READY", _debug] call _fnc_SetNewState;
            
            if (_debug) then {
                player sideChat "Motorized search group interrupting and following new intel. Reseting...";
            };
        };
    };
    
    _garbageGroup = grpNull;
    
    {
        if ((!alive _x) || (!canStand _x)) then {
        	if (isNull _garbageGroup) then {
        		_garbageGroup = createGroup _side;
        	};
        
            _soldiers = _soldiers - [_x];
            [_x] joinSilent _garbageGroup;
            
            if (count units _group == 0) then {
                deleteGroup _group;
                _searchGroupExists = false;
                breakTo "mainScope";
            };
        };
    } foreach _soldiers;
    
    if (!isNull _garbageGroup) then {
    	[_garbageGroup, _debug] spawn {
    		params ["_garbageGroup", "_debug"];
    		
    		if (_debug) then {
    			player sideChat "Unit dead. Starting motorized search group garbage collector.";
    		};
    		
    		while {count units _garbageGroup > 0} do
    		{
    			private _units = units _garbageGroup;
    			
    			{
    				private _unit = _x;
	    			private _closestPlayerDistance = 9999999999;
    				
	    			{
	    				if (_x distance _unit < _closestPlayerDistance) then {
	    					_closestPlayerDistance = _x distance _unit;
	    				};
	    			} foreach call (BIS_fnc_listPlayers);
	    			
	    			if (_closestPlayerDistance > 500) then {
	    				deleteVehicle _unit;
	    				
	    				if (_debug) then {
	    					player sideChat "Garbage collector deleted a motorized search group unit.";
	    				};
	    			};
    			} foreach _units;
    			
    			sleep 10;
    		};
    		
    		deleteGroup _garbageGroup;
    	};
    };
    
    if ((!(canMove _vehicle) || (fuel _vehicle <= 0)) && _useVehicle) then
    {
        _useVehicle = false;
        
        // Separate soldiers and crew
        [_group] call _fnc_ClearAllWaypoints;
        _group = createGroup _side;
        _soldiers joinSilent _group;
        
        _state = ["BEGIN UNMOUNT", _debug] call _fnc_SetNewState;
        
        if (_debug) then {
            player sideChat "Motorized search group abondoning vehicle...";
        };
    };
            
    if (_state == "READY") then {
        _enemySighted = false;
        _enemyPos = [0, 0, 0];
        _enemySighted = false;
        _useVehicle = false;
        if (canMove _vehicle && fuel _vehicle > 0) then {
            _useVehicle = true;
        };
        
		_destinationPos = [_searchAreaMarker] call _fnc_getRandomMarkerPos;
		while {surfaceIsWater _destinationPos} do {
			_destinationPos = [_searchAreaMarker] call _fnc_getRandomMarkerPos;
		};
        
        if (_debug) then
        {
        	if (_destinationDebugMarker == "") then {
		    	_destinationDebugMarker = createMarker ["dre_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo, _destinationPos];
		    	_destinationDebugMarker setMarkerType "mil_dot";
		    	_destinationDebugMarker setMarkerColor "ColorRed";
		    	_destinationDebugMarker setMarkerText "MSG" + str _currentEntityNo + " destination";
        	};
        
	    	_destinationDebugMarker setMarkerPos _destinationPos;
        };

        if (count _soldiers > 0) then {
            // If distance is within walk distance            
            if (((leader _group) distance _destinationPos) < _maxWalkDistanceMeters) then {
            	_vehicle limitSpeed 10;
            	
                if (!([_soldiers] call _fnc_isUnMounted)) then {
                    _state = ["BEGIN UNMOUNT", _debug] call _fnc_SetNewState;
                }
                else {
                    if (_enemySighted) then {
                        _state = ["BEGIN ENGAGE", _debug] call _fnc_SetNewState;
                    }
                    else {
                        _state = ["BEGIN MOVE", _debug] call _fnc_SetNewState;
                    };
                };
            }
            else {
                // If distance is not within walk distance
                if (_useVehicle) then {
	            	_vehicle limitSpeed 1000;
	            	
                    _state = ["BEGIN MOUNT", _debug] call _fnc_SetNewState;
                }
                else {
                    if (_enemySighted) then {
                        _state = ["BEGIN ENGAGE", _debug] call _fnc_SetNewState;
                    }
                    else {
                        _state = ["BEGIN MOVE", _debug] call _fnc_SetNewState;
                    };
                }
            };
        }
        else {
            if (_enemySighted) then {
                _state = ["BEGIN ENGAGE", _debug] call _fnc_SetNewState;
            }
            else {
                _state = ["BEGIN MOVE", _debug] call _fnc_SetNewState;
            };
        };
    };
    
    if (_state == "BEGIN MOUNT") then {
        if (!([_soldiers] call _fnc_isMounted)) then {
            _soldiers allowGetIn true;
            {
                _x assignAsCargo _vehicle;
            } foreach _soldiers;
            _soldiers orderGetIn true;
        };
        
        _state = ["MOUNTING", _debug] call _fnc_SetNewState;
    };
    
    if (_state == "BEGIN UNMOUNT") then {
        if (!([_soldiers] call _fnc_isUnMounted)) then {
            _soldiers orderGetIn false;
            {
                unassignVehicle _x;
            } foreach _soldiers;
            _soldiers allowGetIn false;
        };
        
        _state = ["UNMOUNTING", _debug] call _fnc_SetNewState;
    };
    
    if (_state == "MOUNTING") then {
    	_vehicle limitSpeed 1000;
    	
        if ([_soldiers] call _fnc_isMounted) then {
            _state = ["BEGIN MOVE", _debug] call _fnc_SetNewState;
        };
    };
    
    if (_state == "UNMOUNTING") then {
    	_vehicle limitSpeed 10;
    	
        if ([_soldiers] call _fnc_isUnMounted) then {
            if (_enemySighted) then {
                _state = ["BEGIN ENGAGE", _debug] call _fnc_SetNewState;
            }
            else {
                _state = ["BEGIN MOVE", _debug] call _fnc_SetNewState;
            };
        };
    };
    
    if (_state == "BEGIN MOVE") then {
        private ["_behaviour", "_speed", "_formation", "_combatMode", "_type"];
        
        if (count _soldiers > 0 && ([_soldiers] call _fnc_isUnMounted)) then {
            _soldiers allowGetIn false;
        };
        
        if (_useVehicle) then {
            if ((leader _group) distance _destinationPos > _maxWalkDistanceMeters) then {
                _type = "MOVE";
                _behaviour = "SAFE";
                _combatMode = "YELLOW";
                _speed = "NORMAL";
                _formation = "WEDGE";
            }
            else {
                _type = "MOVE";
                _behaviour = "AWARE";
                _combatMode = "YELLOW";
                _speed = "LIMITED";
                _formation = "LINE";
            };
        }
        else {
            _type = "MOVE";
            _behaviour = "SAFE";
            _combatMode = "YELLOW";
            _speed = "LIMITED";
            _formation = "COLUMN";
        };
        
        _waypoint = _group addWaypoint [_destinationPos, 0];
        _waypoint setWaypointType _type;
        _waypoint setWaypointBehaviour _behaviour;
        _waypoint setWaypointCombatMode _combatMode;
        _waypoint setWaypointSpeed _speed;
        _waypoint setWaypointFormation _formation;
        
        _group setBehaviour _behaviour;
        _group setCombatMode _combatMode;
        _group setSpeedMode _speed;
        _group setFormation _formation;
        
        _stationaryTimeSec = 0;
        _state = ["MOVING", _debug] call _fnc_SetNewState;
    };
    
    if (_state == "BEGIN ENGAGE") then {
        private ["_behaviour", "_speed", "_formation", "_combatMode", "_type"];
        
        _destinationPos = _enemyPos;
        
        if (_debug) then {
	    	private _marker = createMarker ["dre_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo, _destinationPos];
	    	_marker setMarkerType "mil_dot";
	    	_marker setMarkerColor "ColorRed";
	    	_marker setMarkerText "MSG" + str _currentEntityNo + " target";
        };
        
        [_group] call _fnc_ClearAllWaypoints;
        if (count _soldiers > 0) then {
            _soldiers allowGetIn false;
        };
        
        if (_useVehicle) then {
            if (count _soldiers > 0) then {
                _type = "SAD";
                _behaviour = "AWARE";
                _combatMode = "YELLOW";
                _speed = "LIMITED";
                _formation = "LINE";
            }
            else {
                _type = "SAD";
                _behaviour = "COMBAT";
                _combatMode = "YELLOW";
                _speed = "LIMITED";
                _formation = "LINE";
            }
        }
        else {
            _type = "SAD";
            _behaviour = "AWARE";
            _combatMode = "RED";
            _speed = "NORMAL";
            _formation = "LINE";
        };
        
        _waypoint = _group addWaypoint [_enemyPos, 0];
        _waypoint = _group addWaypoint [_enemyPos, 0];
        _waypoint setWaypointType _type;
        _waypoint setWaypointBehaviour _behaviour;
        _waypoint setWaypointCombatMode _combatMode;
        _waypoint setWaypointSpeed _speed;
        _waypoint setWaypointFormation _formation;
        
        _group setBehaviour _behaviour;
        _group setCombatMode _combatMode;
        _group setSpeedMode _speed;
        _group setFormation _formation;
        
        _stationaryTimeSec = 0;
        _state = ["ENGAGING", _debug] call _fnc_SetNewState;
    };
    
    if (_state == "MOVING") then {
        private ["_currentEnemyPosition"];
        
        _currentEnemyPosition = [leader _group] call _fnc_GetKnownEnemyPosition;
        
        if (count _currentEnemyPosition > 0) then {
            _enemySighted = true;
            _enemyPos = + _currentEnemyPosition;
            
            if (_useVehicle && (count _soldiers > 0) && (!([_soldiers] call _fnc_IsUnMounted))) then {
                _state = ["BEGIN UNMOUNT", _debug] call _fnc_SetNewState;
            }
            else {
                _state = ["BEGIN ENGAGE", _debug] call _fnc_SetNewState;
            };
        }
        else {
            if (((leader _group) distance _destinationPos) < 200) then {
                if (count _soldiers > 0) then {
                    if ([_soldiers] call _fnc_IsMounted) then {
                        _state = ["BEGIN UNMOUNT", _debug] call _fnc_SetNewState;
                    };
                }
                else {
                    _group setBehaviour "COMBAT";
                    _group setSpeedMode "LIMITED";
                    _group setCombatMode "YELLOW";
                };
            };
                
            if (((leader _group) distance _destinationPos) < 25) then {
                _state = ["READY", _debug] call _fnc_SetNewState;
            };
        };
    };
    
    if (_state == "ENGAGING") then {
        private ["_currentEnemyPosition"];
        
        _currentEnemyPosition = [leader _group] call _fnc_GetKnownEnemyPosition;
        if (count _currentEnemyPosition > 0) then {
            if (_currentEnemyPosition distance _enemyPos > 100) then {
                _enemyPos = + _currentEnemyPosition;
                _waypoint setWaypointPosition [_enemyPos, 0];
            };
        };
    };
    
    if (!canMove _vehicle && count _soldiers == 0) then {
        _searchGroupExists = false;
    };
    
    sleep 1;
};

if (_debug) then {
    player sideChat "Motorized search group destroyed. Script exiting.";
    deleteMarker _vehicleDebugMarker;
    deleteMarker ("dre_MotorizedSearchGroup_DestinationDebugMarker" + str _currentEntityNo);
};




