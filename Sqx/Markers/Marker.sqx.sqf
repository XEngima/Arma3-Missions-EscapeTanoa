















Sqx_Markers_Marker_CreateIconMarker = { 
    params [
    "_position", 
    ["_type", "hd_dot"], 
    ["_color", "ColorBlack"], 
    ["_text", ""], 
    ["_isVisible", true]];


    (([[["Sqx_Markers_Marker",[]]], [_position, "ICON", [1, 1], 0, _type, _color, "Solid", _text, 0.4, _isVisible]] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateIconMarkerLocal = { 
    params [
    "_position", 
    ["_type", "hd_dot"], 
    ["_color", "ColorBlack"], 
    ["_text", ""], 
    ["_isVisible", true]];


    (([[["Sqx_Markers_Marker",[]]], [_position, "ICON", [1, 1], 0, _type, _color, "Solid", _text, 0.4, _isVisible, "", true]] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateShapeMarker = { 
    params [
    "_position", 
    ["_shape", "RECTANGLE"], 
    ["_size", [50, 50]], 
    ["_direction", 0], 
    ["_color", "ColorBlack"], 
    ["_brush", "Solid"], 
    ["_text", ""], 
    ["_alpha", 0.4], 
    ["_isVisible", true]];


    (([[["Sqx_Markers_Marker",[]]], [_position, _shape, _size, _direction, "hd_dot", _color, _brush, _text, _alpha, _isVisible]] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateShapeMarkerLocal = { 
    params [
    "_position", 
    ["_shape", "RECTANGLE"], 
    ["_size", [50, 50]], 
    ["_direction", 0], 
    ["_color", "ColorBlack"], 
    ["_brush", "Solid"], 
    ["_text", ""], 
    ["_alpha", 0.4], 
    ["_isVisible", true]];


    (([[["Sqx_Markers_Marker",[]]], [_position, _shape, _size, _direction, "hd_dot", _color, _brush, _text, _alpha, _isVisible, "", true]] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateMarkerFromMarker = { 
    params ["_marker", ["_isVisible", true], ["_name", ""]];

    (












    ([[["Sqx_Markers_Marker",[]]], [getMarkerPos _marker, markerShape _marker, markerSize _marker, markerDir _marker, markerType _marker, markerColor _marker, markerBrush _marker, markerText _marker, markerAlpha _marker, _isVisible, _name, true]] call cl_Sqx_Markers_Marker_constructor)) };



Sqx_Markers_Marker_CreateMarkerFromMarkerLocal = { 
    params ["_marker", ["_isVisible", true], ["_name", ""]];

    (












    ([[["Sqx_Markers_Marker",[]]], [getMarkerPos _marker, markerShape _marker, markerSize _marker, markerDir _marker, markerType _marker, markerColor _marker, markerBrush _marker, markerText _marker, markerAlpha _marker, _isVisible, _name, false]] call cl_Sqx_Markers_Marker_constructor)) };



















cl_Sqx_Markers_Marker_constructor = { params ["_class_fields", "_this"]; params [
"_position", 
["_shape", "ICON"], 
["_size", [1, 1]], 
["_direction", 0], 
["_type", "hd_dot"], 
["_color", "ColorBlack"], 
["_brush", "Solid"], 
["_text", ""], 
["_alpha", 0.4], 
["_isVisible", true], 
["_name", ""], 
["_isLocal", false]]; 

    if (isNil "Sqx_Markers_Marker_CurrentId") then {
        Sqx_Markers_Marker_CurrentId = 1; };



    if (_name == "") then {
        _name = "Sqx_Markers_Marker_" + str Sqx_Markers_Marker_CurrentId;
        Sqx_Markers_Marker_CurrentId = Sqx_Markers_Marker_CurrentId + 1; };


    _class_fields set [1, _name];
    _class_fields set [2, _position];
    _class_fields set [12, _isVisible];
    _class_fields set [14, false];

    _class_fields set [3, _shape];
    _class_fields set [4, _size];
    _class_fields set [5, _direction];
    _class_fields set [6, _type];
    _class_fields set [7, _color];
    _class_fields set [8, _brush];
    _class_fields set [9, _text];
    _class_fields set [10, _alpha];
    _class_fields set [11, _isLocal];

    _class_fields set [13, objNull];

    if ((_class_fields select 12)) then {
        ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); }; _class_fields };








cl_Sqx_Markers_Marker_Name_PropIndex = 1;


cl_Sqx_Markers_Marker_Position_PropIndex = 2;


cl_Sqx_Markers_Marker_Shape_PropIndex = 3;


cl_Sqx_Markers_Marker_Size_PropIndex = 4;


cl_Sqx_Markers_Marker_Direction_PropIndex = 5;


cl_Sqx_Markers_Marker_Type_PropIndex = 6;


cl_Sqx_Markers_Marker_Color_PropIndex = 7;


cl_Sqx_Markers_Marker_Brush_PropIndex = 8;


cl_Sqx_Markers_Marker_Text_PropIndex = 9;


cl_Sqx_Markers_Marker_Alpha_PropIndex = 10;


cl_Sqx_Markers_Marker_IsLocal_PropIndex = 11;


cl_Sqx_Markers_Marker_IsVisible_PropIndex = 12;


cl_Sqx_Markers_Marker_Tag_PropIndex = 13;


cl_Sqx_Markers_Marker_IsBlinking_PropIndex = 14;






cl_Sqx_Markers_Marker_Draw = { params ["_class_fields", "_this"];
    private _name = (_class_fields select 1);

    if ((_class_fields select 11)) then {
        createMarkerLocal [_name, (_class_fields select 2)];
        _name setMarkerShapeLocal (_class_fields select 3);
        _name setMarkerSizeLocal (_class_fields select 4);
        _name setMarkerDirLocal (_class_fields select 5);
        _name setMarkerTypeLocal (_class_fields select 6);
        _name setMarkerColorLocal (_class_fields select 7);
        _name setMarkerBrushLocal (_class_fields select 8);
        _name setMarkerTextLocal (_class_fields select 9);
        _name setMarkerAlphaLocal (_class_fields select 10); } else { 


        createMarker [_name, (_class_fields select 2)];
        _name setMarkerShape (_class_fields select 3);
        _name setMarkerSize (_class_fields select 4);
        _name setMarkerDir (_class_fields select 5);
        _name setMarkerType (_class_fields select 6);
        _name setMarkerColor (_class_fields select 7);
        _name setMarkerBrush (_class_fields select 8);
        _name setMarkerText (_class_fields select 9);
        _name setMarkerAlpha (_class_fields select 10); }; };




cl_Sqx_Markers_Marker_Show = { params ["_class_fields", "_this"];
    if (!(_class_fields select 12)) then {
        _class_fields set [12, true];
        ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); }; };




cl_Sqx_Markers_Marker_Hide = { params ["_class_fields", "_this"];
    if ((_class_fields select 12)) then {
        if ((_class_fields select 11)) then {
            deleteMarkerLocal (_class_fields select 1); } else { 


            deleteMarker (_class_fields select 1); };


        _class_fields set [12, false];
        _class_fields set [14, false]; }; };





cl_Sqx_Markers_Marker_StartBlinking = { params ["_class_fields", "_this"]; params ["_interval"]; 
    if (!(_class_fields select 14)) then {
        _class_fields set [14, true];
        ([_class_fields, [_interval]] spawn cl_Sqx_Markers_Marker_DoBlink); }; };




cl_Sqx_Markers_Marker_StopBlinking = { params ["_class_fields", "_this"];
    _class_fields set [14, false];

    if ((_class_fields select 12)) then {
        ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); }; };





cl_Sqx_Markers_Marker_DoBlink = { params ["_class_fields", "_this"]; params ["_interval"]; 
    private _blinkVisible = true;

    while { (_class_fields select 14) } do {
        if (_blinkVisible) then {
            if ((_class_fields select 11)) then {
                deleteMarkerLocal (_class_fields select 1); } else { 


                deleteMarker (_class_fields select 1); }; } else { 



            ([_class_fields, []] call cl_Sqx_Markers_Marker_Draw); };


        _blinkVisible = !_blinkVisible;
        sleep _interval; }; };









cl_Sqx_Markers_Marker_SetPosition = { params ["_class_fields", "_this"]; params ["_position"]; 
    if (!(_position isEqualTo (_class_fields select 2))) then {
        _class_fields set [2, _position];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerPosLocal _position; } else { 


                ((_class_fields select 1)) setMarkerPos _position; }; }; }; };







cl_Sqx_Markers_Marker_SetShape = { params ["_class_fields", "_this"]; params ["_shape"]; 
    if (!(_shape isEqualTo (_class_fields select 3))) then {
        _class_fields set [3, _shape];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerShapeLocal _shape; } else { 


                ((_class_fields select 1)) setMarkerShape _shape; }; }; }; };







cl_Sqx_Markers_Marker_SetSize = { params ["_class_fields", "_this"]; params ["_size"]; 
    if (!(_size isEqualTo (_class_fields select 4))) then {
        _class_fields set [4, _size];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerSizeLocal _size; } else { 


                ((_class_fields select 1)) setMarkerSize _size; }; }; }; };







cl_Sqx_Markers_Marker_SetDirection = { params ["_class_fields", "_this"]; params ["_direction"]; 
    if (!(_direction isEqualTo (_class_fields select 5))) then {
        _class_fields set [5, _direction];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerDirLocal _direction; } else { 


                ((_class_fields select 1)) setMarkerDir _direction; }; }; }; };








cl_Sqx_Markers_Marker_SetType = { params ["_class_fields", "_this"]; params ["_type"]; 
    if (!(_type isEqualTo (_class_fields select 6))) then {
        _class_fields set [6, _type];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerTypeLocal _type; } else { 


                ((_class_fields select 1)) setMarkerType _type; }; }; }; };








