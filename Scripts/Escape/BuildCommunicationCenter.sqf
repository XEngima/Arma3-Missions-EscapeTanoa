private ["_centerPos", "_rotateDir", "_staticWeaponClasses", "_parkedVehicleClasses"];
private ["_pos", "_dir", "_posX", "_posY", "_sectionDir", "_guns", "_gun", "_vehicle", "_powerGenerator"];
private ["_fnc_CreateObject"];

_centerPos = _this select 0;
_rotateDir = _this select 1;
if (count _this > 2) then { _staticWeaponClasses = _this select 2; } else { _staticWeaponClasses = []; };
if (count _this > 3) then { _parkedVehicleClasses = _this select 3; } else { _parkedVehicleClasses = []; };

_fnc_CreateObject = {
    private ["_className", "_relativePos", "_relativeDir", "_centerPos", "_rotateDir"];
    private ["_object", "_realPos", "_realDir"];
    
    _className = _this select 0;
    _relativePos = _this select 1;
    _relativeDir = _this select 2;
    _centerPos = _this select 3;
    _rotateDir = _this select 4;
    
    _realPos = ([_centerPos, [(_centerPos select 0) + (_relativePos select 0), (_centerPos select 1) + (_relativePos select 1)], _rotateDir] call drn_fnc_CL_RotatePosition);
    _realDir = _relativeDir + _rotateDir;
    _object = createVehicle [_className, [_realPos select 0, _realPos select 1, 1000], [], 0, "CAN_COLLIDE"];
    _object setDir _realDir;
    _object setPos [_realPos select 0, _realPos select 1, 0.05];
    
    _object
};

// Bagfence

/*
// (North western corner)
_pos = [-18, 16.5];
_dir = 90;
["Land_fort_bagfence_corner", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
*/

// (Western wall)
_posX = -19.2;
_sectionDir = 270;

_pos = [_posX, 14];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -4];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -1];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 2];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 5];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 8];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 11];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -7];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -10];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (Southern wall)
_posY = -11.2;

_pos = [-18, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-15, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-12, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-9, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-6, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-3, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [0, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [3, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [6, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [9, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [12, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [15, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [18, _posY];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (Eastern wall)
_posX = 19.2;
_sectionDir = 90;

_pos = [_posX, -10];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -7];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -4];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, -1];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 2];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 5];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 8];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 11];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [_posX, 14];
_dir = _sectionDir;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// (North eastern wall)
_pos = [18, 15.15];
_dir = 180;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Barracks

_pos = [-13, -8];
_dir = 90;
["B_Slingload_01_Repair_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Power Generator
_pos = [0, -7];
_dir = 0;
_powerGenerator = ["Land_PowerGenerator_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
drn_arr_HackableComCenterItems pushBack _powerGenerator;

// Antennas

_pos = [-16, 10];
_dir = random 360;
["OmniDirectionalAntenna_01_sand_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-15, 6];
_dir = random 360;
["SatelliteAntenna_01_Sand_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Toilets

_pos = [-15, -4];
_dir = 270;
["Land_FieldToilet_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [-15, -2];
_dir = 270;
["Land_FieldToilet_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Fuel Tank
_pos = [7, -7];
_dir = 0;
["B_Slingload_01_Fuel_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Field Hospital
_pos = [3, -7];
_dir = 0;
["B_Slingload_01_Medevac_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

// Flag
_pos = [0, 10];
_dir = 0;
[drn_var_Escape_ComCenterFlag, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

if (count _staticWeaponClasses > 0) then {
    // Statics
    _pos = [-17, 13.5];
    _dir = 0;
    
    _gun = _staticWeaponClasses select floor random count _staticWeaponClasses;
    [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
    
    _pos = [17, -9.5];
    _dir = 135;
    
    //_guns = ["DSHkM_Mini_TriPod", "AGS_Ins", "DSHKM_Ins"];
    _guns = ["O_HMG_01_high_F"];
    _gun = _guns select floor random count _guns;
    [_gun, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
};

if (count _parkedVehicleClasses > 0) then {
    // Cars
    _pos = [12, 10];
    _dir = 270;
    
    _vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
    [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
    
    _pos = [12, 6.5];
    _dir = 270;
    
    _vehicle = _parkedVehicleClasses select floor random count _parkedVehicleClasses;
    [_vehicle, _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;
};

sleep 2;

// Camo Nets
_pos = [-13, -6];
_dir = 270;
["CamoNet_OPFOR_big_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [5, -9];
_dir = 180;
["CamoNet_OPFOR_big_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

_pos = [12, 8];
_dir = 90;
["CamoNet_OPFOR_big_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;

//(North western wall)
_pos = [-18, 15.15];
_dir = 0;
["Land_BagFence_Long_F", _pos, _dir, _centerPos, _rotateDir] call _fnc_CreateObject;




