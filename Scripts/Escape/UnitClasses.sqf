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


// Arma 3 FIA infantry:
// [/*simple:*/ "O_G_Soldier_F", "O_G_Soldier_lite_F", "O_G_Soldier_A_F", "O_G_medic_F", "O_G_Soldier_GL_F", "O_G_Soldier_SL_F", "O_G_Soldier_TL_F", /*backpacks:*/ "O_G_engineer_F", "O_G_Soldier_exp_F", /*advanced:*/ "O_G_Soldier_M_F", "O_G_officer_F", "O_G_Soldier_LAT_F", "O_G_Soldier_LAT2_F", "O_G_Sharpshooter_F"];

// Arma 3 
// [simple: "I_C_Soldier_Para_1_F", "I_C_Soldier_Para_1_F", "I_C_Soldier_Para_1_F", "I_C_Soldier_Para_1_F", "I_C_Soldier_Para_1_F", "I_C_Soldier_Para_1_F", backbacks: "I_C_Soldier_Para_8_F" advanced, "I_C_Soldier_Para_5_F"]

drn_arr_Escape_StartPositionGuardTypes = ["I_C_Soldier_Para_1_F", "I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_6_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_8_F"];

// Inner fence guard's secondary weapon (and corresponding magazine type).
drn_var_Escape_InnerFenceGuardSecondaryWeapon = "hgun_Pistol_heavy_02_F";
drn_var_Escape_InnerFenceGuardSecondaryWeaponMagazine = "6Rnd_45ACP_Cylinder";

// The type of unit that hijacts fastest
drn_var_Escape_EngineerType = "B_CTRG_Soldier_Exp_tna_F";

// Flags
drn_var_Escape_PrisonFlagType = "Flag_Syndikat_F";
drn_var_Escape_AmmoDepotFlag = "Flag_Syndikat_F";
drn_var_Escape_ComCenterFlag = "Flag_CSAT_F";

// Random array. Civilian vehicle classes for ambient traffic. (Can also be set to a faction name).
drn_arr_Escape_MilitaryTraffic_CivilianVehicleClasses = ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F"];

drn_arr_Escape_WalkingCivilianClasses = ["C_Man_casual_1_F_tanoan", "C_Man_casual_2_F_tanoan", "C_Man_casual_3_F_tanoan", "C_Man_casual_4_F_tanoan", "C_Man_casual_5_F_tanoan", "C_Man_casual_6_F_tanoan", "C_Man_casual_1_F_tanoan", "C_Man_casual_2_F_tanoan", "C_Man_casual_3_F_tanoan", "C_Man_casual_4_F_tanoan", "C_Man_casual_5_F_tanoan", "C_Man_casual_6_F_tanoan", "C_man_sport_1_F_tanoan", "C_man_sport_3_F_tanoan"];

