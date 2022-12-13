Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 20
Config.MarkerSize                 = { x = 1.2, y = 0.5, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'en'

Config.WeaponaryStations = {

  Weaponary = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_ASSAULTRIFLE', price = 55000 }, 
      { name = 'WEAPON_COMPACTRIFLE', price = 40000 },
      { name = 'WEAPON_COMBATPDW', price = 35000 }, 
      { name = 'WEAPON_MINISMG', price = 25000 },
      { name = 'WEAPON_MACHINEPISTOL', price = 25000 },
      { name = 'WEAPON_HEAVYPISTOL', price = 15000 },
      { name = 'WEAPON_PISTOL', price = 10000 }, 
	    { name = 'WEAPON_COMBATPISTOL', price = 15000 },
      { name = 'WEAPON_SWITCHBLADE',     price = 1000 }, 
      { name = 'WEAPON_POOLCUE', price = 500 }, 
    },

	  AuthorizedVehicles = {
		  { name = 'whoopee',  label = 'Crispy IceCreams' },
	  },

    Cloakrooms = {
      --{ x = 973.48, y =  -97.22, z = 74.85},
    },

    Armories = {
      { x = 92.28, y = -1291.91, z = 29.27},
    },

    Vehicles = {
      {
        --Spawner    = { x = 106.88, y = -1305.74, z = 28.77 },
        SpawnPoint = { x = 87.49, y = -1281.29, z = 29.06, h = 99.92 },
		Heading	   = 0.0,
		Radius	   = 90,
	  }
    },

    Helicopters = {
      {
        Spawner    = { x = 10000.0, y = 10000.0, z = 10000.0 },
        SpawnPoint = { x = 10000.0, y = 10000.0, z = 10000.0 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {
      { x = 83.48, y = -1278.67, z = 29.19},
      
    },

    BossActions = {
      { x = 94.04, y =  -1293.94, z = 29.27 },
    },

  },

}
