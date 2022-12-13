local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData              = {}
local iniziato = false
local statagliando = false
local JobBlips = {}
local assi = false
local inservizio = false
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
	refreshBlips()
end)

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
	refreshBlips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	deleteBlips()
	refreshBlips()
	
	
	Citizen.Wait(5000)
end)

function deleteBlips()
	if JobBlips[1] ~= nil then
		for i=1, #JobBlips, 1 do
			RemoveBlip(JobBlips[i])
			JobBlips[i] = nil
		end
	end
end

function animazione()
	local ped = PlayerPedId()

	RequestAnimDict("melee@hatchet@streamed_core")
	while (not HasAnimDictLoaded("melee@hatchet@streamed_core")) do Citizen.Wait(0) end
	Wait(1500)

	TaskPlayAnim(ped, "melee@hatchet@streamed_core", "plyr_front_takedown", 8.0, -8.0, -1, 0, 0, false, false, false) 
end

function animazione2()
	local ped = PlayerPedId()

	RequestAnimDict("melee@hatchet@streamed_core")
	while (not HasAnimDictLoaded("melee@hatchet@streamed_core")) do Citizen.Wait(0) end
	Wait(1500)

	TaskPlayAnim(ped, "melee@hatchet@streamed_core", "plyr_front_takedown_b", 8.0, -8.0, -1, 0, 0, false, false, false) 
end

function animazionetavole()
	local ped = PlayerPedId()
	local prop_name = prop_name or 'prop_cs_cardbox_01'
	tavola = CreateObject(GetHashKey(prop_name), -501.38, 5280.53, 79.61, true, true, true)

	RequestAnimDict("anim@heists@box_carry@")
	while (not HasAnimDictLoaded("anim@heists@box_carry@")) do Citizen.Wait(0) end
	Wait(1500)

	TaskPlayAnim(ped, "anim@heists@box_carry@", "idle", 8.0, -8.0, -1, 0, 0, false, false, false)
	AttachEntityToEntity(tavola, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1) 
	Wait(5000)
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, false)
	DetachEntity(tavola, false, false)
	PlaceObjectOnGroundProperly(tavola)
	Wait(15000)
	DeleteEntity(tavola)
	ClearPedTasksImmediately(PlayerPedId())
end

tagliato = false
tagliato2 = false
tagliato3 = false
tagliato4 = false
tagliato5 = false
tagliato6 = false
tagliato7 = false
tagliato8 = false
tagliato9 = false
tagliato10 = false

function armadietto()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom',
	{
		title    = 'Cloakroom',
		elements = {
			{label = 'Citizen Clothes',     value = 'job_wear'},
			{label = 'Off-Service', value = 'citizen_wear'}
		}
	}, function(data, menu)
		if data.current.value == 'citizen_wear' then
			inservizio = false
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		elseif data.current.value == 'job_wear' then
			inservizio = true
				TriggerEvent('skinchanger:getSkin', function(skin)
  
					if skin.sex == 0 then
			
					  local clothesSkin = {
						['tshirt_1'] = 15, ['tshirt_2'] = 0, 
						['torso_1'] = 43, ['torso_2'] = 0,
						['decals_1'] = 0, ['decals_2'] = 0,
						['arms'] = 11,
						['pants_1'] = 47, ['pants_2'] = 1,
						['shoes_1'] = 54, ['shoes_2'] = 0
					  }
					  TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
					end
				end)
				TriggerEvent('mt:missiontext', 'Pick up the truck', 3000)
			--end
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			
			if GetDistanceBetweenCoords(coords, 1200.63, -1276.87, 34.38, true) < 15.0 then
			    DrawMarker(20, 1200.63, -1276.87, 35.38, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, 1200.63, -1276.87, 34.38, true) < 1.75 then
					drawTxt('~b~Press ~g~E~b~ for interact')
					if IsControlJustReleased(1, 51) then
						armadietto()
						
					end
			    end
		    end
		
		end
	end
end)

---- MRN EDIT	
	


Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			
			if GetDistanceBetweenCoords(coords, -673.82, 5787.53, 17.34, true) < 15.0 then
			    DrawMarker(20, -673.82, 5787.53, 17.34, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, -673.82, 5787.53, 17.34, true) < 1.75 then
					drawTxt('~b~Press ~g~E~b~ for sell ')
					if IsControlJustReleased(1, 51) then
						--peds_seller()
						TriggerServerEvent('mrn:sell')
					end
			    end
		    end
		
		end
	end
end)


