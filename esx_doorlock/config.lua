Config = {}
Config.Locale = 'en'

Config.DoorList = {



	--
	-- Mission Row First Floor
	--
	
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 85.0,
		objCoords  = vector3(1820.77, 2620.77, 45.95126),
		textCoords = vector3(1820.77, 2620.77, 45.95126),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 95.0,
		objCoords  = vector3(1845.79, 2698.621, 45.95531),
		textCoords = vector3(1845.79, 2698.621, 45.95531),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 165.0,
		objCoords  = vector3(1773.108, 2759.7, 45.88673),
		textCoords = vector3(1773.108, 2759.7, 45.88673),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 200.0,
		objCoords  = vector3(1651.161, 2755.436, 45.87868),
		textCoords = vector3(1651.161, 2755.436, 45.87868),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 235.0,
		objCoords  = vector3(1572.662, 2679.191, 45.72976),
		textCoords = vector3(1572.662, 2679.191, 45.72976),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 270.0,
		objCoords  = vector3(1537.811, 2585.995, 45.68915),
		textCoords = vector3(1537.811, 2585.995, 45.68915),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 290.0,
		objCoords  = vector3(1543.241, 2471.294, 45.71201),
		textCoords = vector3(1543.241, 2471.294, 45.71201),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 355.0,
		objCoords  = vector3(1658.584, 2397.722, 45.71526),
		textCoords = vector3(1658.584, 2397.722, 45.71526),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 385.0,
		objCoords  = vector3(1759.62, 2412.837, 45.71166),
		textCoords = vector3(1759.62, 2412.837, 45.71166),
		authorizedJobs = { 'police' },
		locked = true
	},
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 65.0,
		objCoords  = vector3(1821.17, 2476.265, 45.68915),
		textCoords = vector3(1821.17, 2476.265, 45.68915),
		authorizedJobs = { 'police' },
		locked = true
	},
	-- Entrance Doors
	{
		textCoords = vector3(434.7, -982.0, 31.5),
		authorizedJobs = { 'police' },
		locked = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vector3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vector3(434.7, -983.2, 30.8)
			}
		}
	},

