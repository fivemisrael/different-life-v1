local Langue = "en"
local VolumeDeLaMusique = 0.5

ESX = nil
CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Wait(500)
	end
end)
--[[function getPlayers()
    local playerList = {}
    for i = 0, 256 do
        local player = GetPlayerFromServerId(i)
        if NetworkIsPlayerActive(player) then
            table.insert(playerList, player)
        end
    end
    return playerList
end

function getNearPlayer()
    local players = getPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = playerPed
    local plyCoords = GetEntityCoords(ply, 0)
    
    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = Vdist(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"])
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end
    return closestPlayer, closestDistance
end]]

RegisterNetEvent('RebornProject:SyncSon_Client')
AddEventHandler('RebornProject:SyncSon_Client', function(playerNetId)
    local playerPed = PlayerPedId()
	local lCoords = GetEntityCoords(playerPed)
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if (distIs <= 2.0001) then
        SendNUIMessage({
            DemarrerLaMusique     = 'DemarrerLaMusique',
            VolumeDeLaMusique   = VolumeDeLaMusique
        })
    end
end)

RegisterNetEvent('RebornProject:SyncAnimation')
AddEventHandler('RebornProject:SyncAnimation', function()
    Wait(250)
    TriggerServerEvent("RebornProject:SyncSon_Serveur")
    local playerPed = PlayerPedId()
	SetPedToRagdoll(playerPed, 2000, 2000, 0, 0, 0, 0)
   -- TriggerEvent("RebornProject:Notification", Notif2)
end)

RegisterNetEvent("RebornProject:Notification")
AddEventHandler('RebornProject:Notification', function(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(true, false)
end)

function ChargementAnimation(donnees)
    while (not HasAnimDictLoaded(donnees)) do 
        RequestAnimDict(donnees)
        Wait(5)
    end
end


local timer = GetGameTimer()
CreateThread(function()
    while true do
        Wait(0)
		local playerPed = PlayerPedId()
        if IsControlPressed(1, 19) then  
            if not IsPedRagdoll(playerPed) then
				if IsControlJustPressed(1, 47) then -- alt + G  |  SLAP
					if GetGameTimer() - timer > 5000 then
						--local CitoyenCible, distance = getNearPlayer()
						local CitoyenCible = ESX.Game.GetClosestPlayer()
						local closePlayerPed = GetPlayerPed(CitoyenCible)
						local myPos, hisPos = GetEntityCoords(playerPed), GetEntityCoords(closePlayerPed)
						local distance = GetDistanceBetweenCoords(myPos, hisPos, true)
						if (distance ~= -1 and distance < 2.0) then
			
							if IsPedArmed(playerPed, 7) then
								SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
							end
			
							if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then
								ChargementAnimation("melee@unarmed@streamed_variations")
								TaskPlayAnim(playerPed, "melee@unarmed@streamed_variations", "plyr_takedown_front_slap", 8.0, 1.0, 1500, 1, 0, 0, 0, 0)
								TriggerServerEvent("RebornProject:SyncGiffle", GetPlayerServerId(CitoyenCible))
							end
						else
							TriggerEvent("RebornProject:Notification", "~r~No citizen in front of you~s~")
						end

						timer = GetGameTimer()
					end
				end
			end

            if IsControlJustPressed(1, 74) then  -- alt + H  |  Whistle
                if IsPedArmed(playerPed, 7) then
                    SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
                end
                if (DoesEntityExist(playerPed) and not IsEntityDead(playerPed)) then
                    ChargementAnimation("rcmnigel1c")
                    TaskPlayAnim(playerPed, "rcmnigel1c", "hailing_whistle_waive_a", 2.0, 2.0, 2000, 51, 0, false, false, false)
                end
            end

        end
    end
end)
