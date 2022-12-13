
local busy = false
local PlayerData = {}
local losulosu = false
local blipRobbery3
local taked = false
local plate = 'ZS'
local workBlip
local electrician = 1
local clothesOn = false
ESX = nil




AddEventHandler('base', function()
while ESX.GetPlayerData().job.name == 'electrician' do
Citizen.Wait(3000)
	local ped = GetPlayerPed(-1)
		if (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.veh.x, Config.veh.y, Config.veh.z, true) <  25) then
		while (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.veh.x, Config.veh.y, Config.veh.z, true) <  26) do
		Citizen.Wait(3)
		Citizen.Trace('p')
		DrawMarker(Config.MarkerType, Config.veh.x, Config.veh.y, Config.veh.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, true, 2, false, false, false, false)
		DrawMarker(Config.MarkerType, Config.cloth.x, Config.cloth.y, Config.cloth.z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, true, 2, false, false, false, false)
			if (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.veh.x, Config.veh.y, Config.veh.z, true) <  3) then
				if taked and IsPedInAnyVehicle(ped, true) then
				local p = GetVehiclePedIsIn(ped, false)
				if plate == GetVehicleNumberPlateText(p) then
					HelpText('Press ~INPUT_DETONATE~ to return a company vehicle')
				if(IsControlPressed(0,58)) then
				DeleteVehicle(p)
				Citizen.Wait(1528)
				end
				end
			
				elseif not IsPedInAnyVehicle(ped, true) then
	
				HelpText('Press ~INPUT_DETONATE~ to download a company vehicle')
				if(IsControlPressed(0,58)) then
				taked = true
					local vehiclehash = GetHashKey(Config.car)
					RequestModel(vehiclehash)
						while not HasModelLoaded(vehiclehash) do
							Citizen.Wait(10)
						end
					
					local car = CreateVehicle(vehiclehash, Config.veh.x, Config.veh.y, Config.veh.z, 150.5, 1, 0)
					 SetPedIntoVehicle(ped, car, -1)
					 plate = GetVehicleNumberPlateText(car)
					 Citizen.Wait(4000)
					 
				end
				end
				elseif (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.cloth.x, Config.cloth.y, Config.cloth.z, true) <  3) then
				HelpText('Press ~INPUT_DETONATE~ to change')
				if(IsControlPressed(0,58)) then
				
				TriggerEvent('skinchanger:getSkin', function(skin)    
				clothesOn = false				
			if skin.sex == 0 then
			  if skin.tshirt_1 == Config.Uniforms.male.tshirt_1 and skin.torso_1 == Config.Uniforms.male.torso_1 then
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin2)
					TriggerEvent('skinchanger:loadSkin', skin2)
                end)
			else
			
			if Config.Uniforms.male ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.male)
				clothesOn = true
			end
			end

			
		else
		  if skin.tshirt_1 == Config.Uniforms.famale.tshirt_1 and skin.torso_1 == Config.Uniforms.male.torso_1 then
					ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin2)
					TriggerEvent('skinchanger:loadSkin', skin2)
                end)
				else
			if Config.Uniforms[job].female ~= nil then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms.female)
			end
			end

		end
	end)
				Citizen.Wait(2128)
				end
			
			end
		
		end
		end
end
RemoveBlip(workBlip)
clothesOn = false		
end)

