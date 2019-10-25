













cl_Engima_AmbientInfantry_Classes_Helper_constructor = { _this select 0 };



Engima_AmbientInfantry_Classes_Helper_GetAllPlayers = { 
    call BIS_fnc_listPlayers };


Engima_AmbientInfantry_Classes_Helper_GetAllPlayerPositions = { 
    private _playerPositions = [];

    {
        private _player = _x;
        private _pos = position vehicle _x;
        private _aheadPos = _pos getPos [(speed vehicle _player) * 3, getDir _player];

        _playerPositions pushBack ([[["Engima_AmbientInfantry_Classes_PlayerPosition",[]]], [_pos, _aheadPos]] call cl_Engima_AmbientInfantry_Classes_PlayerPosition_constructor);
    } forEach call Engima_AmbientInfantry_Classes_Helper_GetAllPlayers;

    _playerPositions };