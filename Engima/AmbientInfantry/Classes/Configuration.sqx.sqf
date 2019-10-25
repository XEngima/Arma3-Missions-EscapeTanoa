













cl_Engima_AmbientInfantry_Classes_Configuration_constructor = { params ["_class_fields", "_this"];
    _class_fields set [1, east];
    _class_fields set [2, ["O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_SL_F", "O_G_Soldier_TL_F", "O_G_Soldier_AR_F", "O_G_medic_F", "O_G_engineer_F", "O_G_Soldier_exp_F", "O_G_Soldier_GL_F", "O_G_Soldier_M_F", "O_G_Soldier_LAT_F", "O_G_Soldier_A_F", "O_G_officer_F"]];
    _class_fields set [3, 10];
    _class_fields set [4, 2];
    _class_fields set [5, 4];
    _class_fields set [6, 800];
    _class_fields set [7, 1200];
    _class_fields set [8, 100];
    _class_fields set [9, 0.4];
    _class_fields set [10, 0.6];
    _class_fields set [11, []];
    _class_fields set [12, { true }];
    _class_fields set [13, { }];
    _class_fields set [14, { }];
    _class_fields set [15, { false }];
    _class_fields set [16, { }];
    _class_fields set [17, false]; _class_fields };






Engima_AmbientInfantry_Classes_Configuration_GetParamValue = { 
    params ["_params", "_key", ["_defaultValue", 0]];

    private _value = _defaultValue;

    {
        if (_x select 0 == _key) then {
            _value = _x select 1; };
    } forEach 
    (_params);

    _value };



cl_Engima_AmbientInfantry_Classes_Configuration_Side_PropIndex = 1;



cl_Engima_AmbientInfantry_Classes_Configuration_UnitClasses_PropIndex = 2;



cl_Engima_AmbientInfantry_Classes_Configuration_MaxGroupsCount_PropIndex = 3;



cl_Engima_AmbientInfantry_Classes_Configuration_MinUnitsInEachGroup_PropIndex = 4;



cl_Engima_AmbientInfantry_Classes_Configuration_MaxUnitsInEachGroup_PropIndex = 5;



cl_Engima_AmbientInfantry_Classes_Configuration_MinSpawnDistance_PropIndex = 6;




cl_Engima_AmbientInfantry_Classes_Configuration_MaxSpawnDistance_PropIndex = 7;



cl_Engima_AmbientInfantry_Classes_Configuration_MinSpawnDistanceOnStart_PropIndex = 8;



cl_Engima_AmbientInfantry_Classes_Configuration_MinSkill_PropIndex = 9;



cl_Engima_AmbientInfantry_Classes_Configuration_MaxSkill_PropIndex = 10;


cl_Engima_AmbientInfantry_Classes_Configuration_BlacklistMarkers_PropIndex = 11;






cl_Engima_AmbientInfantry_Classes_Configuration_OnGroupCreating_PropIndex = 12;




cl_Engima_AmbientInfantry_Classes_Configuration_OnGroupCreated_PropIndex = 13;





cl_Engima_AmbientInfantry_Classes_Configuration_OnGroupRemoving_PropIndex = 14;







cl_Engima_AmbientInfantry_Classes_Configuration_OnCheckReleaseGroup_PropIndex = 15;




cl_Engima_AmbientInfantry_Classes_Configuration_OnGroupReleased_PropIndex = 16;


cl_Engima_AmbientInfantry_Classes_Configuration_InDebugMode_PropIndex = 17;