RegisterNetEvent('mrn:unfreeze')
AddEventHandler('mrn:unfreeze', function()
local playerPed = PlayerPedId()
FreezeEntityPosition(GetPlayerPed(-1), false)

end)



RegisterNetEvent('mrn:anim')
AddEventHandler('mrn:anim', function()

	local playerPed = PlayerPedId()
	local lib, anim = 'gestures@m@standing@casual', 'gesture_easy_now'
	FreezeEntityPosition(playerPed, true)
	ESX.Streaming.RequestAnimDict(lib, function()
	TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
end)
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("a_m_m_hillbilly_01"))
    while not HasModelLoaded(GetHashKey("a_m_m_hillbilly_01")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("a_m_m_hillbilly_01"), -673.32, 5786.53, 16.3, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)



---------------------------





---------------------------

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed, true)

		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then
			if (GetDistanceBetweenCoords(pos, -534.32, 5373.79, 69.50) < 15.0) then
				if not iniziato and inservizio and IsPedSittingInAnyVehicle(playerPed) then
					local cVeh = GetVehiclePedIsUsing(playerPed, false)
					local vehicle = GetHashKey('Phantom')
					if GetEntityModel(cVeh) == vehicle then
					DrawMarker(11, -534.32, 5373.79, 70.50, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 0, 255, 0, 150, 0, true, 2, 0, 0, 0, 0)
					if (GetDistanceBetweenCoords(pos, -534.32, 5373.79, 69.50) < 2.75) then
						drawTxt('~b~Press ~g~E~b~ for start work')
						if IsControlJustReleased(1, 51) then
							ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
								local futuroinventario = math.floor(quantity + Config.Wood )
								if quantity <= 250 and futuroinventario <= 250 then
							iniziato = true
							TriggerEvent('mt:missiontext', 'Destroy ~g~10~w~ trees that you find in front of you!', 10000)
							local prop_name = prop_name or 'Prop_Tree_Cedar_03'
							albero = CreateObject(GetHashKey(prop_name), -511.607, 5401.295, 72.904,  true, true, true)
							FreezeEntityPosition(albero, true)
							albero2 = CreateObject(GetHashKey(prop_name), -499.199, 5390.437, 74.658,  true, true, true)
							FreezeEntityPosition(albero2, true)
							albero3 = CreateObject(GetHashKey(prop_name), -487.308, 5391.439, 75.976,  true, true, true)
							FreezeEntityPosition(albero3, true)
							albero4 = CreateObject(GetHashKey(prop_name), -516.813, 5382.376, 69.32,  true, true, true)
							FreezeEntityPosition(albero4, true)
							albero5 = CreateObject(GetHashKey(prop_name), -519.28, 5390.956, 69.314,  true, true, true)
							FreezeEntityPosition(albero5, true)
							albero6 = CreateObject(GetHashKey(prop_name), -520.488, 5396.993, 70.954,  true, true, true)
							FreezeEntityPosition(albero6, true)
							albero7 = CreateObject(GetHashKey(prop_name), -489.21, 5387.261, 75.823,  true, true, true)
							FreezeEntityPosition(albero7, true)
							albero8 = CreateObject(GetHashKey(prop_name), -483.748, 5387.838, 76.445,  true, true, true)
							FreezeEntityPosition(albero8, true)
							albero9 = CreateObject(GetHashKey(prop_name), -489.176, 5396.343, 75.545,  true, true, true)
							FreezeEntityPosition(albero9, true)
							albero10 = CreateObject(GetHashKey(prop_name), -466.356, 5396.036, 77.17,  true, true, true)
							FreezeEntityPosition(albero10, true)
							else
							TriggerEvent('mt:missiontext', '~r~ FULL INVENTORY', 10000)
							end
						end, 'wood')
					end
					end
				end
				end
			end
		end

		while iniziato do
			local coords = GetEntityCoords(GetPlayerPed(-1))

			Citizen.Wait(5)
				if(GetDistanceBetweenCoords(coords, -512.53, 5401.51, 74.779, true) < 15.0) and not tagliato then  
					DrawMarker(20, -512.53, 5401.51, 74.779, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -512.53, 5401.51, 74.779, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -512.53, 5401.51, 74.779-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 248.867)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato = true 
							 SetCurrentPedWeapon(playerPed, GetHashKey("WEAPON_HATCHET"), false)
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -500.231, 5390.323, 76.548, true) < 15.0) and not tagliato2 then  
					DrawMarker(20, -500.231, 5390.323, 76.548, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -500.231, 5390.323, 76.548, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -500.231, 5390.323, 76.548-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 275.492)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato2 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero2, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero2, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -488.37, 5391.05, 77.902, true) < 15.0) and not tagliato3 then  
					DrawMarker(20, -488.37, 5391.05, 77.902, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -488.37, 5391.05, 77.902, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -488.37, 5391.05, 77.902-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 283.681)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato3 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero3, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero3, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -520.694, 5390.795, 71.12, true) < 15.0) and not tagliato5 then  
					DrawMarker(20, -520.694, 5390.795, 71.12, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -520.694, 5390.795, 71.12, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -520.694, 5390.795, 71.12-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 279.34)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato5 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero5, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero5, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -518.188, 5381.749, 71.158, true) < 15.0) and not tagliato4 then  
					DrawMarker(20, -518.188, 5381.749, 71.158, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -518.188, 5381.749, 71.158, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -518.188, 5381.749, 71.158-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 290.974)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato4 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero4, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero4, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -521.541, 5396.87, 72.725, true) < 15.0) and not tagliato6 then  
					DrawMarker(20, -521.541, 5396.87, 72.725, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -521.541, 5396.87, 72.725, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -521.541, 5396.87, 72.725-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 276.57)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato6 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero6, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero6, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -490.393, 5387.453, 77.673, true) < 15.0) and not tagliato7 then  
					DrawMarker(20, -490.393, 5387.453, 77.673, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -490.393, 5387.453, 77.673, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -490.393, 5387.453, 77.673-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 253.624)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato7 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero7, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero7, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -484.889, 5388.283, 78.306, true) < 15.0) and not tagliato8 then  
					DrawMarker(20, -484.889, 5388.283, 78.306, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -484.889, 5388.283, 78.306, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -484.889, 5388.283, 78.306-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 241.943)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato8 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero8, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero8, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -490.305, 5396.294, 77.419, true) < 15.0) and not tagliato9 then  
					DrawMarker(20, -490.305, 5396.294, 77.419, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -490.305, 5396.294, 77.419, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -490.305, 5396.294, 77.419-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 268.013)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato9 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero9, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero9, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
				if(GetDistanceBetweenCoords(coords, -467.563, 5396.129, 79.102, true) < 15.0) and not tagliato10 then  
					DrawMarker(20, -467.563, 5396.129, 79.102, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 15, 15, 150, 0, true, 2, 0, 0, 0, 0)
					if(GetDistanceBetweenCoords(coords, -467.563, 5396.129, 79.102, true) < 1.0) then
                        drawTxt('~b~Press ~g~E~b~ for cut tree')
						if IsControlJustPressed(0, 38) then
							SetEntityCoords(GetPlayerPed(-1), -467.563, 5396.129, 79.102-0.95) 
							SetEntityHeading(GetPlayerPed(-1), 256.945)
							FreezeEntityPosition(playerPed, true)
							GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
							 tagliato10 = true 
							 animazione()
							 Wait(2000)
							 animazione()
							 Wait(2000)
							 animazione2()
							 Wait(2000)
							 SetEntityRotation(albero10, 10.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 20.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 30.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 40.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 50.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 60.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 70.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 SetEntityRotation(albero10, 80.0, -0, 85.0, false, true)
							 Citizen.Wait(100)
							 FreezeEntityPosition(playerPed, false)
							 RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
						end
					end
				end
			if tagliato == true and tagliato2 == true and tagliato3 == true and tagliato4 == true and tagliato5 == true and tagliato6 == true and tagliato7 == true and tagliato8 == true and tagliato9 == true and tagliato10 == true then
				DeleteObject(albero)
				DeleteObject(albero2)
				DeleteObject(albero3)
				DeleteObject(albero4)
				DeleteObject(albero5)
				DeleteObject(albero6)
				DeleteObject(albero7)
				DeleteObject(albero8)
				DeleteObject(albero9)
				DeleteObject(albero10)
				
				RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
				Wait(1000)
				TriggerServerEvent('esx_lumberjackjob:legnatagliata')
				iniziato = false
				tagliato = false
				tagliato2 = false
				tagliato3 = false
				tagliato4 = false
				tagliato5 = false
				tagliato6 = false
				tagliato7 = false
				tagliato8 = false
				tagliato9 = false
				tagliato10 = false
				TriggerEvent('mt:missiontext', 'If you want to cut down other trees go back to point 1!', 10000)
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed, true)
		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then
			if (GetDistanceBetweenCoords(pos, -554.42, 5370.554, 70.317) < 15.0) and not statagliando and not iniziato and inservizio then
				DrawMarker(12, -554.42, 5370.554, 70.317, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 0, 255, 0, 150, 0, true, 2, 0, 0, 0, 0)
				if (GetDistanceBetweenCoords(pos, -554.42, 5370.554, 70.317) < 0.75) then
					drawTxt('~b~Press ~g~E~b~ for cut wood')
					if IsControlJustReleased(0, Keys['E']) then
						statagliando = true
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity <= 250 then
						        ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity >= 100 then
										ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
											local futuroinventario2 = math.floor(quantity + 100)
											if futuroinventario2 <= 250 then
											  --statagliando = true
										      SetEntityCoords(GetPlayerPed(-1), -554.42, 5370.554, 70.317-0.95) 
							                  SetEntityHeading(GetPlayerPed(-1), 256.706)
										      GiveWeaponToPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"),0, true, true)
										      FreezeEntityPosition(playerPed, true)
										      animazione()
						                      Wait(2000)
						                      animazione()
						                      Wait(2000)
						                      animazione()
										      Wait(2000)
										      animazione()
						                      Wait(2000)
						                      animazione()
										      Wait(2000)
										      FreezeEntityPosition(playerPed, false)
										      RemoveWeaponFromPed(PlayerPedId(), GetHashKey("WEAPON_HATCHET"), true, true)
											  TriggerServerEvent('esx_lumberjackjob:segatura')
											  Wait(5000)
										      statagliando = false
									        else
											  TriggerEvent('mt:missiontext', '~r~ FULL INVENTORY', 10000)
											  Wait(5000)
										      statagliando = false
									        end
								        end, 'cutted_wood')
									else
										TriggerEvent('mt:missiontext', '~r~YOU NEED 100 PIECES OF WOOD', 10000)
										Wait(5000)
										statagliando = false
									end
								end, 'wood')
					        else
							    TriggerEvent('mt:missiontext', '~r~ FULL INVENTORY', 10000)
							    Wait(5000)
							    statagliando = false
						    end
					    end, 'cutted_wood')
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	while true do
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed, true)
		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then
			if (GetDistanceBetweenCoords(pos, -501.38, 5280.53, 79.61) < 15.0) and not iniziato and not assi and inservizio then
				DrawMarker(13, -501.38, 5280.53, 80.61, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 0, 255, 0, 150, 0, true, 2, 0, 0, 0, 0)
				if (GetDistanceBetweenCoords(pos, -501.38, 5280.53, 79.61) < 0.75) then
					drawTxt('~b~Press ~g~E~b~ to get tables')
					if IsControlJustReleased(0, Keys['E']) then
						assi = true
						ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
							if quantity <= 250 then
								ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
									if quantity >= 100 then
										ESX.TriggerServerCallback('esx_ambulancejob:getItemAmount', function(quantity)
											local futuroinventario3 = math.floor(quantity + 100)
											if futuroinventario3 <= 250 then
												--Wait(1000)
										        FreezeEntityPosition(playerPed, true)
										        --assi = true
										        SetEntityCoords(GetPlayerPed(-1), -502.158, 5280.791, 80.618-0.95) 
							                    SetEntityHeading(GetPlayerPed(-1), 248.593)
										        animazionetavole()
												TriggerServerEvent('esx_lumberjackjob:tavole')
												Wait(5000)
										        assi = false
										        FreezeEntityPosition(playerPed, false)
									        else
												TriggerEvent('mt:missiontext', '~r~ FULL INVENTORY', 10000)
												Wait(5000)
								                assi = false
									        end
								        end, 'packaged_plank')
									else
										TriggerEvent('mt:missiontext', '~r~ IMPOSSIBLE', 10000)
										Wait(5000)
								        assi = false
									end
								end, 'cutted_wood')
					        else
								TriggerEvent('mt:missiontext', '~r~ FULL INVENTORY', 10000)
								Wait(5000)
								assi = false
						    end
					    end, 'packaged_plank')
					end
				end
			end
		end
		Citizen.Wait(0)
	end
