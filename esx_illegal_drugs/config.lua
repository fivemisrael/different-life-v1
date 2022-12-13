Config              = {}
Config.MarkerType   = 0 -- Marker visible or not. -1 = hiden  Set to 1 for a visible marker. To have a list of avaible marker go to https://docs.fivem.net/game-references/markers/
Config.DrawDistance = 100.0 --Distance where the marker be visible from
Config.ZoneSize     = {x = 1.5, y = 1.5, z = 1.0} -- Size of the marker
Config.MarkerColor  = {r = 0, g = 255, b = 0} --Color of the marker

Config.RequiredCopsCoke  = 2 --Ammount of cop that need to be online to be able to harvest/process/sell coke
Config.RequiredCopsMeth  = 0 --Ammount of cop that need to be online to be able to harvest/process/sell meth
Config.RequiredCopsWeed  = 2 --Ammount of cop that need to be online to be able to harvest/process/sell weed
Config.RequiredCopsOpium = 2 --Ammount of cop that need to be online to be able to harvest/process/sell opium

Config.TimeToFarmWeed     = 40  * 500 -- Ammount of time to harvest weed
Config.TimeToProcessWeed  = 40  * 500 -- Ammount of time to process weed
Config.TimeToSellWeed     = 40  * 500 -- Ammount of time to sell weed

Config.TimeToFarmOpium    = 80  * 500 -- Ammount of time to harvest coke
Config.TimeToProcessOpium = 40  * 500 -- Ammount of time to process coke
Config.TimeToSellOpium    = 40  * 500 -- Ammount of time to sell coke

Config.TimeToFarmCoke     = 80  * 500 -- Ammount of time to harvest coke
Config.TimeToProcessCoke  = 40  * 500 -- Ammount of time to process coke
Config.TimeToSellCoke     = 40  * 500 -- Ammount of time to sell coke

Config.TimeToFarmMeth     = 80  * 500 -- Ammount of time to harvest meth
Config.TimeToProcessMeth  = 40 * 500 -- Ammount of time to process meth
Config.TimeToSellMeth     = 40  * 500 -- Ammount of time to sell meth

Config.Locale = 'en'

Config.Zones = {
	CokeField =			{x=1092.93,  y=-3194.48,  z=-39.30},
	CokeProcessing =	{x=1100.54,  y=-3198.59,  z=-39.30},
	CokeDealer =		{x=-1108.45,   y=-1637.33,   z=4.62},
	MethField =			{x=1005.721,  y=-3200.301,  z=-38.519},
	MethProcessing =	{x=1014.878,  y=-3194.871,  z=-38.993},
	MethDealer =		{x=2564.72,   y=4680.26,    z=34.08},
	WeedField =			{x=1057.448,  y=-3197.646,  z=-39.138},
	WeedProcessing =	{x=1037.527,  y=-3205.368,  z=-38.17},
	WeedDealer =		{x = -42.78,   y= -1859.19,  z= 26.17},
	OpiumField =		{x=2433.804,  y=4969.196,   z=42.348},
	OpiumProcessing =	{x=2434.43,   y=4964.18,    z=42.348},
	OpiumDealer =		{x=-3155.608, y=1125.368,   z=20.858}
}

Config.DisableBlip = true -- Set to true to disable blips. False to enable them.
Config.Map = {

  {name="Coke Farm Entrance",    color=4, scale=0.8, id=501, x=65.45,     y=6662.49,   z=31.79},
  --{name="Coke Farm",             color=4, scale=0.8, id=501, x=1093.139,   y=-3195.673,  z=-39.131},
 -- {name="Coke Processing",       color=4, scale=0.8, id=501, x=1101.837,   y=-3193.732,  z=-38.993},
  {name="Coke Sales",            color=3, scale=0.8, id=501, x=-195.47,    y=6264.68,    z=31.49},
  {name="Meth Farm Entrance",    color=6, scale=0.8, id=499, x=-146.99,   y=-1688.46,   z=36.17},
  --{name="Meth Farm",             color=6, scale=0.8, id=499, x=1005.721,   y=-3200.301,  z=-38.519},
  --{name="Meth Processing",       color=6, scale=0.8, id=499, x=1014.878,   y=-3194.871,  z=-38.993},
  {name="Meth Sales",            color=3, scale=0.8, id=499, x=2564.722,    y=4680.26,     z=34.08},
  {name="Opium Farm Entrance",   color=6, scale=0.8, id=403, x=2433.804,   y=4969.196,   z=42.348},
  --{name="Opium Farm",            color=6, scale=0.8, id=403, x=2433.804,   y=4969.196,   z=42.348},
  --{name="Opium Processing",      color=6, scale=0.8, id=403, x=2434.43,    y=4964.18,    z=42.348},
  {name="Opium Sales",           color=3, scale=0.8, id=403, x=-3155.608, y=1125.368,   z=20.858},
  {name="Weed Farm Entrance",    color=2, scale=0.8, id=140, x=180.13,   y=2793.15,    z=45.66},
  --{name="Weed Farm",             color=2, scale=0.8, id=140, x=1057.448,   y=-3197.646,  z=-39.138},
  --{name="Weed Processing",       color=2, scale=0.8, id=140, x=1037.527,   y=-3205.368,  z=-38.17},
  {name="Weed Sales",            color=3, scale=0.8, id=140, x=-42.78,      y=-1859.19,   z=26.17}

}
