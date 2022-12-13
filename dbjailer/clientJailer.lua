local cJ = false
local eJE = false

local isinjail = false


--ESX base

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
	while true do
		if isinjail then
			DisableAllControlActions(0)
			-- have to add actions camera + w, a, d, s
			for i = 0, 6 do
				EnableControlAction(0, i, true)
			end
			for i = 30, 31 do
				EnableControlAction(0, i, true)
			end
		end
		Wait(isinjail and 0 or 1000)
	end
end)

RegisterNetEvent("JP1")
AddEventHandler("JP1", function(jT)
	isinjail = true
	Citizen.Trace('Sent To Jail Cell 1')
	if cJ == true then
		return
	end
	local pP = GetPlayerPed(-1)
	local player = PlayerId()
	if DoesEntityExist(pP) then
			
		Citizen.CreateThread(function()
			local playerOldLoc = GetEntityCoords(pP, true)
			SetEntityCoords(pP, 1641.64, 2571.08, 45.56)--{x = 459.5500793457,y = -994.46508789063,z = 23.914855957031 },
			cJ = true
			eJE = false
			while jT > 0 and not eJE do
				timecheck(jT)
				pP = GetPlayerPed(-1)
			--	RemoveAllPedWeapons(pP, true)
			--	SetPlayerControl(PlayerId(), false, 0)
				DisableAllControlActions(0)
				DisablePlayerFiring(pP,true)
				SetEntityInvincible(pP, true)
				if IsPedInAnyVehicle(pP, false) then
					ClearPedTasksImmediately(pP)
				end
				if jT % 60 == 0 then
				exports.pNotify:SetQueueMax("left", 1)
			        exports.pNotify:SendNotification({
			            text = "You have " .. jT / 60 .. " months left until release." ,
			            type = "error",
			            timeout = math.random(1000, 10000),
			            layout = "centerLeft",
			            queue = "left"
			        })
				end
				Citizen.Wait(500)
				local pL = GetEntityCoords(pP, true)
				local D = Vdist(1641.64, 2571.08, 45.56, pL['x'], pL['y'], pL['z'])
				if D > 2 then -- distance#######################################################################################
					
					SetEntityCoords(pP, 1641.64, 2571.08, 45.56)
					if D > 4 then
						jT = jT + 60
						if jT > 1500 then
							jT = 1500
						end
						Citizen.Trace('GUESS I TRIED ESCAPING')
						TriggerEvent('chatMessage', 'COURT', { 255, 0, 0 }, "AdminJail time increased for attempted escape!")
					end
				end
				jT = jT - 0.5
			end
		--	Citizen.Trace('IM FREE')
			isinjail = false
			TriggerServerEvent('JailReleaseTime') -- UDPATE DB TO RELESE PLAYER
			TriggerServerEvent('chatMessageEntered', "SYSTEM", { 255, 0, 0 }, GetPlayerName(PlayerId()) .." was released from AdminJail.")
			SetEntityCoords(pP, 1917.51, 2599.72, 46.09)--{x = 432.95864868164,y = -981.41455078125,z = 29.710334777832 },
			cJ = false
			SetEntityInvincible(pP, false)
			SetPlayerControl(PlayerId(), true, 0)
		end)
	end
end)