end)

--function piastacazzodemacchina()
--	ESX.UI.Menu.Open(
--	  'default', GetCurrentResourceName(), 'prendi_veicolo',
--	  {
--		  title    = 'Lumberjack',
--		  elements = {
--			  {label = 'Truck', value = 'uno'},
--		  }
--	  },
--	  function(data, menu)
--		  local val = data.current.value
		  
---			if val == 'uno' then
--			menu.close()
--			
			
			
--			SpawnTruck()
			--local vehicle = GetHashKey('MULE')
			--RequestModel(vehicle)
			--while not HasModelLoaded(vehicle) do
			--Wait(1)
			--end
			--spawned_car = CreateVehicle(vehicle,1188.206, -1286.56, 35.201,86.187, true, false)
			--SetVehicleHasBeenOwnedByPlayer(spawned_car,true)
			--local id = NetworkGetNetworkIdFromEntity(spawned_car)
			--SetNetworkIdCanMigrate(id, true)
			--SetEntityInvincible(spawned_car, false)
			--SetVehicleOnGroundProperly(spawned_car)
			--SetVehicleNumberPlateText(spawned_car,"LEGNA")
			--TriggerEvent('mt:missiontext', 'Now go to ~g~Tree ~w~ with the truck.', 10000)
			--SetEntityAsMissionEntity(spawned_car, true, true)
			--SetModelAsNoLongerNeeded(vehicle)
			--Citizen.InvokeNative(0xB736A491E64A32CF, Citizen.PointerValueIntInitialized(spawned_car))
--		  end
--	  end,
--	  function(data, menu)
--		  menu.close()
--	  end
--  )
--  end
  
  
  
  
function piastacazzodemacchina()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'prendi_veicolo',
        {
            title    = 'Lumberjack',
            elements = {
				{label = 'Truck', value = 'car'},

            }
        },
        function(data, menu)
            if data.current.value == 'car' then
			   SpawnTruck()
			   menu.close()
            
            end
        end,
        function(data, menu)
            menu.close()
        end
    )
