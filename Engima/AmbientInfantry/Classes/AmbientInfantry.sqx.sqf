









call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Classes\Configuration.sqx.sqf";
call compile preprocessFileLineNumbers "Engima\AmbientInfantry\Classes\InfantryGroup.sqx.sqf";












cl_Engima_AmbientInfantry_Classes_AmbientInfantry_constructor = { params ["_class_fields", "_this"];
    params ["_configuration"];

    _class_fields set [1, _configuration];
    _class_fields set [4, false];

    _class_fields set [2, []];
    _class_fields set [3, false]; _class_fields };




Engima_AmbientInfantry_Classes_AmbientInfantry_CreateInstance = { 
    params ["_parameters"];
    private ["_configuration"];

    _configuration = ([[["Engima_AmbientInfantry_Classes_Configuration",[]]], []] call cl_Engima_AmbientInfantry_Classes_Configuration_constructor);


    private _side = [_parameters, "SIDE", (_configuration select 1)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _unitClasses = [_parameters, "UNIT_CLASSES", (_configuration select 2)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _maxGroupsCount = [_parameters, "MAX_GROUPS_COUNT", (_configuration select 3)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _minUnitsInEachGroup = [_parameters, "MIN_UNITS_IN_EACH_GROUP", (_configuration select 4)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _maxUnitsInEachGroup = [_parameters, "MAX_UNITS_IN_EACH_GROUP", (_configuration select 5)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _minSpawnDistance = [_parameters, "MIN_SPAWN_DISTANCE", (_configuration select 6)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _maxSpawnDistance = [_parameters, "MAX_SPAWN_DISTANCE", (_configuration select 7)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _minSpawnDistanceOnStart = [_parameters, "MIN_SPAWN_DISTANCE_ON_START", (_configuration select 8)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _minSkill = [_parameters, "MIN_SKILL", (_configuration select 9)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _maxSkill = [_parameters, "MAX_SKILL", (_configuration select 10)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _blacklistMarkers = [_parameters, "BLACKLIST_MARKERS", (_configuration select 11)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _onGroupCreating = [_parameters, "ON_GROUP_CREATING", (_configuration select 12)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _onGroupCreated = [_parameters, "ON_GROUP_CREATED", (_configuration select 13)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _onGroupRemoving = [_parameters, "ON_GROUP_REMOVING", (_configuration select 14)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _onCheckReleaseGroup = [_parameters, "ON_CHECK_RELEASE_GROUP", (_configuration select 15)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _onGroupReleased = [_parameters, "ON_GROUP_RELEASED", (_configuration select 16)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;
    private _inDebugMode = [_parameters, "IN_DEBUG_MODE", (_configuration select 17)] call Engima_AmbientInfantry_Classes_Configuration_GetParamValue;

    _configuration set [1, _side];
    _configuration set [2, _unitClasses];
    _configuration set [3, _maxGroupsCount];
    _configuration set [4, _minUnitsInEachGroup];
    _configuration set [5, _maxUnitsInEachGroup];
    _configuration set [6, _minSpawnDistance];
    _configuration set [7, _maxSpawnDistance];
    _configuration set [8, _minSpawnDistanceOnStart];
    _configuration set [9, _minSkill];
    _configuration set [10, _maxSkill];
    _configuration set [11, _blacklistMarkers];
    _configuration set [12, _onGroupCreating];
    _configuration set [13, _onGroupCreated];
    _configuration set [14, _onGroupRemoving];
    _configuration set [15, _onCheckReleaseGroup];
    _configuration set [16, _onGroupReleased];
    _configuration set [17, _inDebugMode];

    private _instance = ([[["Engima_AmbientInfantry_Classes_AmbientInfantry",[]]], [_configuration]] call cl_Engima_AmbientInfantry_Classes_AmbientInfantry_constructor);
    ([_instance, []] call cl_Engima_AmbientInfantry_Classes_AmbientInfantry_Start);
    _instance };




cl_Engima_AmbientInfantry_Classes_AmbientInfantry_FindSpawnPos = { params ["_class_fields", "_this"];
    params ["_playerPositions"];

    private ["_playerPos"];
    private _spawnPos = [];
    private _tries = 0;

    private _minSpawnDistance = ((_class_fields select 1) select 8);
    if ((_class_fields select 3)) then {
        _minSpawnDistance = ((_class_fields select 1) select 6) };



    private _player1Pos = (((selectRandom _playerPositions)) select 2);
    private _player2Pos = (((selectRandom _playerPositions)) select 2);
    private _player1Count = 0;
    private _player2Count = 0;

    {
        private _pos = (_x select 4);

        if (_pos distance2D _player1Pos < _pos distance2D _player2Pos) then {
            _player1Count = _player1Count + 1; } else { 


            _player2Count = _player2count + 1; };
    } forEach 
    (_class_fields select 2);

    if (_player1Count > _player2Count) then {
        _playerPos = _player2Pos; } else { 


        _playerPos = _player1Pos; };


    while { count _spawnPos == 0 && count _playerPositions > 0 && _tries <= 20 } do {

        private _x = (_playerPos select 0) - ((_class_fields select 1) select 7) + random (2 * ((_class_fields select 1) select 7));
        private _y = (_playerPos select 1) - ((_class_fields select 1) select 7) + random (2 * ((_class_fields select 1) select 7));
        private _pos = [_x, _y, 0.2];
        private _insideBlacklistMarker = false;


        {
            if (_pos inArea _x) then {
                _insideBlacklistMarker = true; };
        } forEach (
        (_class_fields select 1) select 11);

        private _tooCloseToPlayer = false;
        private _tooFarFromPlayers = true;

        if (!surfaceIsWater _pos && !_insideBlacklistMarker) then {
            {
                scopeName "current";

                if ((_x select 2) distance _pos < _minSpawnDistance) then {
                    _tooCloseToPlayer = true;
                    breakOut "current"; };
            } forEach 
            _playerPositions;

            if (!_tooCloseToPlayer) then {
                {
                    scopeName "current";

                    if ((_x select 2) distance _pos < ((_class_fields select 1) select 7)) then {
                        _tooFarFromPlayers = false;
                        breakOut "current"; };
                } forEach 
                _playerPositions;

                if (!_tooFarFromPlayers) then {
                    _spawnPos = _pos; }; };



            sleep 0.1; };


        _tries = _tries + 1; };


    _spawnPos };



cl_Engima_AmbientInfantry_Classes_AmbientInfantry_IsRunning_PropIndex = 4;





cl_Engima_AmbientInfantry_Classes_AmbientInfantry_CalculatePlayerBlacklistCoverage = { params ["_class_fields", "_this"];
    params ["_playerPos"];

    private _minSpawnDistance = ((_class_fields select 1) select 6);
    private _maxSpawnDistance = ((_class_fields select 1) select 7);
    private _playerRadius = ((_class_fields select 1) select 7);
    private _blacklistMarkers = ((_class_fields select 1) select 11);
    private _sumCoveredShareBlacklist = 0;

    {
        private _distanceToMarker = (_playerPos select 2) distance2D (getMarkerPos _x);
        private _avgMarkerRadius = (((getMarkerSize _x) select 0) + ((getMarkerSize _x) select 1)) / 2;
        private _coveredShare = 0;

        if (_distanceToMarker < _playerRadius + _avgMarkerRadius) then {

            if (_playerRadius > _distanceToMarker + _avgMarkerRadius) then {
                _coveredShare = _avgMarkerRadius / _playerRadius; } else { 


                _coveredShare = (_playerRadius + _avgMarkerRadius - _distanceToMarker) / (2 * _playerRadius); }; };



        _sumCoveredShareBlacklist = _sumCoveredShareBlacklist + _coveredShare;
    } forEach _blacklistMarkers;

    private _circleParts = 12;
    private _waterCount = 0;
    private _sumWaterCoveredShare = 0;

    for "_i" from 1 to _circleParts do {
        private _x = ((_playerPos select 2) select 0) + _minSpawnDistance * sin (_i * 360 / _circleParts);
        private _y = ((_playerPos select 2) select 1) + _minSpawnDistance * cos (_i * 360 / _circleParts);
        private _closePos = [_x, _y];

        _x = ((_playerPos select 2) select 0) + _maxSpawnDistance * sin (_i * 360 / _circleParts);
        _y = ((_playerPos select 2) select 1) + _maxSpawnDistance * cos (_i * 360 / _circleParts);
        private _farPos = [_x, _y];

        if (surfaceIsWater _closePos && !([_closePos, ((_class_fields select 1) select 11)] call Sqx_Markers_MarkerHelper_PositionInsideAnyMarker)) then {
            _waterCount = _waterCount + 1; };


        if (surfaceIsWater _farPos && !([_farPos, ((_class_fields select 1) select 11)] call Sqx_Markers_MarkerHelper_PositionInsideAnyMarker)) then {
            _waterCount = _waterCount + 1; }; };



    _sumWaterCoveredShare = _waterCount / (_circleParts * 2); 

    _sumCoveredShareBlacklist + _sumWaterCoveredShare };







cl_Engima_AmbientInfantry_Classes_AmbientInfantry_CalculateBlacklistCoverage = { params ["_class_fields", "_this"];
    params ["_playerPositions"];

    private _sumShare = 0;

    {
        _sumShare = _sumShare + (([_class_fields, [_x]] call cl_Engima_AmbientInfantry_Classes_AmbientInfantry_CalculatePlayerBlacklistCoverage));
    } forEach _playerPositions; 

    _sumShare / count _playerPositions };




cl_Engima_AmbientInfantry_Classes_AmbientInfantry_Run = { params ["_class_fields", "_this"];
    private ["_skill", "_group", "_unitsCount"];
    private ["_calculatedGroupsCount"];
    private _groupsCount = 0;
    private _spawnPos = [];
    private _iteration = 0;

    if (isNil "Sqx_Markers_Marker_UnitCurrentId") then {
        Sqx_Markers_Marker_UnitCurrentId = 1; };


    private _closeCircleMarker = "";
    private _farCircleMarker = "";

    if (((_class_fields select 1) select 17) && { local player }) then {
        _closeCircleMarker = createMarkerLocal ["ENG_CloseMarker", getPos vehicle player];
        _closeCircleMarker setMarkerShapeLocal "ELLIPSE";
        _closeCircleMarker setMarkerSizeLocal [((_class_fields select 1) select 6), ((_class_fields select 1) select 6)];
        _closeCircleMarker setMarkerColorLocal "ColorRed";
        _closeCircleMarker setMarkerBrushLocal "Border";

        _farCircleMarker = createMarkerLocal ["ENG_FarMarker", getPos vehicle player];
        _farCircleMarker setMarkerShapeLocal "ELLIPSE";
        _farCircleMarker setMarkerSizeLocal [((_class_fields select 1) select 7), ((_class_fields select 1) select 7)];
        _farCircleMarker setMarkerColorLocal "ColorBlue";
        _farCircleMarker setMarkerBrushLocal "Border"; };

    while { true } do {

        private _playerPositions = call Engima_AmbientInfantry_Classes_Helper_GetAllPlayerPositions;

        if (((_class_fields select 1) select 17) && { local player }) then {
            {
                _closeCircleMarker setMarkerPosLocal (_x select 1);
                _farCircleMarker setMarkerPosLocal (_x select 2);
            } forEach _playerPositions; };


        if (count _playerPositions > 0) then {
            private _coveredShare = ([_class_fields, [_playerPositions]] call cl_Engima_AmbientInfantry_Classes_AmbientInfantry_CalculateBlacklistCoverage);




            private _keptGroups = [];


            {
                private _infantryGroup = _x;
                private _releaseGroup = [(_infantryGroup select 3), _groupsCount] call ((_class_fields select 1) select 15);

                if (!(typeName _releaseGroup == "BOOL")) then {
                    _releaseGroup = false; };


                private _groupPos = ([_x, []] call cl_Engima_AmbientInfantry_Classes_InfantryGroup_UpdatePosition);
                private _closestPlayerDistance = 1000000;
                private _keepGroup = false;
                {
                    scopeName "innerLoop";

                    private _distance = ((_x select 2) distance2D _groupPos);
                    if (_distance < _closestPlayerDistance) then {
                        _closestPlayerDistance = _distance;

                        if (_closestPlayerDistance < ((_class_fields select 1) select 7) || { ((_x select 1)) distance2D _groupPos < ((_x select 1)) distance2D ((_x select 2)) }) then {
                            _keepGroup = true;
                            breakOut "innerLoop"; }; };
                } forEach 

                (call Engima_AmbientInfantry_Classes_Helper_GetAllPlayerPositions);

                if (!_keepGroup || _releaseGroup) then {
                    if (_releaseGroup) then {
                        _groupsCount = _groupsCount - 1;
                        [(_infantryGroup select 3)] call Sqx_Waypoints_WaypointHelper_DeleteAllWaypointsFromGroup;
                        [(_infantryGroup select 3), _groupsCount] call ((_class_fields select 1) select 16); } else { 


                        [(_infantryGroup select 3), _groupsCount] call ((_class_fields select 1) select 14);

                        ([_infantryGroup, []] call cl_Engima_AmbientInfantry_Classes_InfantryGroup_Dispose);

                        _groupsCount = _groupsCount - 1;

                        if (((_class_fields select 1) select 17)) then {
                            player commandChat "Removing ambient infantry group. (Total: " + str _groupsCount + ")"; }; }; } else { 




                    _keptGroups pushBack _infantryGroup;
                    ([_infantryGroup, []] call cl_Engima_AmbientInfantry_Classes_InfantryGroup_CheckEnteredRestrictedArea); };
            } forEach 
            (_class_fields select 2);

            _class_fields set [2, _keptGroups];
            _groupsCount = count _keptGroups;





            _calculatedGroupsCount = round (((_class_fields select 1) select 3) * (1 - _coveredShare));

            if (_groupsCount < _calculatedGroupsCount) then {


                _spawnPos = ([_class_fields, [_playerPositions]] call cl_Engima_AmbientInfantry_Classes_AmbientInfantry_FindSpawnPos);


                if (count _spawnPos > 0) then {
                    _unitsCount = ceil (((_class_fields select 1) select 4) + random (((_class_fields select 1) select 5) - ((_class_fields select 1) select 4)));
                    private _unitClasses = [];

                    for "_i" from 1 to _unitsCount do {
                        _unitClasses pushBack (selectRandom ((_class_fields select 1) select 2)); };


                    private _paramsArray = [_spawnPos, _unitClasses];
                    private _goOnWithSpawn = [_paramsArray, _groupsCount, _calculatedGroupsCount] call ((_class_fields select 1) select 12);


                    _spawnPos = _paramsArray select 0;
                    _unitClasses = _paramsArray select 1;


                    private _userMessedUp = false;
                    private _logMsg = "";
                    if (count _paramsArray != 2) then {
                        _userMessedUp = true;
                        _logMsg = "Engima.AmbientInfantry: Error - Altered params array in OnGroupCreating has wrong number of items. Should be 2."; };

                    if (isNil "_spawnPos" || { !(_spawnPos isEqualTypeArray [0, 0] || _spawnPos isEqualTypeArray [0, 0, 0]) }) then {
                        _spawnPos = [0, 0, 0];
                        _userMessedUp = true;
                        _logMsg = "Engima.AmbientInfantry: Error - Altered parameter 0 in OnGroupCreating is not a position. Must be on format [0,0,0]"; };

                    if (isNil "_unitClasses" || { !(typeName _unitClasses == "ARRAY") } || count _unitClasses == 0) then {
                        _unitClasses = [];
                        _userMessedUp = true;
                        _logMsg = "Engima.AmbientInfantry: Error - Altered parameter 1 in OnGroupCreating is not an array. Must be an array with unit class names."; };


                    if (isNil "_goOnWithSpawn") then {
                        _goOnWithSpawn = true; };


                    if (_userMessedUp) then {
                        diag_log _logMsg;
                        player sideChat _logMsg; };


                    if (_goOnWithSpawn && { count _unitClasses > 0 } && { !_userMessedUp }) then {
                        _group = createGroup ((_class_fields select 1) select 1);

                        {
                            _skill = ((_class_fields select 1) select 9) + random (((_class_fields select 1) select 10) - ((_class_fields select 1) select 9));
                            _x createUnit [_spawnPos, _group, "", _skill];
                        } forEach _unitClasses;

                        {
                            private _varName = "Sqx_Markers_Marker_Unit_" + str Sqx_Markers_Marker_UnitCurrentId;
                            Sqx_Markers_Marker_UnitCurrentId = Sqx_Markers_Marker_UnitCurrentId + 1;
                            _x setVehicleVarName _varName;
                            _x call compile format ["%1 = _this; publicVariable ""%1"";", _varName];
                        } forEach (units _group);

                        (_class_fields select 2) pushBack ([[["Engima_AmbientInfantry_Classes_InfantryGroup",[]]], [_group, (_class_fields select 1)]] call cl_Engima_AmbientInfantry_Classes_InfantryGroup_constructor);
                        _groupsCount = _groupsCount + 1;

                        [_group, _groupsCount] call ((_class_fields select 1) select 13);

                        if (((_class_fields select 1) select 17)) then {
                            player commandChat "Creating ambient infantry group. (Total: " + str _groupsCount + ")"; }; }; }; }; };








        _iteration = _iteration + 1;


        if (_iteration > ((_class_fields select 1) select 3)) then {
            _class_fields set [3, true];

            {
                ([_x, []] call cl_Engima_AmbientInfantry_Classes_InfantryGroup_LookAround);
            } forEach 
            (_class_fields select 2);

            sleep 3; }; }; };





cl_Engima_AmbientInfantry_Classes_AmbientInfantry_Start = { params ["_class_fields", "_this"];
    if (!(_class_fields select 4)) then {
        _class_fields set [4, true];
        ([_class_fields, []] spawn cl_Engima_AmbientInfantry_Classes_AmbientInfantry_Run); }; };