-- Mission Row - Front Security Gate
	{
		objName = 'prop_facgate_08',
		objCoords  = vector3(410.76060000,-1027.04800000,28.40136000),
		textCoords = vector3(410.51,-1024.67,29.39),
		authorizedJobs = {'police'},
		locked = true,
		distance = 15,
		size = 2
	},

	-- To locker room & roof
	{
		objName = 'v_ilev_ph_gendoor004',
		objYaw = 90.0,
		objCoords  = vector3(449.6, -986.4, 30.6),
		textCoords = vector3(450.1, -986.3, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Rooftop
	{
		objName = 'v_ilev_gtdoor02',
		objYaw = 90.0,
		objCoords  = vector3(464.3, -984.6, 43.8),
		textCoords = vector3(464.3, -984.0, 44.8),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Hallway to roof
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = 90.0,
		objCoords  = vector3(461.2, -985.3, 30.8),
		textCoords = vector3(461.5, -986.0, 31.5),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Armory
	{
		objName = 'v_ilev_arm_secdoor',
		objYaw = -90.0,
		objCoords  = vector3(452.6, -982.7, 30.6),
		textCoords = vector3(453.0, -982.6, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- Captain Office
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = -180.0,
		objCoords  = vector3(447.2, -980.6, 30.6),
		textCoords = vector3(447.2, -980.0, 31.7),
		authorizedJobs = { 'police' },
		locked = true
	},

	-- To downstairs (double doors)
	{
		textCoords = vector3(444.6, -989.4, 31.7),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 180.0,
				objCoords = vector3(443.9, -989.0, 30.6)
			},

			{
				objName = 'v_ilev_ph_gendoor005',
				objYaw = 0.0,
				objCoords = vector3(445.3, -988.7, 30.6)
			}
		}
	},

	--
	-- Mission Row Cells
	--

	-- Main Cells
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 0.0,
		objCoords  = vector3(463.8, -992.6, 24.9),
		textCoords = vector3(463.3, -992.6, 25.1),
		authorizedJobs = { 'police','admin' },
		locked = true
	},

	-- Cell 1
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = -90.0,
		objCoords  = vector3(462.3, -993.6, 24.9),
		textCoords = vector3(461.8, -993.3, 25.0),
		authorizedJobs = { 'police','admin' },
		locked = true
	},

	-- Cell 2
	{
		objName = 'v_ilev_ph_cellgate',
		objYaw = 90.0,
		objCoords  = vector3(462.3, -998.1, 24.9),
		textCoords = vector3(461.8, -998.8, 25.0),
		authorizedJobs = { 'police','admin' },
		locked = true
	},

	-- Cell 3
    {
        objName = 'v_ilev_ph_cellgate',
        objYaw = 90.0,
        objCoords  = vector3(462.7, -1001.9, 24.9),
        textCoords = vector3(461.8, -1002.4, 25.0),
        authorizedJobs = { 'police','admin' },
        locked = true
    },

	-- To Back
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vector3(463.4, -1003.5, 25.0),
		textCoords = vector3(464.0, -1003.5, 25.5),
		authorizedJobs = { 'police','admin' },
		locked = true
	},

    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 180.0,
        objCoords  = vector3(451.41, -983.91, 26.7),
        textCoords = vector3(451.41, -983.91, 26.7),
        authorizedJobs = { 'police' },
        locked = true,
        distance = 2
    },

    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 0.0,
        objCoords  = vector3(452.70, -984.11, 26.7),
        textCoords = vector3(452.70, -984.11, 26.7),
        authorizedJobs = { 'police' },
        locked = true,
        distance = 2
    },

    -- Downstairs to processing (double doors)
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = -90.0,
        objCoords  = vector3(446.20, -986.94, 26.7),
        textCoords = vector3(446.20, -986.94, 26.7),
        authorizedJobs = { 'police' },
        locked = true,
        distance = 2
    },
 
    {
        objName = 'v_ilev_ph_gendoor005',
        objYaw = 90.0,
        objCoords  = vector3(446.20, -986.00, 26.7),
        textCoords = vector3(446.20, -986.00, 26.7),
        authorizedJobs = { 'police' },
        locked = true,
        distance = 2
    },   
	--
	-- Mission Row Back
	--

	-- Back (double doors)
	{
		textCoords = vector3(468.6, -1014.4, 27.1),
		authorizedJobs = { 'police','admin' },
		locked = true,
		distance = 4,
		doors = {
			{
				objName = 'v_ilev_rc_door2',
				objYaw = 0.0,
				objCoords  = vector3(467.3, -1014.4, 26.5)
			},

			{
				objName = 'v_ilev_rc_door2',
				objYaw = 180.0,
				objCoords  = vector3(469.9, -1014.4, 26.5)
			}
		}
	},

	-- Back Gate
	{
		objName = 'hei_prop_station_gate',
		objYaw = 90.0,
		objCoords  = vector3(488.8, -1017.2, 27.1),
		textCoords = vector3(488.8, -1020.2, 27.1),
		authorizedJobs = { 'police','admin' },
		locked = true,
		distance = 14,
		size = 2
	},

	--
	-- Sandy Shores
	--

	-- Entrance
	{
		objName = 'v_ilev_shrfdoor',
		objYaw = 30.0,
		objCoords  = vector3(1855.685, 3683.93, 34.59282),
		textCoords = vector3(1855.1, 3683.5, 35.0),
		authorizedJobs = { 'police','admin' },
		locked = true,
		distance = 2,
		size = 2
	},

	--
	-- Paleto Bay
	--

	-- Entrance (double doors)
	{
		textCoords = vector3(-443.5, 6016.3, 32.0),
		authorizedJobs = { 'police','admin' },
		locked = true,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_shrf2door',
				objYaw = -45.0,
				objCoords  = vector3(-443.1, 6015.6, 31.7),
			},

			{
				objName = 'v_ilev_shrf2door',
				objYaw = 135.0,
				objCoords  = vector3(-443.9, 6016.6, 31.7)
			}
		}
	},

	--
	-- Bolingbroke Penitentiary
	--

	-- Entrance (Two big gates)
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1844.9, 2604.8, 44.6),
		textCoords = vector3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police','admin' },
		locked = true,
		distance = 12,
		size = 2
	},

	{
		objName = 'prop_gate_prison_01',
		objCoords  = vector3(1818.5, 2604.8, 44.6),
		textCoords = vector3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police','admin' },
		locked = true,
		distance = 12,
		size = 2
	},


	{
		objName = 'vw_prop_vw_casino_door_02a',
		objCoords  = vector3(946.48, 41.05, 75.32),
		textCoords = vector3(946.48, 41.05, 75.32),
		authorizedJobs = {'casino'},
		locked = false,
		distance = 2,
		size = 2
	},

	{
		objName = 'vw_prop_vw_casino_door_02a',
		objCoords  = vector3(947.03, 40.42, 75.32),
		textCoords = vector3(947.03, 40.42, 75.32),
		authorizedJobs = {'casino'},
		locked = false,
		distance = 2,
		size = 2
	},

	{
		objName = 'vw_prop_vw_casino_door_01d',
		objCoords  = vector3(988.86, 68.24, 78.48),
		textCoords = vector3(988.86, 68.24, 78.48),
		authorizedJobs = {'casino'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'vw_prop_vw_casino_door_01d',
		objCoords  = vector3(989.36, 67.6, 78.48),
		textCoords = vector3(989.36, 67.6, 78.48),
		authorizedJobs = {'casino'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_L',
		objCoords  = vector3(-1153.280,-1729.470,4.910),
		textCoords = vector3(-1153.280,-1729.470,4.910),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_R',
		objCoords  = vector3(-1152.050,-1731.250,4.910),
		textCoords = vector3(-1152.050,-1731.250,4.910),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_R',
		objCoords  = vector3(-1124.880,-1728.760,4.920),
		textCoords = vector3(-1124.880,-1728.760,4.920),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_L',
		objCoords  = vector3(-1126.640,-1730.010,4.920),
		textCoords = vector3(-1126.640,-1730.010,4.920),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_R',
		objCoords  = vector3(-1179.287,-1735.893,4.890),
		textCoords = vector3(-1179.287,-1735.893,4.890),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_L',
		objCoords  = vector3(-1181.047,-1737.153,4.900),
		textCoords = vector3(-1181.047,-1737.153,4.900),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_R',
		objCoords  = vector3(-1218.850,-1723.380,4.920),
		textCoords = vector3(-1218.850,-1723.380,4.920),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'hei_Prop_SS1_MPint_Door_L',
		objCoords  = vector3(-1220.620,-1724.630,4.920),
		textCoords = vector3(-1220.620,-1724.630,4.920),
		authorizedJobs = {'cardealer'},
		locked = true,
		distance = 2,
		size = 2
	},

-- Tequi-lala Bar Freeway

	{
		objName = 'v_ilev_roc_door4',
		objCoords  = vector3(-564.51,276.11,83.12),
		textCoords = vector3(-564.51,276.11,83.12),
		authorizedJobs = {'biker'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'v_ilev_roc_door2',
		objCoords  = vector3(-559.85,292.43,82.12),
		textCoords = vector3(-559.85,292.43,82.12),
		authorizedJobs = {'biker'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'v_ilev_roc_door2',
		objCoords  = vector3(-569.46,292.98,79.18),
		textCoords = vector3(-569.46,292.98,79.18),
		authorizedJobs = {'biker'},
		locked = true,
		distance = 2,
		size = 2
	},

	{
		objName = 'v_ilev_roc_door4',
		objCoords  = vector3(-561.9,294.03,87.6),
		textCoords = vector3(-561.9,294.03,87.6),
		authorizedJobs = {'biker'},
		locked = true,
		distance = 2,
		size = 2
	},
		---------------------
   -- vespucci --
---------------------
--[[
{
	objName = 'xm_prop_iaa_base_door_01',
	objYaw = 128.0,
	objCoords  = vector3(-1089.599, -841.5602, 37.91558),
	textCoords = vector3(-1089.599, -841.5602, 37.91558),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 5.1,
	size = 0.5
},
{
	objName = 'xm_prop_iaa_base_door_01',
	objYaw = 37.0,
	objCoords  = vector3(-1077.812, -830.573, 19.19895),
	textCoords = vector3(-1077.21, -830.09, 19.04),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 5.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1085.826, -827.8386, 5.630564),
	textCoords = vector3(-1085.826, -827.8386, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1088.231, -824.7723, 5.630564),
	textCoords = vector3(-1088.231, -824.7723, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1091.14, -827.0005, 5.630564),
	textCoords = vector3(-1091.14, -827.0005, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1090.64, -821.6275, 5.630564),
	textCoords = vector3(-1090.64, -821.6275, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1095.957, -820.7254, 5.630564),
	textCoords = vector3(-1095.957, -820.7254, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -143.0,
	objCoords  = vector3(-1073.581, -827.4854, 5.630564),
	textCoords = vector3(-1073.581, -827.4854, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_rc_door2',
	objYaw = 40.0,
	objCoords  = vector3(-1108.878, -842.7352, 13.83423),
	textCoords = vector3(-1108.878, -842.7352, 13.83423),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1093.552, -823.8583, 5.630564),
	textCoords = vector3(-1093.552, -823.8583, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},

{
	objName = 'xm_prop_iaa_base_door_01',
	objYaw = 126.0,
	objCoords  = vector3(-1090.719, -841.9653, 22.50592),
	textCoords = vector3(-1091.14, -841.35, 22.36),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.5,
	size = 0.5
},

{
	objName = 'v_ilev_rc_door2',
	objYaw = 37.0,
	objCoords  = vector3(-1080.009, -856.0915, 5.35553),
	textCoords = vector3(-1080.009, -856.0915, 5.35553),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.5,
	size = 0.5
},

{
	textCoords = vector3(-1090.13, -847.92, 4.88),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'v_ilev_rc_door2',
			objYaw = 307.5,
			objCoords = vector3(-1091.039, -846.6765, 5.041255),
		},

		{
			objName = 'v_ilev_rc_door2',
			objYaw = 127.0,
			objCoords = vector3(-1089.463, -848.7385, 5.041255)
		}
	}
},

{
	textCoords = vector3(-1113.298, -829.3074, 26.87354),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_glav_door',
			objYaw = 37.5,
			objCoords = vector3(-1112.294, -828.5263, 27.36864),
		},

		{
			objName = 'vesp_glav_door',
			objYaw = 217.0,
			objCoords = vector3(-1114.469, -830.196, 27.36864)
		}
	}
},

{
	textCoords = vector3(-1111.73, -825.22, 19.32),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_glav_door',
			objYaw = 38.0,
			objCoords = vector3(-1110.612, -824.3278, 19.74944),
		},

		{
			objName = 'vesp_glav_door',
			objYaw = 217.0,
			objCoords = vector3(-1112.787, -825.9922, 19.75006)
		}
	}
},

{
	textCoords = vector3(-1057.75, -839.93, 5.11),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'v_ilev_rc_door2',
			objYaw = 217.0,
			objCoords = vector3(-1056.756, -839.1153, 5.303782),
		},

		{
			objName = 'v_ilev_rc_door2',
			objYaw = 38.0,
			objCoords = vector3(-1058.823, -840.6878, 5.304117)
		}
	}
},

