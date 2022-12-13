local inTrunk = false
local inTrunkVeh = 0
ESX = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj)
			ESX = obj
		end)
		Wait(500)
	end
	
    while not NetworkIsSessionStarted() or ESX.GetPlayerData().job == nil do Wait(500) end
    while true do
        Wait(250)
        if inTrunk and inTrunkVeh ~= 0 then
            local angle = GetVehicleDoorAngleRatio(inTrunkVeh, 5)
            if angle < 0.9 then
                SetEntityVisible(PlayerPedId(), false)
                print("close", angle)
            else
                SetEntityVisible(PlayerPedId(), true)
                print("open", angle)
            end
        end
    end
end)

RegisterCommand("entertrunk", function()
	if not inTrunk then
		local playerPed = PlayerPedId()
		local vehicle = GetClosestVehicle(GetEntityCoords(playerPed), 10.0, 0, 70)
		local closePlayerPed = GetPlayerPed(ESX.Game.GetClosestPlayer())
		if DoesEntityExist(closePlayerPed) then
            print(-1)
            if not IsEntityAttached(closePlayerPed) or GetDistanceBetweenCoords(GetEntityCoords(playerPed), GetEntityCoords(PlayerPedId()), true) >= 5.0 then
                print(0)
                if DoesEntityExist(vehicle) then
					print(1)
					local trunk = GetEntityBoneIndexByName(vehicle, 'boot')
					if trunk ~= -1 then
						print(2)
						local coords = GetWorldPositionOfEntityBone(vehicle, trunk)
						if GetDistanceBetweenCoords(GetEntityCoords(playerPed), coords, true) <= 1.5 then
							print(3)
							if GetVehicleDoorAngleRatio(vehicle, 5) < 0.9 then
								print(4)
								SetCarBootOpen(vehicle)
								Wait(350)
								AttachEntityToEntity(playerPed, vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)	
								loadDict('timetable@floyd@cryingonbed@base')
								TaskPlayAnim(playerPed, 'timetable@floyd@cryingonbed@base', 'base', 8.0, -8.0, -1, 1, 0, false, false, false)
								Wait(50)
                                inTrunk = true
                                inTrunkVeh = vehicle
								SetEntityVisible(playerPed, false)
								Wait(1500)
								SetVehicleDoorShut(vehicle, 5)
							end
						end
					end
				end
			else
                ESX.ShowNotification('Someone is already hiding in that vehicle!')
            end
		end
	end
end, false)

RegisterCommand("leavetrunk", function()
	if inTrunk then
		local playerPed = PlayerPedId()
		local vehicle = GetEntityAttachedTo(playerPed)
		if DoesEntityExist(vehicle) and not IsPedDeadOrDying(playerPed) and not IsPedFatallyInjured(playerPed) then
			SetCarBootOpen(vehicle)
			SetEntityCollision(playerPed, true, true)
			Wait(750)
            inTrunk = false
            inTrunkVeh = 0
			DetachEntity(playerPed, true, true)
			SetEntityVisible(playerPed, true, false)
			ClearPedTasks(playerPed)
			SetEntityCoords(playerPed, GetOffsetFromEntityInWorldCoords(playerPed, 0.0, -0.5, -0.75))
			Wait(250)
			SetVehicleDoorShut(vehicle, 5)
		end
	end
end, false)

loadDict = function(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
end
 