// Random arrays. Enemy vehicle classes for ambient traffic. (Can also be set to a faction name).
// Variable _enemyFrequency applies to server parameter, and can be one of the values 1 (Few), 2 (Some) or 3 (A lot).
switch (_enemyFrequency) do {
    case 1: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
        	"O_T_MRAP_02_ghex_F", // Unarmed
        	"O_T_Quadbike_01_ghex_F",
        	"O_T_LSV_02_unarmed_F",
        	"I_C_Van_01_transport_F",
        	"I_C_Offroad_02_unarmed_F",
        	"O_T_Truck_03_device_ghex_F", // Trucks
        	"O_T_Truck_03_ammo_ghex_F",
        	"O_T_Truck_03_fuel_ghex_F",
        	"O_T_Truck_03_medical_ghex_F",
        	"O_T_Truck_03_repair_ghex_F",
        	"O_T_Truck_03_transport_ghex_F",
        	"O_T_Truck_03_covered_ghex_F",
        	"O_T_Truck_02_Ammo_F",
        	"O_T_Truck_02_fuel_F",
        	"O_T_Truck_02_Medical_F",
        	"O_T_Truck_02_Box_F",
        	"O_T_Truck_02_transport_F",
        	"O_T_Truck_02_F",
        	"O_T_MRAP_02_gmg_ghex_F", // Cars with weapons
        	"O_T_MRAP_02_hmg_ghex_F",
        	"O_T_LSV_02_AT_F",
        	"O_T_LSV_02_armed_F",
        	"I_C_Offroad_02_LMG_F",
        	"I_C_Offroad_02_AT_F",
        	"O_T_APC_Tracked_02_AA_ghex_F", // Heavy armor
        	"O_T_APC_Tracked_02_cannon_ghex_F",
        	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
        	"O_T_MBT_02_arty_ghex_F",
        	"O_T_MBT_02_cannon_ghex_F"
        ];
    };
    case 2: {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
        	"O_T_MRAP_02_ghex_F", // Unarmed
        	"O_T_Quadbike_01_ghex_F",
        	"O_T_LSV_02_unarmed_F",
        	"I_C_Van_01_transport_F",
        	"I_C_Offroad_02_unarmed_F",
        	"O_T_Truck_03_device_ghex_F", // Trucks
        	"O_T_Truck_03_ammo_ghex_F",
        	"O_T_Truck_03_fuel_ghex_F",
        	"O_T_Truck_03_medical_ghex_F",
        	"O_T_Truck_03_repair_ghex_F",
        	"O_T_Truck_03_transport_ghex_F",
        	"O_T_Truck_03_covered_ghex_F",
        	"O_T_Truck_02_Ammo_F",
        	"O_T_Truck_02_fuel_F",
        	"O_T_Truck_02_Medical_F",
        	"O_T_Truck_02_Box_F",
        	"O_T_Truck_02_transport_F",
        	"O_T_Truck_02_F",
        	"O_T_MRAP_02_gmg_ghex_F", // Cars with weapons
        	"O_T_MRAP_02_hmg_ghex_F",
        	"O_T_LSV_02_AT_F",
        	"O_T_LSV_02_armed_F",
        	"I_C_Offroad_02_LMG_F",
        	"I_C_Offroad_02_AT_F",
        	"O_T_MRAP_02_gmg_ghex_F", // Cars with weapons
        	"O_T_MRAP_02_hmg_ghex_F",
        	"O_T_LSV_02_AT_F",
        	"O_T_LSV_02_armed_F",
        	"I_C_Offroad_02_LMG_F",
        	"I_C_Offroad_02_AT_F",
        	"O_T_APC_Tracked_02_AA_ghex_F", // Heavy armor
        	"O_T_APC_Tracked_02_cannon_ghex_F",
        	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
        	"O_T_MBT_02_arty_ghex_F",
        	"O_T_MBT_02_cannon_ghex_F"
        ];
    };
    default {
        drn_arr_Escape_MilitaryTraffic_EnemyVehicleClasses = [
        	"O_T_MRAP_02_ghex_F", // Unarmed
        	"O_T_Quadbike_01_ghex_F",
        	"O_T_LSV_02_unarmed_F",
        	"I_C_Van_01_transport_F",
        	"I_C_Offroad_02_unarmed_F",
        	"O_T_Truck_03_device_ghex_F", // Trucks
        	"O_T_Truck_03_ammo_ghex_F",
        	"O_T_Truck_03_fuel_ghex_F",
        	"O_T_Truck_03_medical_ghex_F",
        	"O_T_Truck_03_repair_ghex_F",
        	"O_T_Truck_03_transport_ghex_F",
        	"O_T_Truck_03_covered_ghex_F",
        	"O_T_Truck_02_Ammo_F",
        	"O_T_Truck_02_fuel_F",
        	"O_T_Truck_02_Medical_F",
        	"O_T_Truck_02_Box_F",
        	"O_T_Truck_02_transport_F",
        	"O_T_Truck_02_F",
        	"O_T_MRAP_02_gmg_ghex_F", // Cars with weapons
        	"O_T_MRAP_02_hmg_ghex_F",
        	"O_T_LSV_02_AT_F",
        	"O_T_LSV_02_armed_F",
        	"I_C_Offroad_02_LMG_F",
        	"I_C_Offroad_02_AT_F",
        	"O_T_MRAP_02_gmg_ghex_F", // Cars with weapons
        	"O_T_MRAP_02_hmg_ghex_F",
        	"O_T_LSV_02_AT_F",
        	"O_T_LSV_02_armed_F",
        	"I_C_Offroad_02_LMG_F",
        	"I_C_Offroad_02_AT_F",
        	"O_T_APC_Tracked_02_AA_ghex_F", // Heavy armor
        	"O_T_APC_Tracked_02_cannon_ghex_F",
        	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
        	"O_T_MBT_02_arty_ghex_F",
        	"O_T_MBT_02_cannon_ghex_F",
        	"O_T_APC_Tracked_02_AA_ghex_F", // Heavy armor
        	"O_T_APC_Tracked_02_cannon_ghex_F",
        	"O_T_APC_Wheeled_02_rcws_v2_ghex_F",
        	"O_T_MBT_02_arty_ghex_F",
        	"O_T_MBT_02_cannon_ghex_F"
        ];
    };
};