{
	textCoords = vector3(-1098.63, -835.57, 19.0),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_door1',
			objYaw = 307.0,
			objCoords = vector3(-1097.784, -836.6095, 19.15298),
		},

		{
			objName = 'vesp_door1',
			objYaw = 127.7,
			objCoords = vector3(-1099.349, -834.5633, 19.15232)
		}
	}
},
{
	textCoords = vector3(-1078.59, -825.64, 11.04),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_door1',
			objYaw = 38.0,
			objCoords = vector3(-1077.576, -824.6953, 11.18247),
		},

		{
			objName = 'vesp_door1',
			objYaw = 216.7,
			objCoords = vector3(-1079.627, -826.2534, 11.18247)
		}
	}
},

{
	textCoords = vector3(-1094.6, -844.51, 19.0),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_door1',
			objYaw = 127.7,
			objCoords = vector3(-1095.555, -843.4783, 19.15072),
		},

		{
			objName = 'vesp_door1',
			objYaw = 307.0,
			objCoords = vector3(-1093.99, -845.525, 19.15072)
		}
	}
},

{
	textCoords = vector3(-1094.03, -844.11, 23.04),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_door1',
			objYaw = 307.0,
			objCoords = vector3(-1093.359, -845.0422, 23.19006),
		},
		
		{
			objName = 'vesp_door1',
			objYaw = 127.7,
			objCoords = vector3(-1094.919, -842.9949, 23.18342)
		}
	}
},

