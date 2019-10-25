













cl_Engima_AmbientInfantry_Classes_PlayerPosition_constructor = { params ["_class_fields", "_this"];
    params ["_position", "_aheadPosition"];

    _class_fields set [1, _position];
    _class_fields set [2, _aheadPosition]; _class_fields };


cl_Engima_AmbientInfantry_Classes_PlayerPosition_Position_PropIndex = 1;

cl_Engima_AmbientInfantry_Classes_PlayerPosition_AheadPosition_PropIndex = 2;