// Random array. General infantry types. E.g. village patrols, ambient infantry, ammo depot guards, communication center guards, etc.

//drn_arr_Escape_InfantryTypes = ["O_Soldier_LAT_F", "O_Soldier_AR_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F", "O_Soldier_AR_F", "O_Soldier_GL_F", "O_support_MG_F", "O_medic_F", "O_Soldier_F", "O_Soldier_F"];
drn_arr_Escape_InfantryTypesBanditsGuer = ["I_C_Soldier_Bandit_1_F", "I_C_Soldier_Bandit_2_F", "I_C_Soldier_Bandit_3_F", "I_C_Soldier_Bandit_4_F", "I_C_Soldier_Bandit_5_F", "I_C_Soldier_Bandit_6_F", "I_C_Soldier_Bandit_7_F", "I_C_Soldier_Bandit_8_F"];
drn_arr_Escape_InfantryTypesParamilitaryGuer = ["I_C_Soldier_Para_1_F", "I_C_Soldier_Para_2_F", "I_C_Soldier_Para_3_F", "I_C_Soldier_Para_4_F", "I_C_Soldier_Para_5_F", "I_C_Soldier_Para_6_F", "I_C_Soldier_Para_7_F", "I_C_Soldier_Para_8_F"];
drn_arr_Escape_InfantryTypesCsatPacificEast = ["O_T_Soldier_A_F", "O_T_Soldier_AAR_F", "O_T_Support_AMG_F", "O_T_Support_AMort_F", "O_T_Soldier_AR_F", "O_T_Medic_F", "O_T_Engineer_F", "O_T_Soldier_Exp_F", "O_T_Soldier_GL_F", "O_T_Support_GMG_F", "O_T_Support_MG_F", "O_T_Support_Mort_F", "O_T_Soldier_M_F", "O_T_soldier_mine_F", "O_T_Officer_F", "O_T_Soldier_Repair_F", "O_T_Soldier_F", "O_T_Soldier_LAT_F", "O_T_Soldier_SL_F"];
drn_arr_Escape_InfantryTypesCsatPacificViperEast = ["O_V_Soldier_Exp_ghex_F", "O_V_Soldier_JTAC_ghex_F", "O_V_Soldier_M_ghex_F", "O_V_Soldier_ghex_F", "O_V_Soldier_Medic_ghex_F", "O_V_Soldier_LAT_ghex_F", "O_V_Soldier_TL_ghex_F"];

// Random array. A roadblock has a manned vehicle. This array contains possible manned vehicles (can be of any kind, like cars, armored and statics).
drn_arr_Escape_RoadBlock_MannedVehicleTypes = ["O_T_MRAP_02_gmg_ghex_F", "O_T_MRAP_02_hmg_ghex_F", "O_T_LSV_02_AT_F", "O_T_LSV_02_armed_F", "I_C_Offroad_02_LMG_F", "I_C_Offroad_02_AT_F", "O_static_AT_F", "O_GMG_01_high_F", "O_HMG_01_F", "O_HMG_01_high_F"];

// Random array. Vehicle classes (preferrably trucks) transporting enemy reinforcements.
drn_arr_Escape_ReinforcementTruck_vehicleClasses = ["Ural_INS", "UralOpen_INS"];
// Total cargo for reinforcement trucks. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_ReinforcementTruck_vehicleClasses above.
drn_arr_Escape_ReinforcementTruck_vehicleClassesMaxCargo = [14, 14];

