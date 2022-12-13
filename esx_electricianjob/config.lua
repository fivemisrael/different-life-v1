Config = {}
Config.electrician = {[1] = {[0] = {x = 2296.0, y = 2943.8, z = 46.6}, [1] = {x = 2279.5, y = 2952.6, z = 46.8}, [2] = {x = 2275.1, y = 2965.6, z = 46.8}, [3] = {x = 2262.4, y = 2972.6, z = 46.7}, [4] = {x = 2275.5, y = 2972.6, z = 46.7}, [5] = {x = 2296.05, y = 2972.6, z = 46.7}, [6] = {x = 2285.2, y = 2972.7, z = 46.7}  }, [2] = {[0] = {x = 2579.8, y = 5060.8, z = 45.0}, [1] = {x = 2591.9, y = 5067.6, z = 45.0}, [2] = {x = 2585.1, y = 5065.6, z = 45.1}, [3] = {x = 2589.8, y = 5057.6, z = 44.9}, [4] = {x = 2595.4, y = 5059.353, z = 45.0}, [5] = {x = 2594.5, y = 5064.8, z = 45.0}, [6] = {x = 2584.2, y = 5061.7, z = 45.0}}, [2] = {[0] = {x = 750.5, y = -1916.8, z = 29.20}, [1] = {x = 752.9, y = -1942.6, z = 29.10}, [2] = {x = 724.9, y = -1930.3, z = 29.1}, [3] = {x = 748.6, y = -1937.7, z = 29.1}, [4] = {x = 749.8, y = -1925.253, z = 29.0}, [5] = {x = 755.7, y = -1938.2, z = 29.0}, [6] = {x = 756.1, y = -1926.3, z = 29.2}}, [3] = {[0] = {x = 712.6, y = 163.7, z = 80.7}, [1] = {x = 689.9, y = 148.6, z = 80.9}, [2] = {x = 684.6, y = 167.9, z = 80.8}, [3] = {x = 687.4, y = 123.6, z = 80.7}, [4] = {x = 697.5, y = 104.8, z = 80.7}, [5] = {x = 672.8, y = 109.2, z = 80.9}, [6] = {x = 703.8, y = 120.5, z = 80.7}}, [4] = {[0] = {x = -390.5, y = 1136.9, z = 322.6}, [1] = {x = -387.0, y = 1142.2, z = 322.6}, [2] = {x = -390.8, y = 1127.7, z = 322.6}, [3] = {x = -386.8, y = 1130.36, z = 322.7}, [4] = {x = -390.45, y = 1131.6, z = 322.6}, [5] = {x = -392.4, y = 1133.7, z = 322.7}, [6] = {x = -384.7, y = 1138.2, z = 322.6}  }} -- lokalizacje elektrowni, jeśli jesteś masochistą to możesz się tym pobawić w innym przypadku nie tykaj
Config.fixPerFix = 3	-- how many inverters need to be repaired in one job
Config.prize = 18		--nagroda za pomyślną naprawę elektrowni
Config.chance = 95 -- chance of network failure (less so less often)
Config.cloth = {x = 679.7, y = 74.5, z = 83.2} -- coordy przebieralni
Config.veh = {x = 686.9, y = 66.5, z = 83.2} -- coordy spawnu pojazdu
Config.car = 'Boxville' -- samochód służbowy
Config.fixingTime = 6 -- jak długo wali się młotkiem
Config.BOOM = false -- czy jesli gracz sie pomyli to przetwornica wybycha (true lub false)
Config.Cooldown = 128 -- how many seconds after repairing the network do you have no orders for the next order



Config.Uniforms = {										--ubrania robocze
		male = {										
			['tshirt_1'] = 59,  ['tshirt_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 27,   ['pants_2'] = 1,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['bags_1'] = 41
		},
		female = {										-- można ustawić inne ubranie dla kobiety
			['tshirt_1'] = 59,  ['tshirt_2'] = 0,
			['torso_1'] = 43,   ['torso_2'] = 0,
			['arms'] = 37,
			['pants_1'] = 27,   ['pants_2'] = 1,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['bags_1'] = 41
		}}


		--ustawienia markerów
		
Config.Radius = 2.1
Config.MarkerType   = 1
Config.DrawDistance = 28.0
Config.MarkerType   = 1
Config.MarkerSize   = {x = 2.5, y = 2.5, z = 1.4}
-- kolorki markerów w elektrowni
Config.MarkerColor  = {r = 60, g = 64, b = 2} -- marker z zadaniem
Config.MarkerColorR  = {r = 220, g = 4, b = 2} -- czerwony
Config.MarkerColorG  = {r = 3, g = 220, b = 2} -- zielony
Config.MarkerColorB  = {r = 0, g = 4, b = 220} -- niebieski
Config.MarkerColorY  = {r = 220, g = 214, b = 2} -- żółty
Config.MarkerColorPu  = {r = 150, g = 2, b = 254} -- fioletowy
Config.MarkerColorPi  = {r = 205, g = 132, b = 0} -- pomarańczowy
