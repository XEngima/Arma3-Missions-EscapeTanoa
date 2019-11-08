/*
 * Description: This file contains vheicle types and unit types for most units spawned in the mission.
 * "Random array" (used below) means that array will be used to spawn units, and that chance is 1/n that each element will be spawned on each spawn. The array can contain 
 * many elements of the same type, so the example array ["Offroad_DSHKM_INS", "Pickup_PK_INS", "Pickup_PK_INS"] will spawn an Offroad with 1/3 probability, and a 
 * Pickup with 2/3 probability.
 *
 * Except for the classes specified in this file, classes are specified in the following files: CreateSearchChopper.sqf, EscapeSurprises (RUSSIANSEARCHCHOPPER) 
 * and RunExtraction.sqf, all in folder Scripts\Escape\.
 */

private ["_enemyFrequency"];

_enemyFrequency = _this select 0;

// Random array. Start position guard types.

drn_arr_Escape_StartPositionGuardTypes = ["I_Soldier_A_F", "I_support_AMG_F", "I_support_AMort_F", "I_medic_F", "I_engineer_F", "I_Soldier_exp_F", "I_Soldier_GL_F", "I_support_GMG_F", "I_support_MG_F", "I_support_Mort_F", "I_officer_F", "I_Soldier_repair_F", "I_Soldier_SL_F", "I_Soldier_TL_F", /* Riflemen */ "I_soldier_F", "I_Soldier_lite_F", /* Riflemen */ "I_soldier_F", "I_Soldier_lite_F", /* Riflemen */ "I_soldier_F", "I_Soldier_lite_F"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
drn_var_Escape_InnerFenceGuardSecondaryWeapon = "hgun_Pistol_heavy_02_F";
drn_var_Escape_InnerFenceGuardSecondaryWeaponMagazine = "6Rnd_45ACP_Cylinder";

// The type of unit that hijacts fastest
drn_var_Escape_EngineerType = "B_engineer_F";
publicVariable "drn_var_Escape_EngineerType";

// Flags
drn_var_Escape_PrisonFlagType = "Flag_AAF_F";
drn_var_Escape_AmmoDepotFlag = "Flag_AAF_F";
drn_var_Escape_ComCenterFlag = "Flag_CSAT_F";

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Truck_02_transport_F", "C_Truck_02_box_F", "C_Truck_02_fuel_F"];

drn_arr_Escape_WalkingCivilianClasses = ["C_man_p_beggar_F", "C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_3_F", "C_man_polo_4_F", "C_man_polo_5_F", "C_man_polo_6_F", "C_man_shorts_1_F", "C_man_1_1_F", "C_man_1_2_F", "C_man_1_3_F", "C_man_p_fugitive_F", "C_man_p_shorts_1_F", "C_man_hunter_1_F", "C_man_shorts_2_F", "C_man_shorts_3_F", "C_man_shorts_4_F", "C_man_w_worker_F"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_Truck_03_device_F", // Trucks
        	"O_Truck_03_ammo_F",
        	"O_Truck_03_medical_F",
        	"O_Truck_03_repair_F",
        	"O_Truck_03_transport_F",
        	"O_Truck_03_covered_F",
        	"I_Truck_02_ammo_F",
        	"I_Truck_02_fuel_F",
        	"I_Truck_02_medical_F",
        	"I_Truck_02_box_F",
        	"I_Truck_02_transport_F",
        	"I_Truck_02_covered_F",
        	"O_Truck_03_device_F", // Trucks
        	"O_Truck_03_ammo_F",
        	"O_Truck_03_medical_F",
        	"O_Truck_03_repair_F",
        	"O_Truck_03_transport_F",
        	"O_Truck_03_covered_F",
        	"I_Truck_02_ammo_F",
        	"I_Truck_02_fuel_F",
        	"I_Truck_02_medical_F",
        	"I_Truck_02_box_F",
        	"I_Truck_02_transport_F",
        	"I_Truck_02_covered_F",
        	"O_MRAP_02_gmg_F", // Cars with weapons
        	"O_MRAP_02_hmg_F",
        	"I_MRAP_03_gmg_F",
        	"I_MRAP_03_hmg_F",
        	"O_APC_Tracked_02_cannon_F", // Heavy armor
        	"O_APC_Wheeled_02_rcws_v2_F",
        	"O_MBT_02_cannon_F",
        	"O_MBT_02_arty_F",
        	"I_APC_Wheeled_03_cannon_F",
        	"I_APC_tracked_03_cannon_F",
        	"I_MBT_03_cannon_F",
        	"I_Truck_02_MRL_F"
        ];
    };
    case 2: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_Truck_03_device_F", // Trucks
        	"O_Truck_03_ammo_F",
        	"O_Truck_03_medical_F",
        	"O_Truck_03_repair_F",
        	"O_Truck_03_transport_F",
        	"O_Truck_03_covered_F",
        	"I_Truck_02_ammo_F",
        	"I_Truck_02_fuel_F",
        	"I_Truck_02_medical_F",
        	"I_Truck_02_box_F",
        	"I_Truck_02_transport_F",
        	"I_Truck_02_covered_F",
        	"O_Truck_03_device_F", // Trucks
        	"O_Truck_03_ammo_F",
        	"O_Truck_03_medical_F",
        	"O_Truck_03_repair_F",
        	"O_Truck_03_transport_F",
        	"O_Truck_03_covered_F",
        	"I_Truck_02_ammo_F",
        	"I_Truck_02_fuel_F",
        	"I_Truck_02_medical_F",
        	"I_Truck_02_box_F",
        	"I_Truck_02_transport_F",
        	"I_Truck_02_covered_F",
        	"O_MRAP_02_gmg_F", // Cars with weapons
        	"O_MRAP_02_hmg_F",
        	"I_MRAP_03_gmg_F",
        	"I_MRAP_03_hmg_F",
        	"O_MRAP_02_gmg_F", // Cars with weapons
        	"O_MRAP_02_hmg_F",
        	"I_MRAP_03_gmg_F",
        	"I_MRAP_03_hmg_F",
        	"O_APC_Tracked_02_cannon_F", // Heavy armor
        	"O_APC_Wheeled_02_rcws_v2_F",
        	"O_MBT_02_cannon_F",
        	"O_MBT_02_arty_F",
        	"I_APC_Wheeled_03_cannon_F",
        	"I_APC_tracked_03_cannon_F",
        	"I_MBT_03_cannon_F",
        	"I_Truck_02_MRL_F"
        ];
    };
    default {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_MRAP_02_F", // Unarmed
        	"O_Quadbike_01_F",
        	"I_Quadbike_01_F",
        	"I_MRAP_03_F",
        	"O_Truck_03_device_F", // Trucks
        	"O_Truck_03_ammo_F",
        	"O_Truck_03_medical_F",
        	"O_Truck_03_repair_F",
        	"O_Truck_03_transport_F",
        	"O_Truck_03_covered_F",
        	"I_Truck_02_ammo_F",
        	"I_Truck_02_fuel_F",
        	"I_Truck_02_medical_F",
        	"I_Truck_02_box_F",
        	"I_Truck_02_transport_F",
        	"I_Truck_02_covered_F",
        	"O_MRAP_02_gmg_F", // Cars with weapons
        	"O_MRAP_02_hmg_F",
        	"I_MRAP_03_gmg_F",
        	"I_MRAP_03_hmg_F",
        	"O_APC_Tracked_02_cannon_F", // Heavy armor
        	"O_APC_Wheeled_02_rcws_v2_F",
        	"O_MBT_02_cannon_F",
        	"O_MBT_02_arty_F",
        	"I_APC_Wheeled_03_cannon_F",
        	"I_APC_tracked_03_cannon_F",
        	"I_MBT_03_cannon_F",
        	"I_Truck_02_MRL_F"
        ];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.