Citizen.CreateThread(function()

Citizen.Trace('esx_electricianjob: Init')


	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
 
	PlayerData = ESX.GetPlayerData()
	
	while ESX.GetPlayerData().job.name ~= 'electrician' do
		Citizen.Wait(5120)
	end
		workBlip = AddBlipForCoord(Config.cloth.x, Config.cloth.y, Config.cloth.z)

				SetBlipSprite(workBlip, 354)
				SetBlipScale(workBlip, 1.3)
				SetBlipColour(workBlip, 28)

				PulseBlip(workBlip)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("Electrician\'s changing room")
				EndTextCommandSetBlipName(workBlip)
	TriggerEvent('base')
	
	while ESX.GetPlayerData().job.name == 'electrician' do
	Citizen.Wait(2800)
         

	if clothesOn == true then
				
                

	if  math.random(1, 100) < Config.chance then
	electrician = math.random(1, #Config.electrician)
	electrician = 1
				blipRobbery3 = AddBlipForCoord(Config.electrician[electrician][0].x, Config.electrician[electrician][0].y, Config.electrician[electrician][0].z)

				SetBlipSprite(blipRobbery3, 354)
				SetBlipScale(blipRobbery3, 1.2)
				SetBlipColour(blipRobbery3, 71)

				PulseBlip(blipRobbery3)
				BeginTextCommandSetBlipName("STRING")
				AddTextComponentString("Electrical network failure")
				EndTextCommandSetBlipName(blipRobbery3)
				HelpText('I need an electrician!')
				SetNewWaypoint(Config.electrician[electrician][0].x, Config.electrician[electrician][0].y)
				busy = true
	end
	end
	
	
	
	local ped = GetPlayerPed(-1)
		
			--busy = true
			
			
		if busy then
		while busy do
			Citizen.Wait(2)
			local fpf = Config.fixPerFix
			local now = 1
			local clicked = false
			local once = false
			local color = 0
				while (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.electrician[electrician][1].x, Config.electrician[electrician][1].y, Config.electrician[electrician][1].z, true) <  112) and busy do	
						
						Citizen.Wait(2)				
						DrawMarker(2, Config.electrician[electrician][0].x, Config.electrician[electrician][0].y, Config.electrician[electrician][0].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 80, false, true, 2, false, false, false, false)
						DrawMarker(Config.MarkerType, Config.electrician[electrician][1].x, Config.electrician[electrician][1].y, Config.electrician[electrician][1].z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColorR.r, Config.MarkerColorR.g, Config.MarkerColorR.b, 80, false, true, 2, false, false, false, false)
						DrawMarker(Config.MarkerType, Config.electrician[electrician][2].x, Config.electrician[electrician][2].y, Config.electrician[electrician][2].z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColorG.r, Config.MarkerColorG.g, Config.MarkerColorG.b, 80, false, true, 2, false, false, false, false)
						DrawMarker(Config.MarkerType, Config.electrician[electrician][3].x, Config.electrician[electrician][3].y, Config.electrician[electrician][3].z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColorB.r, Config.MarkerColorB.g, Config.MarkerColorB.b, 80, false, true, 2, false, false, false, false)
						DrawMarker(Config.MarkerType, Config.electrician[electrician][4].x, Config.electrician[electrician][4].y, Config.electrician[electrician][4].z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColorY.r, Config.MarkerColorY.g, Config.MarkerColorY.b, 80, false, true, 2, false, false, false, false)
						DrawMarker(Config.MarkerType, Config.electrician[electrician][5].x, Config.electrician[electrician][5].y, Config.electrician[electrician][5].z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColorPu.r, Config.MarkerColorPu.g, Config.MarkerColorPu.b, 80, false, true, 2, false, false, false, false)
						DrawMarker(Config.MarkerType, Config.electrician[electrician][6].x, Config.electrician[electrician][6].y, Config.electrician[electrician][6].z - 1.0, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.2, 1.2, Config.MarkerColorPi.r, Config.MarkerColorPi.g, Config.MarkerColorPi.b, 80, false, true, 2, false, false, false, false)
						
						
						if (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.electrician[electrician][0].x, Config.electrician[electrician][0].y, Config.electrician[electrician][0].z, true) <  4) and busy then
							if not clicked then
							clicked = true
							color = math.random(1, #Config.electrician)
							once = false
							end
							if color == 1 then
							HelpText("Repair ~r~ red ~s~ inverter!")
							elseif color == 2 then
							HelpText("Repair  ~g~green ~s~ inverter!")
							elseif color == 3 then
							HelpText("Repair ~b~blue ~s~ inverter!")
							elseif color == 4 then
							HelpText("Repair ~y~yellow ~s~ inverter!")
							elseif color == 5 then
							HelpText("Repair ~p~violet ~s~ inverter!")
							elseif color == 6 then
							HelpText("Repair ~o~orange ~s~ converter!")
							end
						
						
						end
						
						for i = 1, 6 do
							if not once and (GetDistanceBetweenCoords(GetEntityCoords(ped), Config.electrician[electrician][i].x, Config.electrician[electrician][i].y, Config.electrician[electrician][i].z, true) <  2) then
								HelpText('Press ~INPUT_DETONATE~ to repair a broken inverter')
									if(IsControlPressed(0,58)) then
										TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_HAMMERING", 0, false)
										Citizen.Wait(Config.fixingTime * 1000)
										clicked = false
										once = true
										if i == color then
										ClearPedTasks(ped)
										fpf = fpf - 1
										if fpf == 0 then break end
										else
										Citizen.Wait(2000)									
										if Config.BOOM == true then
										AddExplosion(Config.electrician[electrician][i].x, Config.electrician[electrician][i].y, Config.electrician[electrician][i].z, 71, 2.8, true, true, 2.1)																				
										end
										Citizen.Wait(2000)
										HelpText('~r~Burned~s~ the inverter!!')
										ClearPedTasks(ped)
										Citizen.Wait(4000)
										RemoveBlip(blipRobbery3)
										HelpText('Someone else will fix this failure...')
										busy = false
										fpf = Config.fixPerFix
										Citizen.Wait(Config.Cooldown * 1000)
										end
										
									end
							end
						end
						
						if fpf == 0 then
						RemoveBlip(blipRobbery3)
							HelpText('The power grid has been repaired!')
							Citizen.Wait(4000)
							HelpText('You earned ~g~' .. Config.prize .. ' $')
							TriggerServerEvent('esx_electricianjob:cash', Config.prize)
							fpf = Config.fixPerFix
							Citizen.Wait(Config.Cooldown * 1000)
							busy = false
						end
						
				end
			end
			end
				
			
			
		
		
		
	end
		--	Citizen.Wait(5 * 60000)
			--	RemoveBlip(blipRobbery3)
end)
	function HelpText(text)
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, 0, 0, -1)
end