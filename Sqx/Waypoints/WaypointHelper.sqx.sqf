










cl_Sqx_Waypoints_WaypointHelper_constructor = { _this select 0 };



Sqx_Waypoints_WaypointHelper_DeleteAllWaypointsFromGroup = { 
    params ["_group"];
    private ["_waypoints", "_i"];

    _waypoints = waypoints _group;

    for [{ _i = (count _waypoints) - 1 }, { _i >= 0 }, { _i = _i - 1 }] do {
        deleteWaypoint [_group, _i]; } };