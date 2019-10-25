



















cl_Engima_AmbientInfantry_Classes_InfantryGroup_constructor = { params ["_class_fields", "_this"];
    params ["_group", "_configuration"];

    _class_fields set [5, false];

    _class_fields set [3, _group];
    _class_fields set [1, _configuration];
    _class_fields set [2, ["null"]];

    if (((_class_fields select 1) select 17)) then {
        private _color = "ColorCivilian";

        if (side (_class_fields select 3) == opfor) then {
            _color = "ColorOpfor"; };

        if (side (_class_fields select 3) == blufor) then {
            _color = "ColorBlufor"; };

        if (side (_class_fields select 3) == resistance) then {
            _color = "ColorGuer"; };



        _class_fields set [2, [getPos (units _group select 0), "hd_dot", _color, "Ambient Infantry"] call Sqx_Markers_Marker_CreateIconMarker]; };


    [units _group select 0] spawn Engima_AmbientInfantry_Classes_InfantryGroup_MoveGroup; _class_fields };



cl_Engima_AmbientInfantry_Classes_InfantryGroup_Group_PropIndex = 3;


cl_Engima_AmbientInfantry_Classes_InfantryGroup_Position_PropIndex = 4;

cl_Engima_AmbientInfantry_Classes_InfantryGroup_MovingOutFromRestrictedArea_PropIndex = 5;

cl_Engima_AmbientInfantry_Classes_InfantryGroup_CheckEnteredRestrictedArea = { params ["_class_fields", "_this"];
    private _position = ([_class_fields, []] call cl_Engima_AmbientInfantry_Classes_InfantryGroup_UpdatePosition);
    private _inRestrictedArea = [_position, ((_class_fields select 1) select 11)] call Sqx_Markers_MarkerHelper_PositionInsideAnyMarker;


    if (_inRestrictedArea) then {

        if (!(_class_fields select 5)) then {

            [((_class_fields select 3))] call Sqx_Waypoints_WaypointHelper_DeleteAllWaypointsFromGroup;

            private _steps = 8;
            private _distance = 50;
            private _startDir = floor random 360;
            private _clockwise = selectRandom [-1, 1];

            for "_i" from 0 to _steps - 1 do {
                scopeName "forLoop";

                private _dir = _startDir + _clockwise * _i * (360 / _steps);
                private _x = (_position select 0) + _distance * sin _dir;
                private _y = (_position select 1) + _distance * cos _dir;

                if (!([[_x, _y], ((_class_fields select 1) select 11)] call Sqx_Markers_MarkerHelper_PositionInsideAnyMarker)) then {
                    _class_fields set [5, true];
                    [units (_class_fields select 3) select 0, [_x, _y]] spawn Engima_AmbientInfantry_Classes_InfantryGroup_MoveGroup;
                    breakOut "forLoop"; }; }; }; } else { 





        if ((_class_fields select 5)) then {
            _class_fields set [5, false]; }; }; };








Engima_AmbientInfantry_Classes_InfantryGroup_MoveGroup = { 
    params ["_unit", ["_sentInDestinationPos", []]];

    private ["_destinationPos"];
    private ["_waypoint", "_waypointFormations", "_formation", "_combatMode"];

    private _group = group _unit;

    if (count _sentInDestinationPos > 0) then {
        _destinationPos = +_sentInDestinationPos; } else { 


        private _x = (getPos _unit) select 0;
        private _y = (getPos _unit) select 1;
        _destinationPos = [_x - 1500 + random 3000, _y - 1500 + random 3000];
        while { surfaceIsWater _destinationPos } do {
            _destinationPos = [_x - 1500 + random 3000, _y - 1500 + random 3000]; }; };



    _waypointFormations = ["COLUMN", "STAG COLUMN", "FILE", "DIAMOND"];
    _formation = selectRandom _waypointFormations;
    _combatMode = selectRandom ["BLUE", "GREEN", "WHITE", "YELLOW", "RED"];

    _waypoint = _group addWaypoint [_destinationPos, 0];
    _waypoint setWaypointCompletionRadius 50;

    _waypoint setWaypointStatements ["true", "_nil = [" + vehicleVarName _unit + "] spawn Engima_AmbientInfantry_Classes_InfantryGroup_MoveGroup;"];
    _group setBehaviour "SAFE";
    _group setSpeedMode "LIMITED";
    _group setFormation _formation;
    _group setCombatMode _combatMode; };




cl_Engima_AmbientInfantry_Classes_InfantryGroup_UpdatePosition = { params ["_class_fields", "_this"];
    private _position = getPos (units ((_class_fields select 3)) select 0);

    _class_fields set [4, _position];

    if (((_class_fields select 1) select 17)) then {
        ([(_class_fields select 2), [_position]] call cl_Sqx_Markers_Marker_SetPosition); };


    _position };


cl_Engima_AmbientInfantry_Classes_InfantryGroup_DoLookAround = { params ["_class_fields", "_this"];
    private _group = (_class_fields select 3);

    sleep random 10;

    if (!isNull _group) then {
        private _units = units _group;
        private _unit = selectRandom _units;
        private _angle = random 360;
        private _y = 100 * cos _angle;
        private _x = 100 * sin _angle;

        private _lookAtPos = [(getPos _unit select 0) + _y, (getPos _unit select 1) + _x, 0];
        _unit lookAt _lookAtPos;

        sleep 5;
        if (!isNull _unit) then {
            _unit lookAt objNull; }; }; };




cl_Engima_AmbientInfantry_Classes_InfantryGroup_LookAround = { params ["_class_fields", "_this"];
    ([_class_fields, []] spawn cl_Engima_AmbientInfantry_Classes_InfantryGroup_DoLookAround); };



cl_Engima_AmbientInfantry_Classes_InfantryGroup_Dispose = { params ["_class_fields", "_this"];
    {
        deleteVehicle _x;
    } forEach units (_class_fields select 3);

    deleteGroup (_class_fields select 3);
    _class_fields set [3, grpNull];

    if (!((_class_fields select 2) isEqualTo ["null"])) then {
        ([(_class_fields select 2), []] call cl_Sqx_Markers_Marker_Hide); }; };