{
	textCoords = vector3(-1092.02, -818.41, 19.04),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_door1',
			objYaw = 217.0,
			objCoords = vector3(-1093.155, -819.2838, 19.18627),
		},

		{
			objName = 'vesp_door1',
			objYaw = 37.7,
			objCoords = vector3(-1091.104, -817.7254, 19.18627)
		}
	}
},

{
	textCoords = vector3(-1092.344, -810.3273, 19.71447),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 3.5,
	size = 1.0,
	doors = {
		{
			objName = 'vesp_glav_door',
			objYaw = 218.0,
			objCoords = vector3(-1092.344, -810.3273, 19.71447)
		},

		{
			objName = 'vesp_glav_door',
			objYaw = 218.0,
			objCoords = vector3(-1094.616, -812.1239, 19.71447)
		},
		{
			objName = 'vesp_glav_door',
			objYaw = 37.10,
			objCoords = vector3(-1092.462, -810.4221, 19.71447)
		},
		{
			objName = 'vesp_glav_door',
			objYaw = 37.10,
			objCoords = vector3(-1090.181, -808.6464, 19.71447)
		}
		
	}
},

{
	textCoords = vector3(-1107.13, -844.40, 19.46),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 3.5,
	size = 1.0,
	doors = {
		{
			objName = 'vesp_glav_door',
			objYaw = 126.5,
			objCoords = vector3(-1109.0, -842.0485, 19.71423)
		},

		{
			objName = 'vesp_glav_door',
			objYaw = 308.0,
			objCoords = vector3(-1107.337, -844.2234, 19.71423)
		},
		{
			objName = 'vesp_glav_door',
			objYaw = 126.5,
			objCoords = vector3(-1107.26, -844.3567, 19.71423)
		},
		{
			objName = 'vesp_glav_door',
			objYaw = 308.0,
			objCoords = vector3(-1105.58, -846.5233, 19.71423)
		}
		
	}
},