end

function SpawnTruck()
	local myPed = GetPlayerPed(-1)
	local player = PlayerId()
    local vehicle = GetHashKey(Config.CarModel)
    local trailer = GetHashKey(Config.CarTrailer)

    RequestModel(vehicle)
    RequestModel(trailer)
    

	while not HasModelLoaded(vehicle) do
		Wait(1)
    end
    while not HasModelLoaded(trailer) do
		Wait(1)
	end

	local coords = 263.9, -1441.30, 29.20
    spawned_truck = CreateVehicle(vehicle, 1187.80, -1285.84, 35.16, 266.85, 116.613, 78.69622, true, false)
    spawn_trailer = CreateVehicle(trailer, 1187.80, -1285.84, 35.16, 266.85, 116.613, 78.69622, true, false)
    AttachVehicleToTrailer(spawned_truck,spawn_trailer)
end




---------------------




Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			
			if GetDistanceBetweenCoords(coords, 1194.62, -1286.95, 34.12, true) < 15.0 and inservizio then
			    DrawMarker(39, 1194.62, -1286.95, 35.12, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 2.5, 0, 255, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, 1194.62, -1286.95, 34.12, true) < 1.75 then
					drawTxt('~b~Press ~g~E~b~ for pick-up the truck')
					if IsControlJustReleased(1, 51) then
						piastacazzodemacchina()
					end
			    end
		    end
		
		end
	end
