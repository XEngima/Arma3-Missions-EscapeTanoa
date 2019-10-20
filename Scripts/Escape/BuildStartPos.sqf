private ["_centerPos", "_rotateDir"];
private ["_object", "_pos", "_dir"];

_centerPos = _this select 0;
_rotateDir = _this select 1;

_dir = _rotateDir;

_pos = [(_centerPos select 0) - 4, (_centerPos select 1) - 6, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 0, (_centerPos select 1) - 6, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) + 4, (_centerPos select 1) - 6, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 8, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

_dir = 270 + _rotateDir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 4, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) - 0, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) + 6, (_centerPos select 1) + 4, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) + 8, (_centerPos select 1) + 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

_dir = 180 + _rotateDir;

_pos = [(_centerPos select 0) - 4, (_centerPos select 1) + 6, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 0, (_centerPos select 1) + 6, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;


// Bar Gate
_pos = [(_centerPos select 0) + 2.4, (_centerPos select 1) + 6, 0];
_object = createVehicle ["Land_GameProofFence_01_l_pole_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir (_dir + 180);
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setPos [(getPos _object) select 0, (getPos _object) select 1, 0.05];

_pos = [(_centerPos select 0) + 5.2, (_centerPos select 1) + 5.9, 100];
_object = createVehicle ["Land_PipeFence_03_m_gate_r_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir (_dir);
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setPos [(getPos _object) select 0, (getPos _object) select 1, 0.05];

_pos = [(_centerPos select 0) + 5.6, (_centerPos select 1) + 6, 0];
_object = createVehicle ["Land_GameProofFence_01_l_pole_F", _pos, [], 0, "CAN_COLLIDE"];
_object setDir (_dir + 180);
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setPos [(getPos _object) select 0, (getPos _object) select 1, 0.05];

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) - 4, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) - 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 6, (_centerPos select 1) + 4, 0];
_object = "Land_TinWall_02_l_4m_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

/*
_pos = [(_centerPos select 0) - 8, (_centerPos select 1) + 6, 0];
_object = "Fence_corrugated_plate" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;
*/

// Tunnor

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
_object = "MetalBarrel_burning_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

_pos = [(_centerPos select 0) - 5, (_centerPos select 1) + 7, 0];
_object = "MetalBarrel_burning_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;

// Flag

_dir = 90 + _rotateDir;

_pos = [(_centerPos select 0) + 7, (_centerPos select 1) + 5, 0];
_object = "Flag_CSAT_F" createVehicle _pos;
_object setPos ([_centerPos, _pos, _rotateDir] call drn_fnc_CL_RotatePosition);
_object setDir _dir;


