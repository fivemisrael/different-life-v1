Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerColor                = { r = 255, g = 255, b = 255 }
Config.EnablePlayerManagement     = true -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 65

Config.Locale = 'en'

Config.LicenseEnable = false -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {
	ShopEntering = {
		Pos   = { x = -10000.0, y = -10000.0, z = -10000.0 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = 27,
	},

	ShopInside = {
		Pos     = { x = -10000.0, y = -10000.0, z = -10000.0 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = -20.0,
		Type    = -1,
	},

	ShopOutside = {
		Pos     = { x = -10000.0, y = -10000.0, z = -10000.0 },
		Size    = { x = 1.5, y = 1.5, z = 1.0 },
		Heading = 330.0,
		Type    = -1,
	},

	BossActions = {
		Pos   = { x = -32.0, y = -1114.2, z = 25.4 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1,
	},

	GiveBackVehicle = {
		Pos   = { x = -10000.0, y = -10000.0, z = -10000.0 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1),
	},

	ResellVehicle = {
		Pos   = { x = -10000.0, y = -10000.0, z = -10000.0 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = 27
	}

}