end)

Citizen.CreateThread(function()
	while true do

		Citizen.Wait(1)

		if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			
			if GetDistanceBetweenCoords(coords, 1216.89, -1229.23, 34.40, true) < 15.0 and inservizio then
			    DrawMarker(39, 1216.89, -1229.23, 35.40, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.5, 2.5, 2.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, 1216.89, -1229.23, 34.40, true) < 1.75 then
					drawTxt('~b~Press ~g~E~b~ for store truck')
					if IsControlJustReleased(1, 51) then
						TriggerEvent('esx:deleteVehicle', "mule")
					end
			    end
		    end
		
		end
	end
end)



function drawTxt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end

function drawTxt(text)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(0.32, 0.32)
	SetTextColour(0, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.5, 0.93)
  end

function refreshBlips()

	if PlayerData.job ~= nil and PlayerData.job.name == 'lumberjack' then

        for k,v in pairs(Config.Zones) do
		  
		    for i = 1, #v.Pos, 1 do
		
			local blip = AddBlipForCoord(v.Pos[i].x, v.Pos[i].y, v.Pos[i].z)
		
			SetBlipSprite (blip, 237)
			SetBlipDisplay(blip, 4)
		    SetBlipScale  (blip, 0.6)
		    SetBlipColour (blip, 17)
		    SetBlipAsShortRange(blip, true)
		    BeginTextCommandSetBlipName("STRING")
		    AddTextComponentString(v.Pos[i].nome)
			EndTextCommandSetBlipName(blip)
			table.insert(JobBlips, blip)
		    end
		end
	end
end
