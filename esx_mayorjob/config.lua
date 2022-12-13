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

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 100000 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale = 'en'

Config.Government = {

	LSPD = {

		Blip = {
			Coords  = vector3(-553.7458, -192.241, 71.32289),
			Sprite  = 181,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(-544.5032, -196.0974, 69.97533)
		},
		
		BuyWeapon = {
					-- vector3(456.09,-979.06,6.55)

		},

		Storage = {
			vector3(-552.9108, -199.9412, 60.91297)
		},
		
		Armories = {
			vector3(-547.6456, -190.8788, 65.45263)


		},

		Vehicles = {
			{
				Spawner = vector3(-559.9363, -177.6741, 38.06548),
				InsideShop = vector4(-581.343, -135.3293, 35.39486, 200.67),
				SpawnPoints = {
					{ coords = vector3(-581.9037, -171.4255, 37.58052), heading = 68.54, radius = 6.0 },
					{ coords = vector3(-559.9363, -177.6741, 38.06548), heading = 68.54, radius = 3.0 },
					{ coords = vector3(-566.816, -165.3758, 37.79872), heading = 68.54, radius = 3.0 },
				}
			}

			--[[{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			}]]
		},

		Helicopters = {
			--[[{
				Spawner = vector3(282.6443, -259.2343, 54.00531),
				InsideShop = vector3(282.6443, -259.2343, 54.00531),
				SpawnPoints = {
					{ coords = vector3(311.7871, -260.1086, 53.99818), heading = 92.6, radius = 10.0 }
				}
			}]]
		},

		BossActions = {
			vector3(-547.9413, -197.565, 69.97535)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {},

	officer = {
		{ weapon = 'WEAPON_PISTOL', price = 0 },
		{ weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		{ weapon = 'WEAPON_SPECIALCARBINE', price = 0 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'WEAPON_STUNGUN', price = 0 },
		{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		-- { weapon = 'WEAPON_PISTOL', price = 0 },
		-- { weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		-- { weapon = 'WEAPON_STUNGUN', price = 0 },
		-- { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		-- { weapon = 'WEAPON_PISTOL', price = 0 },	
		-- { weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		-- { weapon = 'WEAPON_STUNGUN', price = 0 },
		-- { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		-- { weapon = 'WEAPON_PISTOL', price = 0 },
		-- { weapon = 'WEAPON_CARBINERIFLE', price = 0 },	
		-- { weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		-- { weapon = 'WEAPON_STUNGUN', price = 0 },
		-- { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		-- { weapon = 'WEAPON_PISTOL', price = 0 },
		-- { weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		-- { weapon = 'WEAPON_SPECIALCARBINE', price = 0 },
		-- { weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		-- { weapon = 'WEAPON_STUNGUN', price = 0 },
		-- { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
		
	boss = {
		-- { weapon = 'WEAPON_PISTOL', price = 0 },
		-- { weapon = 'WEAPON_CARBINERIFLE', price = 0 },
		-- { weapon = 'WEAPON_SPECIALCARBINE', price = 0 },
		-- { weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		-- { weapon = 'WEAPON_STUNGUN', price = 0 },
		-- { weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	}
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'onebeast', label = 'GovernmentLimousine', price = -1 },
		{ model = 'granger', label = 'Cadillac Escalade', price = -1 },
	},
	recruit = {},
	officer = {},
	sergeant = {},
	intendent = {},	
	lieutenant = {},
	chef = {},
	boss = {}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {
		{ model = 'Buzzard', label = 'Helicopter', livery = 0, price = 500 }
	},

	sergeant = {},

	intendent = {},

	lieutenant = {
	    -- { model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }
	},
	chef = {
		-- { model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }
	},
	boss = {
		-- { model = 'polmav', label = 'Police Maverick', livery = 0, price = 500 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 21,  ['tshirt_2'] = 4,
            ['torso_1'] = 4,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 28,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            -- ['ears_1'] = 0,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	Bodyguard_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 7,
            ['torso_1'] = 4,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 24,   ['pants_2'] = 0,
            ['shoes_1'] = 40,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 2,
            ['ears_1'] = -1,     ['ears_2'] = 0,
			['mask_1'] = 121,		['mask_2'] = 0,
			['glasses_1'] = 5,	['glasses_2'] = 6,
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	Bodyguard2_wear = {
		male = {
			['tshirt_1'] = 10,  ['tshirt_2'] = 7,
            ['torso_1'] = 4,   ['torso_2'] = 4,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 4,
            ['pants_1'] = 24,   ['pants_2'] = 1,
            ['shoes_1'] = 40,   ['shoes_2'] = 9,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 0,    ['chain_2'] = 0,
            ['ears_1'] = -1,     ['ears_2'] = 0,
			['mask_1'] = 121,		['mask_2'] = 0,
			['glasses_1'] = 5,	['glasses_2'] = 6,
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
            ['torso_1'] = 10,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 21,    ['chain_2'] = 2,
            -- ['ears_1'] = -1,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
            ['torso_1'] = 10,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 21,    ['chain_2'] = 0,
            -- ['ears_1'] = -1,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
            ['torso_1'] = 10,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 21,    ['chain_2'] = 0,
            -- ['ears_1'] = -1,     ['ears_2'] = 0
        },
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
            ['torso_1'] = 10,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 21,    ['chain_2'] = 0,
            -- ['ears_1'] = -1,     ['ears_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 31,  ['tshirt_2'] = 0,
            ['torso_1'] = 10,   ['torso_2'] = 0,
            ['decals_1'] = 0,   ['decals_2'] = 0,
            ['arms'] = 12,
            ['pants_1'] = 10,   ['pants_2'] = 0,
            ['shoes_1'] = 10,   ['shoes_2'] = 0,
            ['helmet_1'] = -1,  ['helmet_2'] = 0,
            ['chain_1'] = 21,    ['chain_2'] = 1
            -- ['ears_1'] = -1,     ['ears_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0
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
			['ears_1'] = 2,     ['ears_2'] = 0
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
            ['bproof_1'] = 30,  ['bproof_2'] = 9
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
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1
		}
	}

}