RegisterNetEvent("JP2")
AddEventHandler("JP2", function(jT)
	if cJ == true then
		return
	end
	local pP = GetPlayerPed(-1)
	if DoesEntityExist(pP) then
		
		Citizen.CreateThread(function()
			local playerOldLoc = GetEntityCoords(pP, true)
			SetEntityCoords(pP, 458.41693115234, -997.93572998047, 23.914854049683)-- {x = 458.41693115234,y = -997.93572998047,z = 23.914854049683 },
			cJ = true
			eJE = false
			while jT > 0 and not eJE do
				timecheck(jT)
				pP = GetPlayerPed(-1)
			--	RemoveAllPedWeapons(pP, true)
				SetEntityInvincible(pP, true)
				if IsPedInAnyVehicle(pP, false) then
					ClearPedTasksImmediately(pP)
				end
				if jT % 30 == 0 then
					TriggerEvent('chatMessage', 'SYSTEM', { 255, 0, 0 }, jT .." seconds until release.")
				end
				Citizen.Wait(500)
				local pL = GetEntityCoords(pP, true)
				local D = Vdist(458.41693115234, -997.93572998047, 23.914854049683, pL['x'], pL['y'], pL['z'])
				if D > 2 then
					SetEntityCoords(pP, 458.41693115234, -997.93572998047, 23.914854049683)
					if D > 4 then
						jT = jT
						if jT > 1500 then
							jT = 1500
						end
						TriggerEvent('chatMessage', 'COURT', { 255, 0, 0 }, "attempted escape!")
					end
				end
				jT = jT - 0.5
			end
			TriggerServerEvent('JailReleaseTime') -- UDPATE DB TO RELESE PLAYER
			TriggerServerEvent('chatMessageEntered', "SYSTEM", { 255, 0, 0 }, GetPlayerName(PlayerId()) .." was released from prison.")
			SetEntityCoords(pP, 432.95864868164, -981.41455078125, 29.710334777832)
			cJ = false
			SetEntityInvincible(pP, false)
		end)
	end
end)


RegisterNetEvent("JP3")
AddEventHandler("JP3", function(jT)
	if cJ == true then
		return
	end
	local pP = GetPlayerPed(-1)
	if DoesEntityExist(pP) then
		
		Citizen.CreateThread(function()
			local playerOldLoc = GetEntityCoords(pP, true)
			SetEntityCoords(pP, 458.29275512695, -1001.5576782227, 23.914852142334)-- {x = 458.29275512695,y = -1001.5576782227,z = 23.914852142334 },
			cJ = true
			eJE = false
			while jT > 0 and not eJE do
				timecheck(jT)
				pP = GetPlayerPed(-1)
				RemoveAllPedWeapons(pP, true)
				SetEntityInvincible(pP, true)
				if IsPedInAnyVehicle(pP, false) then
					ClearPedTasksImmediately(pP)
				end
				if jT % 30 == 0 then
					TriggerEvent('chatMessage', 'SYSTEM', { 255, 0, 0 }, jT .." seconds until release.")
				end
				Citizen.Wait(500)
				local pL = GetEntityCoords(pP, true)
				local D = Vdist(458.29275512695, -1001.5576782227, 23.914852142334, pL['x'], pL['y'], pL['z'])
				if D > 2 then
					SetEntityCoords(pP, 458.29275512695, -1001.5576782227, 23.914852142334)
					if D > 4 then
						jT = jT + 60
						if jT > 1500 then
							jT = 1500
						end
						TriggerEvent('chatMessage', 'COURT', { 255, 0, 0 }, "Your time has increased for attempted escape!")
					end
				end
				jT = jT - 0.5
			end
			TriggerServerEvent('JailReleaseTime') -- UDPATE DB TO RELESE PLAYER
			TriggerServerEvent('chatMessageEntered', "SYSTEM", { 255, 0, 0 }, GetPlayerName(PlayerId()) .." has been released from jail.")
			SetEntityCoords(pP, 432.95864868164, -981.41455078125, 29.710334777832)
			cJ = false
			SetEntityInvincible(pP, false)
		end)
	end
end)

RegisterNetEvent("UnJP")
AddEventHandler("UnJP", function()
	eJE = true
end)

AddEventHandler('playerSpawned', function(spawn)
	Citizen.Trace('Check For If I am Jailed')
    TriggerServerEvent('JailCheck')
end)

function timecheck(Time)
	if Time % 5 == 0 then
		TriggerServerEvent('JailUpdate', Time)
	elseif Time == 1 then
                TriggerServerEvent('JailReleaseTime')
                TriggerServerEvent('JailUpdate', 0)
	end
end