{
	textCoords = vector3(-1061.6, -827.73, 19.43),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 5.1,
	size = 1.0,
	doors = {
		{
			objName = 'vesp_glav_door',
			objYaw = 306.0,
			objCoords = vector3(-1060.859, -828.8182, 19.75997)
		},
		{
			objName = 'vesp_glav_door',
			objYaw = 126.5,
			objCoords = vector3(-1112.62, -848.41, 13.44)
		},
		{
			objName = 'vesp_glav_door',
			objYaw = 126.5,
			objCoords = vector3(-1062.487, -826.6122, 19.76167)
		}
	}
},

{
	textCoords = vector3(-1112.01, -847.8, 13.48),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 2.1,
	size = 0.5,
	doors = {
		{
			objName = 'vesp_glav_door',
			objYaw = 126.5,
			objCoords = vector3(-1112.867, -846.8543, 13.81845)
		},

		{
			objName = 'vesp_glav_door',
			objYaw = 306.0,
			objCoords = vector3(-1111.195, -849.0256, 13.81845)
		}
	}
},

{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -143.0,
	objCoords  = vector3(-1087.752, -829.8747, 5.630564),
	textCoords = vector3(-1087.1, -829.774, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.1,
	size = 0.5
},
{
	objName = 'v_ilev_ph_cellgate',
	objYaw = -52.0,
	objCoords  = vector3(-1088.797, -830.2533, 5.630564),
	textCoords = vector3(-1089.1, -829.653, 5.630564),
	authorizedJobs = { 'police','admin' },
	locked = true,
	distance = 1.3,
	size = 0.5
},
---------------------
-- vespucci --
---------------------
]]
--
-- Vanilla Unicorn
--

	{
	objName = 'v_ilev_roc_door2',
	objYaw = 30.0,
	objCoords = vector3(99.42, -1293.08, 29.70),
	textCoords = vector3(99.42, -1293.08, 29.70),
	authorizedJobs = { 'weaponary','admin' },
	locked = true,
	},
	
	{
	objName = 'prop_magenta_door',
	objYaw = -150.0,
	objCoords = vector3(95.44, -1285.15, 29.28),
	textCoords = vector3(95.44, -1285.15, 29.28),
	authorizedJobs = { 'weaponary', 'admin' },
	locked = true,
	},
	
	{
	objName = 'prop_strip_door_01',
	objYaw = 30.0,
	objCoords = vector3(128.32, -1297.99, 29.6),
	textCoords = vector3(128.32, -1297.99, 29.6),
	authorizedJobs = { 'weaponary', 'admin' },
	locked = false,
	},
	
	
	-- Hospital
	{
	objName = 'gabz_pillbox_singledoor',
	objYaw = -200.0,
	objCoords = vector3(309.1337, -597.7515, 43.43391),
	textCoords = vector3(309.1337, -597.7515, 43.43391),
	authorizedJobs = { 'ambulance', 'admin' },
	locked = true,
	},
	
	{
	objName = 'gabz_pillbox_singledoor',
	objYaw = -110.0,
	objCoords = vector3(313.71, -596.22, 43.63391),
	textCoords = vector3(313.71, -596.22, 43.63391),
	authorizedJobs = { 'ambulance', 'admin' },
	locked = true,
	},
	
	{
	objName = 'gabz_pillbox_singledoor',
	objYaw = 340.0,
	objCoords = vector3(360.5034, -589.9995, 43.63391),
	textCoords = vector3(361.01, -589.57, 43.63391),
	authorizedJobs = { 'ambulance', 'admin' },
	locked = true,
	},
	
	{
	objName = 'gabz_pillbox_singledoor',
	objYaw = 250.0,
	objCoords = vector3(355.42, -583.89, 43.63391),
	textCoords = vector3(355.42, -583.89, 43.63391),
	authorizedJobs = { 'ambulance', 'admin' },
	locked = true,
	},
	
	{
	objName = 'gabz_pillbox_singledoor',
	objYaw = 250.0,
	objCoords = vector3(356.81, -580.09, 43.63391),
	textCoords = vector3(356.81, -580.09, 43.63391),
	authorizedJobs = { 'ambulance', 'admin' },
	locked = true,
	},
	
	{
	textCoords = vector3(317.25, -578.96, 43.6339),
	authorizedJobs = { 'ambulance','admin' },
	locked = false,
	distance = 2.5,
	size = 0.5,
	doors = {
		{
			objName = 'gabz_pillbox_doubledoor_r',
			objYaw = -200.0,
			objCoords = vector3(316.0657, -578.3477, 43.43391)
		},

		{
			objName = 'gabz_pillbox_doubledoor_l',
			objYaw = -200.0,
			objCoords = vector3(318.4847, -579.2281, 43.43391)
		}
	}
},
	