// Random array. Motorized search groups are sometimes sent to look for you. This array contains possible class definitions for the vehicles.
drn_arr_Escape_MotorizedSearchGroup_vehicleClasses = ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", "O_T_APC_Tracked_02_cannon_ghex_F"];
// Total cargo motorized search group vehicle. Each element corresponds to a vehicle (array element) in array drn_arr_Escape_MotorizedSearchGroup_vehicleClasses above.
drn_arr_Escape_MotorizedSearchGroup_vehicleClassesMaxCargo = [8, 8];

// A communication center is guarded by vehicles depending on variable _enemyFrequency. 1 = a random light armor. 2 = a random heavy armor. 3 = a random 
// light *and* a random heavy armor.

// Random array. Light armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_lightArmorClasses = ["O_T_LSV_02_armed_F", "O_T_MRAP_02_hmg_ghex_F", "O_T_MRAP_02_gmg_ghex_F"];
// Random array. Heavy armored vehicles guarding the communication centers.
drn_arr_ComCenDefence_heavyArmorClasses = ["O_T_APC_Wheeled_02_rcws_v2_ghex_F", "O_T_APC_Tracked_02_cannon_ghex_F", "O_T_MBT_02_cannon_ghex_F"];

// A communication center contains two static weapons (in two corners of the communication center).
// Random array. Possible static weapon types for communication centers.
drn_arr_ComCenStaticWeapons = ["O_HMG_01_high_F"];
// A communication center have two parked and empty vehicles of the following possible types.
drn_arr_ComCenParkedVehicles = ["O_T_MRAP_02_ghex_F", "O_T_Quadbike_01_ghex_F", "O_T_LSV_02_unarmed_F", "I_C_Van_02_vehicle_F", "I_C_Van_01_transport_F", "I_C_Van_02_transport_F", "I_C_Offroad_02_unarmed_F", "O_T_MRAP_02_ghex_F", "O_T_Quadbike_01_ghex_F", "O_T_LSV_02_unarmed_F", "I_C_Van_02_vehicle_F", "I_C_Van_01_transport_F", "I_C_Van_02_transport_F", "I_C_Offroad_02_unarmed_F", "O_T_MRAP_02_gmg_ghex_F", "O_T_MRAP_02_hmg_ghex_F", "O_T_LSV_02_AT_F", "O_T_LSV_02_armed_F", "I_C_Offroad_02_LMG_F", "I_C_Offroad_02_AT_F"];

// Random array. Enemies sometimes use civilian vehicles in their unconventional search for players. The following car types may be used.
drn_arr_Escape_EnemyCivilianCarTypes = ["C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Offroad_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F"];

// Vehicles, weapons and ammo at ammo depots

// Random array. An ammo depot contains one static weapon of the followin types:
drn_arr_Escape_AmmoDepot_StaticWeaponClasses = ["O_HMG_01_high_F"];
// An ammo depot have one parked and empty vehicle of the following possible types.
drn_arr_Escape_AmmoDepot_ParkedVehicleClasses = ["O_T_MRAP_02_ghex_F", "O_T_Quadbike_01_ghex_F", "O_T_LSV_02_unarmed_F", "I_C_Van_02_vehicle_F", "I_C_Van_01_transport_F", "I_C_Van_02_transport_F", "I_C_Offroad_02_unarmed_F", "O_T_MRAP_02_ghex_F", "O_T_Quadbike_01_ghex_F", "O_T_LSV_02_unarmed_F", "I_C_Van_02_vehicle_F", "I_C_Van_01_transport_F", "I_C_Van_02_transport_F", "I_C_Offroad_02_unarmed_F", "O_T_MRAP_02_gmg_ghex_F", "O_T_MRAP_02_hmg_ghex_F", "O_T_LSV_02_AT_F", "O_T_LSV_02_armed_F", "I_C_Offroad_02_LMG_F", "I_C_Offroad_02_AT_F"];

// The following arrays define weapons and ammo contained at the ammo depots
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
