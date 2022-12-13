 Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 27
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = true -- enable if you're using esx_license

Config.EnableHandcuffTimer        = true -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 100000 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.PoliceStations = {

	--[[LSPD = {

		Blip = {
			Coords  = vector3(-1108.2, -844.91 , 19.32),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
            vector3(-1099.09, -826.05, 26.82),
          --  vector3(-1098.53, -831.89, 14.28),
			vector3(-1093.48, -831.96, 14.28)
        },
        BuyWeapon = {
                    --vector3(-1103.93, -827.3, 14.28)

        },

        Storage = {
            vector3(-1092.06, -816.0, 11.04)
        },

        Armories = {
            vector3(-1105.01,  -821.53, 14.28)
        },

        Vehicles = {
            {
                Spawner = vector3(-1076.2, -847.1, 4.88),
                InsideShop = vector3(228.5, -993.5, -99.5),
                SpawnPoints = {
					{ coords = vector3(-1039.02, -855.99, 4.6), heading = 58.7, radius = 6.0 },
					{ coords = vector3(-1041.33, -859.12, 4.62), heading = 58.7, radius = 6.0 },
					{ coords = vector3(-1044.47, -862.05, 4.65), heading = 58.7, radius = 6.0 },
					{ coords = vector3(-1051.36, -867.37, 4.85), heading = 58.7, radius = 6.0 }
                }
            },

            {
                Spawner = vector3(-1113.78, -833.93, 13.34),
                InsideShop = vector3(228.5, -993.5, -99.0),
                SpawnPoints = {
					{ coords = vector3(-1111.53, -855.94, 13.23), heading = 37.53, radius = 6.0 },
					{ coords = vector3(-1122.66, -863.16, 13.26), heading = 36.57, radius = 6.0 },
					{ coords = vector3(-1133.14, -840.5, 13.53), heading = 218.24, radius = 6.0 },
					{ coords = vector3(-1127.64, -835.51, 13.22) , heading = 218.37, radius = 6.0}
                }
            }
        },

        Helicopters = {
            {
                Spawner = vector3(-1100.82, -846.23, 37.7),
                InsideShop = vector3(-75.17, -819.25, 326.18),
                SpawnPoints = {
                    { coords = vector3(-1096.07, -832.18, 37.7), heading = 92.6, radius = 10.0 }
                }
            }
        },

		BossActions = {
			vector3(-1113.33, -833.19, 34.36)
		}

	},]]

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6)
		},
		BuyWeapon = {
					vector3(456.09,-979.06,6.55)

		},

		Storage = {
			vector3(460.99, -981.22, 30.69)
		},
		
		Armories = {
			vector3(451.7, -980.1, 30.6)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6)
		}

	},
	LSPD1 = {

		Blip = {
			Coords  = vector3(1854.785, 3683.975, 34.26707),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
            vector3(1857.051, 3689.393, 34.26708),
        },
        BuyWeapon = {
                    --vector3(-1103.93, -827.3, 14.28)

        },

        Storage = {
            vector3(-1092.06, -816.0, 11.04)
        },

        Armories = {
            vector3(1848.693, 3690.34, 34.26708)
        },
		
        Vehicles = {
            {
                Spawner = vector3(1866.003, 3688.208, 34.26752),
                InsideShop = vector3(1843.651, 3706.316, 33.33229),
                SpawnPoints = {
					{ coords = vector3(1853.85, 3675.873, 33.47055), heading = 211.24, radius = 2.0 },
					{ coords = vector3(1850.302, 3673.999, 33.48634), heading = 211.24, radius = 2.0 },
					{ coords = vector3(1846.94, 3671.88, 33.42628), heading = 211.24, radius = 2.0 }
                }
            }
        },
		
        Helicopters = {
            {
                Spawner = vector3(10000.0, 10000.0, 10000.0), --vector3(-1100.82, -846.23, 37.7),
                InsideShop = vector3(10000.0, 10000.0, 10000.0), --vector3(-75.17, -819.25, 326.18),
                SpawnPoints = {
                    { coords = vector3(10000.0, 10000.0, 10000.0), heading = 92.6, radius = 10.0 }
                }
            }
        },

		BossActions = {
			vector3(10000.0, 10000.0, 10000.0)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	officer = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 }
	},
	
	sergeant = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {},

	lieutenant = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },	
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
		
	boss = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {},

	recruit = {},
	
	officer = {
		{ model = 'police4', label = 'Unmarked Dodge Charger', price = 1 },
		{ model = 'fbi2', label = 'Unmarked chevrolet', price = 1 },
		{ model = 'police', label = 'Hyundai', price = -1 },
		{ model = 'police3', label = 'Ford Traffic', price = -1 },
		{ model = 'Yasambike', label = 'police bike', price = -1 },
	},

	sergeant = {
	{ model = 'police', label = 'Hyundai', price = -1 },
	{ model = 'police3', label = 'Ford Traffic', price = -1 },	
	{ model = 'riot', label = 'armored Vehicle', price = 1 },	    
	},

	intendent = {},
    	
	lieutenant = {
		{ model = 'police4', label = 'Unmarked Dodge Charger', price = 1 },
		{ model = 'fbi2', label = 'Unmarked chevrolet', price = 1 },
		{ model = 'riot', label = 'armored Vehicle', price = 1 },
		{ model = 'police', label = 'Hyundai', price = -1 },
		{ model = 'police3', label = 'Ford Traffic', price = -1 },
		{ model = 'Yasambike', label = 'police bike', price = -1 },	
	},
		
	
	chef = {
		{ model = 'police4', label = 'Unmarked Dodge Charger', price = 1 },
		{ model = 'fbi2', label = 'Unmarked chevrolet', price = 1 },
		{ model = 'riot', label = 'armored Vehicle', price = 1 },
	},
	
	
	boss = {
		{ model = 'police4', label = 'Unmarked Dodge Charger', price = 1 },
		{ model = 'fbi2', label = 'Unmarked chevrolet', price = 1 },
		{ model = 'police', label = 'Hyundai', price = -1 },
		{ model = 'riot', label = 'armored Vehicle', price = 1 },
		{ model = 'police3', label = 'Ford Traffic', price = -1 },
		{ model = 'Yasambike', label = 'police bike', price = -1 },
}
}
Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }

	},

	sergeant = {},

	intendent = {},

	lieutenant = {
	    { model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }
	},
	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }
	},
	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 8,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 1,
			['torso_1'] = 93,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 93,   ['torso_2'] = 1,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 1,
			['torso_1'] = 93,   ['torso_2'] = 2,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 1,
			['torso_1'] = 93,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 1,
			['torso_1'] = 93,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 1,
			['torso_1'] = 93,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 38,  ['tshirt_2'] = 0,
            ['torso_1'] = 102,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 46,   ['pants_2'] = 0,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 8,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 1,
			['torso_1'] = 93,   ['torso_2'] = 3,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 8,    ['chain_2'] = 0,
			['ears_1'] = -1,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	magav_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 37,  ['tshirt_2'] = 0,
            ['torso_1'] = 93,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 0,
            ['pants_1'] = 52,   ['pants_2'] = 1,
            ['shoes_1'] = 24,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = 2,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 16,  ['bproof_2'] = 0
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 12,  ['bproof_2'] = 4
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	magav2_wear = {
        male = {
            ['bproof_1'] = 7,  ['bproof_2'] = 0
        },
        female = {
            ['bproof_1'] = 13,  ['bproof_2'] = 1
        }
    },
	
	Pbullet_wear = {
        male = {
            ['bproof_1'] = 12,  ['bproof_2'] = 3
        },
        female = {
            ['bproof_1'] = 10,  ['bproof_2'] = 0
        }
    },
    Ybullet_wear = {
        male = {
            ['bproof_1'] = 12,  ['bproof_2'] = 1
        },
        female = {
            ['bproof_1'] = 30,  ['bproof_2'] = 9
        }
    },
    Ibullet_wear = {
        male = {
            ['bproof_1'] = 12,  ['bproof_2'] = 2
        },
        female = {
            ['bproof_1'] = 30,  ['bproof_2'] = 9
        }
    },
    Abullet_wear = {
        male = {
            ['bproof_1'] = 12,  ['bproof_2'] = 0
        },
        female = {
            ['bproof_1'] = 30,  ['bproof_2'] = 9
        }
    },
	extra_wear = {
		male = {
			['chain_1'] = 1,    ['chain_2'] = 0
		},
		female = {
			['chain_1'] = 1,    ['chain_2'] = 0
		}
	},
	gilet_wear = {
		male = {
			['bproof_1'] = 10,  ['bproof_2'] = 4
		}
	--[[	female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}]]
	}

}