cl_Sqx_Markers_Marker_SetColor = { params ["_class_fields", "_this"]; params ["_color"]; 
    if (!(_color isEqualTo (_class_fields select 7))) then {
        _class_fields set [7, _color];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerColorLocal _color; } else { 


                ((_class_fields select 1)) setMarkerColor _color; }; }; }; };








cl_Sqx_Markers_Marker_SetBrush = { params ["_class_fields", "_this"]; params ["_brush"]; 
    if (!(_brush isEqualTo (_class_fields select 8))) then {
        _class_fields set [8, _brush];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerBrushLocal _brush; } else { 


                ((_class_fields select 1)) setMarkerBrush _brush; }; }; }; };








cl_Sqx_Markers_Marker_SetText = { params ["_class_fields", "_this"]; params ["_text"]; 
    if (!(_text isEqualTo (_class_fields select 9))) then {
        _class_fields set [9, _text];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerTextLocal _text; } else { 


                ((_class_fields select 1)) setMarkerText _text; }; }; }; };







cl_Sqx_Markers_Marker_SetAlpha = { params ["_class_fields", "_this"]; params ["_alpha"]; 
    if (!(_alpha isEqualTo (_class_fields select 10))) then {
        _class_fields set [10, _alpha];

        if ((_class_fields select 12)) then {
            if ((_class_fields select 11)) then {
                ((_class_fields select 1)) setMarkerAlphaLocal _alpha; } else { 


                ((_class_fields select 1)) setMarkerAlpha _alpha; }; }; }; };