/******************************************************************************************/
/*
 * See the file Engima\ParkedVehicles\Documentation.txt for a full documentation regarding 
 * start parameters.
 *
/******************************************************************************************/

// Set custom parameters here
private _parameters = [
	["BUILDING_TYPES", ["Land_FuelStation_02_workshop_F", "Land_GarageShelter_01_F", "Land_FuelStation_01_shop_F", "Land_Supermarket_01_F", "Land_House_Big_03_F", "Land_i_Garage_V1_F", "Land_MilOffices_V1_F", "Land_FuelStation_Shed_F"]],
	["UNIT_CLASSES", ["C_Offroad_01_F", "C_Offroad_01_repair_F", "C_Quadbike_01_F", "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]],
	["PROBABILITY_OF_PRESENCE", 1],
	["DEBUG", false]
];

// Run script
_parameters call PARKEDVEHICLES_PlaceVehiclesOnMap;
