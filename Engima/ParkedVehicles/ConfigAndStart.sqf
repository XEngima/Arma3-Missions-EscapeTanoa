/******************************************************************************************/
/*
 * See the file Engima\ParkedVehicles\Documentation.txt for a full documentation regarding 
 * start parameters.
 *
/******************************************************************************************/

private ["_parameters"];

// Set custom parameters here
_parameters = [
	["BUILDING_TYPES", ["Land_FuelStation_02_workshop_F", "Land_GarageShelter_01_F", "Land_FuelStation_01_shop_F", "Land_Supermarket_01_F", "Land_House_Big_03_F"]],
	["UNIT_CLASSES", ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]],
	["PROBABILITY_OF_PRESENCE", 0.7],
	["DEBUG", false]
];

/******************************************************************************************/
/*  Function Call - Do not edit below this line (unless you know what you are doing)      */
/******************************************************************************************/

// Start script
_parameters call PARKEDVEHICLES_PlaceVehiclesOnMap;


// Set custom parameters here
_parameters = [
	["BUILDING_TYPES", ["Land_i_Shed_Ind_F"]],
	["UNIT_CLASSES", [
        	"O_APC_Tracked_02_cannon_F",
        	"O_APC_Wheeled_02_rcws_v2_F",
        	"O_MBT_02_arty_F",
        	"O_MRAP_02_F",
        	"O_MRAP_02_gmg_F",
        	"O_MRAP_02_hmg_F",
        	"O_LSV_02_AT_F",
        	"O_LSV_02_armed_F",
        	"O_Quadbike_01_F",
        	"O_Truck_03_device_F",
        	"O_Truck_03_ammo_F",
        	"O_Truck_03_medical_F",
        	"O_Truck_03_fuel_F",
        	"O_Truck_03_repair_F",
        	"O_Truck_03_covered_F",
        	"O_Truck_02_Ammo_F",
        	"O_Truck_02_fuel_F",
        	"O_Truck_02_medical_F",
        	"O_Truck_02_box_F",
        	"O_Truck_02_transport_F",
        	"O_Truck_02_covered_F",
        	"O_MBT_02_cannon_F",
        	"O_G_Van_01_fuel_F",
        	"O_G_Offroad_01_F",
        	"O_G_Offroad_01_AT_F",
        	"O_G_Offroad_01_armed_F",
        	"O_G_Offroad_01_repair_F",
        	"O_G_Quadbike_01_F",
        	"O_G_Van_01_transport_F"
        ]],
	["PROBABILITY_OF_PRESENCE", 0.7],
	["DEBUG", false]
];

/******************************************************************************************/
/*  Function Call - Do not edit below this line (unless you know what you are doing)      */
/******************************************************************************************/

// Start script
_parameters call PARKEDVEHICLES_PlaceVehiclesOnMap;
