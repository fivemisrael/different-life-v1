Config                            = {}
Config.DrawDistance               = 100.0
Config.MarkerType                 = 20
Config.MarkerSize                 = { x = 0.7, y = 0.7, z = 0.7 }
Config.MarkerColor                = { r = 255, g = 0, b = 13 }
Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- only turn this on if you are using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableSocietyOwnedVehicles = false
Config.EnableLicenses             = false
Config.MaxInService               = -1
Config.Locale = 'en'

Config.bloodsStations = {

  bloods = {

    Blip = {
--      Pos     = { x = 425.130, y = -979.558, z = 30.711 },
      Sprite  = 60,
      Display = 4,
      Scale   = 1.2,
      Colour  = 29,
    },

    AuthorizedWeapons = {
      { name = 'WEAPON_KNIFE',     price = 800 },
      { name = 'WEAPON_POOLCUE', price = 600 },   
    },

	  AuthorizedVehicles = {
		  { name = 'caddy',  label = 'caddy' },
      { name = 'panto',      label = 'panto' },
      { name = 'feltzer3',      label = 'feltzer3' },
      { name = '600sel',      label = '600sel' }, 
      { name = 'paradise',      label = 'paradise'}
	  },
    Cloakrooms = {
      { x = 10000.0, y = 10000.0, z = 10000.0},
    },
    
    Armories = {
      { x = -134.46, y = -1609.72, z = 35.03},
    },

    Vehicles = {
      {
        Spawner    = {}, --{ x = -26.35, y = -1412.6, z = 29.51 },
        SpawnPoint = { x = -14.75, y = -1411.33, z = 29.31 },
        Heading    = 268.85,
      }
    },

    Helicopters = {
      {
        Spawner    = { x = 10000.0, y = 10000.0, z = 10000.0 },
        SpawnPoint = { x = 10000.0, y = 10000.0, z = 10000.0 },
        Heading    = 0.0,
      }
    },

    VehicleDeleters = {}, --[[ {
      { x = -18.57, y = -1410.73, z = 29.31},
      
    },]]
    
    BossActions = {
      { x = -136.72, y = -1608.56, z = 35.03 },
    },

  },

}
