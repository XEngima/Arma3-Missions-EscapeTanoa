










cl_Sqx_Markers_MarkerHelper_constructor = { _this select 0 };





Sqx_Markers_MarkerHelper_PositionInsideAnyMarker = {  params ["_position", "_markers"]; 
    scopeName "main";

    {
        if (_position inArea _x) then {
            true breakOut "main"; };
    } forEach 
    _markers;

    false };





Sqx_Markers_MarkerHelper_MarkerExists = {  params ["_markerName"]; 
    private _exists = false;

    if (((getMarkerPos _markerName) select 0) != 0 || { (getMarkerPos _markerName) select 1 != 0 }) then {
        _exists = true; };


    _exists };





Sqx_Markers_MarkerHelper_GetRandomPosInsideMarker = {  params ["_markerName"]; 
    private ["_isInside", "_px", "_py", "_mpx", 
    "_mpy", "_msx", "_msy", "_ma", "_rpx", 
    "_rpy", "_i"];

    _isInside = false;
    _i = 0;
    while { !_isInside } do {
        _mpx = (getMarkerPos _markerName) select 0;
        _mpy = (getMarkerPos _markerName) select 1;
        _msx = (getMarkerSize _markerName) select 0;
        _msy = (getMarkerSize _markerName) select 1;
        _ma = (markerDir _markerName);

        _px = _mpx - _msx + random (_msx * 2);
        _py = _mpy - _msy + random (_msy * 2);


        _rpx = ((_px - _mpx) * cos (_ma)) + ((_py - _mpy) * sin (_ma)) + _mpx;
        _rpy = (-(_px - _mpx) * sin (_ma)) + ((_py - _mpy) * cos (_ma)) + _mpy;

        if ([_rpx, _rpy, 0] inArea _markerName) then {
            _isInside = true; };


        _i = _i + 1;
        if (_i > 1000) exitWith {
            _rpx = 0;
            _rpy = 0; }; };



    [_rpx, _rpy, 0] };