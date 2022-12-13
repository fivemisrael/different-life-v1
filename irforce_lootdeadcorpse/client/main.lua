ESX                           = nil

local PlayerData = {}
local target_id = GetPlayerServerId(player)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)
    
inmenu = false 
Citizen.CreateThread(function()
RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)
		while true do
			Citizen.Wait(20)
				if IsControlJustReleased(0, 38) then		
				local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
					if IsPlayerDead(closestPlayer) then 
                        if closestPlayer ~= -1 and closestDistance <= 5.0 then
                            loadAnimDict('amb@medic@standing@kneel@base')
                            loadAnimDict('anim@gangops@facility@servers@bodysearch@')
                            TaskPlayAnim(GetPlayerPed(-1), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
                            TaskPlayAnim(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
                            Citizen.Wait(5000)
	                        StopAnimTask(GetPlayerPed(-1), "anim@gangops@facility@servers@bodysearch@" ,"player_search", 1.0)
                            TriggerEvent("esx_inventoryhud:openPlayerInventory", GetPlayerServerId(closestPlayer), GetPlayerName(closestPlayer))
                            inmenu = true 
						end
					end
                end
                inmenu = false 
            if (inmenu == false) then
                StopAnimTask(GetPlayerPed(-1), "amb@medic@standing@kneel@base" ,"base", 1.0)
            end
		end
        
end)


function loadAnimDict(dict)
	  while (not HasAnimDictLoaded(dict)) do
		  RequestAnimDict(dict)
		  Citizen.Wait(1)
	  end
end