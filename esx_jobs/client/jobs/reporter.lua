Config.Jobs.reporter = {

	BlipInfos = {
		Sprite = 184,
		Color = 1
	},

	Vehicles = {

		Truck = {
			Spawner = 1,
			Hash = "rumpo",
			Trailer = "none",
			HasCaution = true
		}

	},

	Zones = {

		VehicleSpawner = {
			Pos = {x = -1096.06, y = -254.79, z = 36.68},
			Size = {x = 2.0, y = 2.0, z = 0.2},
			Color = {r = 0, g = 128, b = 255},
			Marker = 27,
			Blip = false,
			Name = _U("reporter_name"),
			Type = "vehspawner",
			Spawner = 1,
			Hint = _U("reporter_garage"),
			Caution = 0
		},

		VehicleSpawnPoint = {
			Pos = {x = -1100.86, y = -260.82, z = 36.69},
			Size = {x = 3.0, y = 3.0, z = 1.0},
			Marker = -1,
			Blip = false,
			Name = _U("service_vh"),
			Type = "vehspawnpt",
			Spawner = 1,
			Heading = 201.51
		},

		VehicleDeletePoint = {
			Pos = {x = -1096.78, y = -299.71, z = 36.65},
			Size = {x = 5.0, y = 5.0, z = 0.2},
			Color = {r = 0, g = 128, b = 255},
			Marker = 27,
			Blip = false,
			Name = _U("return_vh"),
			Type = "vehdelete",
			Hint = _U("return_vh_button"),
			Spawner = 1,
			Caution = 0,
			GPS = 0,
			Teleport = {x = -1096.78, y = -299.71, z = 36.65}
		}

	}
}