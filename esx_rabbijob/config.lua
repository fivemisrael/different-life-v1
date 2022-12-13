Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 1.0 }
Config.MarkerColor                = { r = 255, g = 0, b = 0 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'en'

Config.RabbiStations = {

  Rabbi = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_COMBATPISTOL', price = 30000 },
      { name = 'WEAPON_KNIFE',     price = 250 },
      { name = 'WEAPON_POOLCUE', price = 100 },   
    },

	  AuthorizedVehicles = {
		  { name = 'schafter5',  label = 'Civil Vehicle' },
		  { name = 'Akuma',    label = 'Akuma Motor' },
		  { name = 'Granger',   label = '4X4 Van' },
		  { name = 'mule3',      label = 'Transport' },
	  },

    Cloakrooms = {
      { x = 10000.0, y = 10000.0, z = 10000.0},
    },

    Armories = {
      { x = -1537.53, y = 119.42, z = 55.90},
    },

    Vehicles = {
      {
        Spawner    = { x = -1393.5233154297, y = -641.10205078125, z = 27.673372268677 },
        SpawnPoint = { x = -1402.5718994141, y = -642.58520507813, z = 27.673368453979 },
        Heading    = 123.468,
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
      { x = -1405.6124267578, y = -635.41528320313, z = 27.673376083374},
      
    },

    BossActions = {
      { x = -1537.12, y = 130.27, z = 56.60 },
    },

  },

}
