Config                            = {}

Config.DrawDistance               = 100.0

Config.NPCJobEarnings             = {min = 25, max = 35}
Config.MinimumDistance            = 1500 -- Minimum NPC job destination distance from the pickup in GTA units, a higher number prevents nearby destionations.

Config.MaxInService               = -1
Config.EnablePlayerManagement     = true
Config.EnableSocietyOwnedVehicles = false

Config.Locale = 'en'

Config.AuthorizedVehicles = {

	{
		model = 'taxi',
		label = 'Taxi'
	}

}

Config.Zones = {

	VehicleSpawner = {
		Pos   = {x = 915.039, y = -162.187, z = 74.5},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 36, Rotate = true
	},

	VehicleSpawnPoint = {
		Pos     = {x = 911.108, y = -177.867, z = 74.283},
		Size    = {x = 1.5, y = 1.5, z = 1.0},
		Type    = -1, Rotate = false,
		Heading = 225.0
	},

	VehicleDeleter = {
		Pos   = {x = 908.317, y = -183.070, z = 73.201},
		Size  = {x = 3.0, y = 3.0, z = 0.25},
		Color = {r = 255, g = 0, b = 0},
		Type  = 1, Rotate = false
	},

	TaxiActions = {
		Pos   = {x = 903.32, y = -170.55, z = 74.0},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 20, Rotate = true
	},

	Cloakroom = {
		Pos     = {x = 894.88, y = -180.23, z = 74.5},
		Size    = {x = 1.0, y = 1.0, z = 1.0},
		Color   = {r = 204, g = 204, b = 0},
		Type    = 21, Rotate = true
	}
}

Config.JobLocations = {
	vector3(-1175.34, -884.09, 13.94), --Burger Shot
	vector3(-1096.38, -271.26, 37.61), --Job Center
	vector3(393.96, -977.6, 29.28), -- LSPD
	vector3(-1089.44, -1713.56, 4.32), ---DL-RP Dealership
	vector3(-1797.38, -118.96, 13.02), --Japanika Sushi Bar
	vector3(299.13, 174.46, 103.99), -- Yes Planet
	vector3(546.42, 85.12, 95.95), --Pizza Mati
	vector3(383.12, -841.63, 29.17), --Cellcom Store
	vector3(-715.22, -921.29, 19.01), --Carwash Market
	vector3(-431.74, 253.42, 82.89), --Comedy Club
	vector3(323.74, -203.53, 54.09), --Motel
	vector3(1197.85, -469.42, 66.09), --Barbershop
	vector3(229.84, -1404.4, 30.25), --Driving School
	vector3(499.13, -1309.88, 29.22), --Impound Central
	vector3(233.99, 198.23, 105.2), --Pacific Bank
	vector3(1309.39, -1659.74, 51.24) --Tattoo Parlor
}
