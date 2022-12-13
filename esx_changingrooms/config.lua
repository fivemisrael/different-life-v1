Config                      = {}

Config.DrawDistance         = 100.00
Config.MarkerType           = 20
Config.MarkerSize           = { x = 1.2, y = 0.5, z = 1.0 }
Config.MarkerColor          = { r = 255, g = 0, b = 0 }

Config.Zones = {}

Config.ChangingRooms = {
	{x = 352.57,   y = -2033.76,   z = 25.62}, -- Vagos Change Room
	{x = -31.09,   y = -1394.46,   z = 33.39}, -- bloods Change Room
	{x = 94.59, y =  -1290.46, z = 29.27} -- Weaponary Change Room
}

for i=1, #Config.ChangingRooms, 1 do
	Config.Zones['Changing_Rooms' .. i] = {
		Pos   = Config.ChangingRooms[i],
		Size  = Config.MarkerSize,
		Color = Config.MarkerColor,
		Type  = Config.MarkerType
	}
end