//drn_arr_Escape_InfantryTypes = ["O_Soldier_LAT_F", "O_Soldier_AR_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F"];
drn_arr_Escape_InfantryTypesBanditsGuer = ["I_Soldier_A_F", "I_support_AMG_F", "I_support_AMort_F", "I_medic_F", "I_engineer_F", "I_Soldier_exp_F", "I_Soldier_GL_F", "I_support_GMG_F", "I_support_MG_F", "I_support_Mort_F", "I_officer_F", "I_Soldier_repair_F", "I_Soldier_SL_F", "I_Soldier_TL_F", /* Advanced */ "I_Soldier_LAT_F", "I_Soldier_M_F ", /* Riflemen */ "I_soldier_F", "I_Soldier_lite_F", /* Riflemen */ "I_soldier_F", "I_Soldier_lite_F", /* Riflemen */ "I_soldier_F", "I_Soldier_lite_F"];
drn_arr_Escape_InfantryTypesParamilitaryGuer = drn_arr_Escape_InfantryTypesBanditsGuer;
drn_arr_Escape_InfantryTypesCsatPacificEast = ["O_Soldier_A_F", "O_Soldier_AAR_F", "O_support_AMG_F", "O_support_AMort_F", "O_engineer_F", "O_soldier_exp_F", "O_Soldier_GL_F", "O_support_GMG_F", "O_support_MG_F", "O_support_Mort_F", "O_soldier_M_F", "O_officer_F", "O_soldier_repair_F", "O_Soldier_LAT_F", "O_Soldier_SL_F", "O_Soldier_TL_F", /* Riflemen */ "O_Soldier_F", "O_Soldier_lite_F", /* Riflemen */ "O_Soldier_F", "O_Soldier_lite_F", /* Riflemen */ "O_Soldier_F", "O_Soldier_lite_F"];
drn_arr_Escape_InfantryTypesCsatPacificViperEast = drn_arr_Escape_InfantryTypesCsatPacificEast;

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = ["I_MRAP_03_gmg_F", "I_MRAP_03_F", "I_MRAP_03_hmg_F", "I_HMG_01_high_F", "I_GMG_01_high_F", "I_MBT_03_cannon_F", "I_GMG_01_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
drn_arr_Escape_ReinforcementTruck_vehicleClasses = ["Ural_INS", "UralOpen_INS"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_ReinforcementTruck_vehicleClasses above.
drn_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [14, 14];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["I_APC_tracked_03_cannon_F"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = ["O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = ["O_APC_Tracked_02_cannon_F", "O_APC_Wheeled_02_rcws_v2_F", "O_MBT_02_cannon_F"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
drn_arr_ComCenStaticWeapons = ["O_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = ["O_MRAP_02_F", "O_Quadbike_01_F", "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
drn_arr_Escape_EnemyCivilianCarTypes = ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the following types:
drn_arr_Escape_AmmoDepot_StaticWeaponClasses = ["O_HMG_01_high_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = [/* Unarmed */ "O_MRAP_02_F", "O_Quadbike_01_F", /* Unarmed */ "O_MRAP_02_F", "O_Quadbike_01_F", /* Unarmed */ "O_MRAP_02_F", "O_Quadbike_01_F", /* Armed */ "O_MRAP_02_gmg_F", "O_MRAP_02_hmg_F"];

// The following arrays define weapons and ammo contained at the ammo depots

drn_Escape_AmmoDepot_LauncherBoxClassName = "Box_East_WpsLaunch_F";

drn_arr_Escape_AmmoDepot_OtherWeaponBoxesClassNames = [
	"Box_East_Ammo_F",
	"Box_East_Wps_F",
	"Box_East_AmmoOrd_F",
	"Box_East_Grenades_F",
	"Box_East_WpsSpecial_F"
];

// Index 0: Weapon classname.
// Index 1: Weapon's probability of presence (in percent, 0-100).
// Index 2: If weapon exists, crate contains at minimum this number of weapons of current class.
// Index 3: If weapon exists, crate contains at maximum this number of weapons of current class.
// Index 4: Array of magazine classnames. Magazines of these types are present if weapon exists.
// Index 5: Number of magazines per weapon that exists.

/*
// Weapons and ammo in the basic weapons box
drn_arr_AmmoDepotBasicWeapons = [];
// Insurgent weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_47_M", 40, 8, 12, ["30Rnd_762x39_AK47"], 14]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_47_S", 40, 8, 12, ["30Rnd_762x39_AK47"], 12]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_74", 40, 8, 12, ["30Rnd_545x39_AK"], 12]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_74_GL", 35, 2, 4, ["30Rnd_545x39_AK", "1Rnd_SMOKE_GP25"], 15]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_74_GL", 35, 2, 4, ["30Rnd_545x39_AK", "1Rnd_HE_GP25"], 20]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AKS_74_U", 25, 3, 6, ["30Rnd_545x39_AK"], 12]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["PK", 30, 2, 3, ["100Rnd_762x54_PK"], 15]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["Makarov", 85, 8, 12, ["8Rnd_9x18_Makarov"], 10]];

// Russian weapons
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_107_Kobra", 20, 1, 3, ["30Rnd_545x39_AK"], 18]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["AK_107_GL_Kobra", 15, 1, 3, ["30Rnd_545x39_AK", "1Rnd_SMOKE_GP25", "1Rnd_HE_GP25"], 15]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["bizon", 15, 1, 3, ["64Rnd_9x19_Bizon"], 15]];
drn_arr_AmmoDepotBasicWeapons set [count drn_arr_AmmoDepotBasicWeapons, ["Saiga12K", 15, 1, 2, ["8Rnd_B_Saiga12_74Slug", "8Rnd_B_Saiga12_Pellets"], 20]];

// Weapons and ammo in the special weapons box
drn_arr_AmmoDepotSpecialWeapons = [];
// Insurgent weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["SVD", 20, 1, 2, ["10Rnd_762x54_SVD"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["AKS_74_UN_Kobra", 20, 1, 2, ["30Rnd_545x39_AKSD"], 20]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["G36C", 20, 1, 2, ["30Rnd_556x45_G36", "30Rnd_556x45_Stanag"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["Huntingrifle", 20, 1, 2, ["5x_22_LR_17_HMR"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["RPK_74", 20, 1, 1, ["75Rnd_545x39_RPK"], 18]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["RPK_74", 20, 1, 1, ["30Rnd_545x39_AK"], 18]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["AKS_74_PSO", 20, 1, 3, ["30Rnd_545x39_AK"], 14]];

// Russian weapons
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["AK_107_PSO", 15, 1, 1, ["30Rnd_545x39_AK"], 20]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["AK_107_GL_PSO", 10, 1, 1, ["30Rnd_545x39_AK", "1Rnd_SMOKE_GP25", "1Rnd_HE_GP25"], 12]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["Bizon_Silenced", 15, 2, 5, ["64Rnd_9x19_SD_Bizon"], 8]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["Pecheneg", 10, 1, 1, ["100Rnd_762x54_PK"], 12]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["ksvk", 10, 1, 1, ["5Rnd_127x108_KSVK"], 15]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["VSS_Vintorez", 10, 1, 1, ["10Rnd_9x39_SP5_VSS"], 12]];
drn_arr_AmmoDepotSpecialWeapons set [count drn_arr_AmmoDepotSpecialWeapons, ["MakarovSD", 20, 2, 5, ["8Rnd_9x18_MakarovSD"], 10]];

// Weapons and ammo in the launchers box
drn_arr_AmmoDepotLaunchers = [];
// Insurgent weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["RPG7V", 100, 3, 5, ["PG7VL"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["RPG7V", 25, 1, 2, ["PG7VR"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Strela", 100, 1, 1, ["Strela"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Strela", 75, 1, 2, ["Strela"], 2]];

// Russian weapons
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["RPG18", 25, 1, 2, ["RPG18"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["MetisLauncher", 15, 1, 1, ["AT13"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Igla", 35, 1, 2, ["Igla"], 3]];

// Some stolen western weapons can sometimes appear
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Javelin", 5, 2, 2, ["Javelin"], 2]];
drn_arr_AmmoDepotLaunchers set [count drn_arr_AmmoDepotLaunchers, ["Stinger", 5, 2, 2, ["Stinger"], 2]];

// Weapons and ammo in the ordnance box
drn_arr_AmmoDepotOrdnance = [];
// General weapons
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Put", 50, 1, 2, ["Mine"], 5]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Put", 35, 1, 2, ["MineE"], 6]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 85, 1, 2, ["HandGrenade_East"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Put", 50, 1, 2, ["PipeBomb"], 2]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 75, 1, 2, ["SmokeShell"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellYellow"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellRed"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellGreen"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellPurple"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellBlue"], 8]];
drn_arr_AmmoDepotOrdnance set [count drn_arr_AmmoDepotOrdnance, ["Throw", 15, 1, 2, ["SmokeShellOrange"], 8]];

// Weapons and ammo in the vehicle box (the big one)
// Some high volumes (mostly for immersion)
drn_arr_AmmoDepotVehicle = [];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Put", 30, 1, 1, ["Mine"], 100]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Throw", 30, 1, 2, ["HandGrenade_East"], 120]];
drn_arr_AmmoDepotVehicle set [count drn_arr_AmmoDepotVehicle, ["Put", 30, 1, 2, ["PipeBomb"], 75]];

// Weapons that may show up in civilian cars

// Index 0: Weapon classname.
// Index 1: Magazine classname.
// Index 2: Number of magazines.

drn_arr_CivilianCarWeapons = [];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AK_74", "30Rnd_545x39_AK", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AK_107_GL_PSO", "30Rnd_545x39_AK", 11]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["PK", "100Rnd_762x54_PK", 9]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Makarov", "8Rnd_9x18_Makarov", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["bizon", "64Rnd_9x19_Bizon", 6]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["SVD", "10Rnd_762x54_SVD", 7]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["AKS_74_PSO", "30Rnd_545x39_AK", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Huntingrifle", "5x_22_LR_17_HMR", 8]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Bizon_Silenced", "64Rnd_9x19_SD_Bizon", 5]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["MakarovSD", "8Rnd_9x18_MakarovSD", 12]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["RPG7V", "PG7V", 1]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["RPG18", "RPG18", 1]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Igla", "Igla", 1]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Put", "PipeBomb", 2]];
drn_arr_CivilianCarWeapons set [count drn_arr_CivilianCarWeapons, ["Throw", "HandGrenade_East", 5]];
*/