-------------------------
--- Government [CityHall]
-------------------------

{
	textCoords = vector3(-545.9, -202.8477, 38.6723),
	authorizedJobs = { 'government','admin' },
	locked = true,
	distance = 2.5,
	size = 0.5,
	doors = {
		{
			objName = 'cls_cityhall_door1',
			objYaw = 30.0,
			objCoords = vector3(-544.5533, -202.8477, 38.3723)
		},

		{
			objName = 'cls_cityhall_door1',
			objYaw = -150.0,
			objCoords = vector3(-546.4586, -203.9476, 38.3723)
		}
	}
},

{
	textCoords = vector3(-582.73, -195.15, 38.6723),
	authorizedJobs = { 'government','admin' },
	locked = true,
	distance = 2.5,
	size = 0.5,
	doors = {
		{
			objName = 'cls_cityhall_door1',
			objYaw = 30.0,
			objCoords = vector3(-581.6995, -194.7372, 38.3723)
		},

		{
			objName = 'cls_cityhall_door1',
			objYaw = -150.0,
			objCoords = vector3(-583.5822, -195.8242, 38.3723)
		}
	}
},



{
	textCoords = vector3(-515.61, -210.32, 38.6723),
	authorizedJobs = { 'government','admin' },
	locked = true,
	distance = 2.5,
	size = 0.5,
	doors = {
		{
			objName = 'cls_cityhall_door1',
			objYaw = 300.0,
			objCoords = vector3(-515.4028, -211.4434, 38.3723)
		},

		{
			objName = 'cls_cityhall_door1',
			objYaw = 120.0,
			objCoords = vector3(-516.4923, -209.5564, 38.3723)
		}
	}
},

