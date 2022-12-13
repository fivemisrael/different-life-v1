Config = {}
Config.DrawDistance = 100.0
Config.nameJob = "construction"
Config.nameJobLabel = "Constructor"
Config.platePrefix = "CONSTRUCT"
Config.Locale = 'en'

Config.Blip = {
  Sprite = 385,
  Color = 5
}

Config.Vehicles = {
  Truck = {
    Spawner = 1,
    Label = 'Business vehicle',
    Hash = "utillitruck3",
    Livery = 0,
    Trailer = "none",
  }
}

Config.Zones = {

  Cloakroom = {
    Pos = {x = 895.08, y = -896.21, z = 26.75},
    Size = {x = 1.5, y = 1.5, z = 0.6},
    Color = {r = 250, g = 250, b = 0},
    Type = 1,
    BlipSprite = 280,
    BlipColor = 5,
    BlipName = "Construction Company",
    hint = 'Press ~INPUT_CONTEXT~ to access the cloakroom',
  },

  VehicleSpawner = {
    Pos = {x = 892.63, y = -891.69, z = 26.15},
    Size = {x = 1.5, y = 1.5, z = 0.6},
    Color = {r = 0, g = 250, b = 0},
    Type = 27,
    BlipSprite = 280,
    BlipColor = 5,
    BlipName = "Construction Company : Garage",
    hint = 'Press ~INPUT_CONTEXT~ to access the garage',
  },

  VehicleSpawnPoint = {
    Pos = {x = 877.79, y = -890.02, z = 26.05},
    Size = {x = 3.0, y = 3.0, z = 1.0},
    Type = -1,
    Heading = 90.09,
  },

  VehicleDeleter = {
    Pos = {x = 892.98, y = -887.31, z = 26.15},
    Size = {x = 3.0, y = 3.0, z = 0.9},
    Color = {r = 255, g = 0, b = 0},
    Type = 27,
    BlipSprite = 280,
    BlipColor = 5,
    BlipName = "Construction Company: Returning the vehicle",
    hint = 'Press ~INPUT_CONTEXT~ to return the vehicle',
  },

  Vente = {
    Pos = {x = 889.5, y = -881.01, z = 25.20},
    Size = {x = 5.0, y = 5.0, z = 1.0},
    Color = {r = 250, g = 250, b = 0},
    Type = 27,
    BlipSprite = 280,
    BlipColor = 5,
    BlipName = "Construction Company: Manager",

    ItemTime = 500,
    ItemDb_name = "contrat",
    ItemName = "Construction Report",
    ItemMax = 100,
    ItemAdd = 1,
    ItemRemove = 1,
    ItemRequires = "contrat",
    ItemRequires_name = "Construction Report",
    ItemDrop = 100,
    hint = 'Press ~INPUT_CONTEXT~ to give away construction reports',
  },

}

Config.Construction = {

  { ['x'] = -174.39, ['y'] = -1063.7, ['z'] = 29.74 },
  { ['x'] = -454.65, ['y'] = -917.4, ['z'] = 29.29 },
  { ['x'] = -501.56, ['y'] = -996.63, ['z'] = 29.03 },
  { ['x'] = -1097.0, ['y'] = -1654.2, ['z'] = 4.3 },
  { ['x'] = 29.3, ['y'] = -385.68, ['z'] = 45.46 },
  
}

for i = 1, #Config.Construction, 1 do

  Config.Zones['Construction' .. i] = {
    Pos = Config.Construction[i],
    Size = {x = 1.5, y = 1.5, z = 1.0},
    Color = {r = 250, g = 250, b = 0},
    Type = 27
  }

end

Config.Uniforms = {

  job_wear = {
    male = {
      ['tshirt_1'] = 0, ['tshirt_2'] = 0,
      ['torso_1'] = 22, ['torso_2'] = 0,
      ['decals_1'] = 0, ['decals_2'] = 0,
      ['arms'] = 52,
      ['pants_1'] = 12, ['pants_2'] = 0,
      ['shoes_1'] = 50, ['shoes_2'] = 0,
      ['helmet_1'] = 0, ['helmet_2'] = 3,
      ['chain_1'] = 0, ['chain_2'] = 0,
      ['ears_1'] = -1, ['ears_2'] = 0,
      ['bproof_1'] = 10, ['bproof_2'] = 4
    },
    female = {
      ['tshirt_1'] = 58, ['tshirt_2'] = 0,
      ['torso_1'] = 123, ['torso_2'] = 3,
      ['decals_1'] = 0, ['decals_2'] = 0,
      ['arms'] = 72,
      ['pants_1'] = 25, ['pants_2'] = 6,
      ['shoes_1'] = 56, ['shoes_2'] = 2,
      ['helmet_1'] = -1, ['helmet_2'] = 0,
      ['chain_1'] = 0, ['chain_2'] = 0,
      ['ears_1'] = -1, ['ears_2'] = 0
    }
  },
}
