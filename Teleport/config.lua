--[[ 
----------TEMPLATE

	zoneXFromOutToIn = {
		x = obviously X,
		y = obviously Y,
		z = obviously Z,
		w = obviously WIDTH,
		h = obviously HEIGHT,		
		visible = true,
		t = obviously TYPE,
		color = {
			r = obviously RED,
			g = obviously GREEN,
			b = obviously BLUE
		}
	},

If you don't want the marker to be visible, you're not obliged to
type more data after it:

	zoneXFromOutToIn = {
		x = obviously X,
		y = obviously Y,
		z = obviously Z,
		w = obviously WIDTH,
		h = obviously HEIGHT,		
		visible = false
	},
]]
-- To get a list of available marker go to https://docs.fivem.net/game-references/markers/

Config = {}

-- C key by default
Config.actionKey = 26

-- markers AKA Teleporters
Config.zones = {
	
	WeedEnter = {           --This is the entrance where you go to enter the weed warehouse
		x = 180.13,
		y = 2793.15,
		z = 45.66,
		w = 2.0,
		h = 1.0,
		visible = true, -- Set this to true to make the marker visible. False to disable it.
		t = 29,          -- This is the marker. You can change it https://docs.fivem.net/game-references/markers
		color = {
			r = 0,
			g = 102,
			b = 0
		}
		
	},
	
	WeedExit = {          --This is the exit where you go to exit the weed warehouse
		x = 1038.863,
		y = -3197.662,
		z = -38.17,
		w = 2.0,
		h = 1.0,
		visible = true,
		t = 29,
		color = {
			r = 0,
			g = 102,
			b = 0
		}
		
	},

	MethEnter = {
		x = 787.49,
		y = -145.7,
		z = 74.81,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	MethExit = {
		x = 1012.136,
		y = -3202.527,
		z = -38.993,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},

	CokeEnter = {
		x = 65.45,
		y = 6662.49,
		z = 31.0,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
	
	CokeExit = {
		x = 1103.613,
		y = -3196.25,
		z = -39.70,
		w = 2.0,
		h = 1.0,		
		visible = true,
		t = 1,
		color = {
			r = 102,
			g = 0,
			b = 0
		}
	},
}

-- Landing point, keep the same name as markers
Config.point = {

	WeedEnter = {           --This is where you land when you use the entrance teleport.
		x = 1066.009,
		y = -3183.386,
		z = -39.164
	},
	
	WeedExit = {             --This is where you land when you use the exit teleport.
		x = 186.1,
		y = 2786.53,
		z = 46.02
	},

	MethEnter = {
		x = 998.629,
		y = -3199.545,
		z = -36.394
	},
	
	MethExit = {
		x = 792.49,
		y = -124.24,
		z = 75.87,
	},

	CokeEnter = {
		x = 1088.636,
		y = -3188.551, 
		z = -38.993
	},
	
	CokeExit = {
		x = 65.69,
		y = 6654.43, 
		z = 32.27
	},
}


-- Automatic teleport list (no need to puseh E key in the marker)
Config.auto = {
	'WeedEnter',
	'WeedExit',
	'CokeEnter',
	'CokeExit',
	'MethEnter',
	'MethExit'
}