{
	textCoords = vector3(-556.55, -228.85, 38.5823),
	authorizedJobs = { 'government','admin' },
	locked = true,
	distance = 2.5,
	size = 0.5,
	doors = {
		{
			objName = 'cls_cityhall_door1',
			objYaw = 300.0,
			objCoords = vector3(-556.08, -228.85, 38.3723)
		},

		{
			objName = 'cls_cityhall_door1',
			objYaw = 120.0,
			objCoords = vector3(-556.9268, -227.7345, 38.3723)
		}
	}
},

{
	objName = 'v_ilev_ra_door2',
	objYaw = 300.0,
	objCoords = vector3(-556.4904, -190.8274, 70.32393),
	textCoords = vector3(-555.4904, -190.8274, 70.22393),
	authorizedJobs = { 'government', 'admin' },
	locked = true,
	},

	{
	objName = 'v_ilev_ra_door2',
	objYaw = 300.0,
	objCoords = vector3(-556.4904, -191.8274, 65.32393),
	textCoords = vector3(-556.72, -191.8274, 65.42393),
	authorizedJobs = { 'government', 'admin' },
	locked = true,
	},

	-- Addons
	--

	--[[
	-- Entrance Gate (Mission Row mod) https://www.gta5-mods.com/maps/mission-row-pd-ymap-fivem-v1
	{
		objName = 'prop_gate_airport_01',
		objCoords  = vector3(420.1, -1017.3, 28.0),
		textCoords = vector3(420.1, -1021.0, 32.0),
		authorizedJobs = { 'police' },
		locked = true,
		distance = 14,
		size = 2
	}
	--]]
}