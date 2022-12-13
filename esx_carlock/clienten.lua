ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)



Citizen.CreateThread(function()
  local dict = "anim@heists@keycard@"
  RequestAnimDict(dict)
  while not HasAnimDictLoaded(dict) do
      Citizen.Wait(250)
  end
  while true do
    Citizen.Wait(0)
	if (IsControlJustPressed(1, 182)) then
		local coords = GetEntityCoords(GetPlayerPed(-1))
		local hasAlreadyLocked = false
		cars = ESX.Game.GetVehiclesInArea(coords, 30)
		local carstrie = {}
		local cars_dist = {}		
		notowned = 0
		if #cars == 0 then
			TriggerEvent('notification', 'No vehicles to lock nearby.', 2)
		else
			for j=1, #cars, 1 do
				local coordscar = GetEntityCoords(cars[j])
				local distance = Vdist(coordscar.x, coordscar.y, coordscar.z, coords.x, coords.y, coords.z)
				table.insert(cars_dist, {cars[j], distance})
			end
			for k=1, #cars_dist, 1 do
				local z = -1
				local distance, car = 999
				for l=1, #cars_dist, 1 do
					if cars_dist[l][2] < distance then
						distance = cars_dist[l][2]
						car = cars_dist[l][1]
						z = l
					end
				end
				if z ~= -1 then
					table.remove(cars_dist, z)
					table.insert(carstrie, car)
				end
			end
			for i=1, #carstrie, 1 do
				local plate = ESX.Math.Trim(GetVehicleNumberPlateText(carstrie[i]))
				ESX.TriggerServerCallback('carlock:isVehicleOwner', function(owner)
					if owner and hasAlreadyLocked ~= true then
						local vehicleLabel = GetDisplayNameFromVehicleModel(GetEntityModel(carstrie[i]))
						vehicleLabel = GetLabelText(vehicleLabel)
						local lock = GetVehicleDoorLockStatus(carstrie[i])
						if lock == 1 or lock == 0 then
							SetVehicleDoorShut(carstrie[i], 0, false)
							SetVehicleDoorShut(carstrie[i], 1, false)
							SetVehicleDoorShut(carstrie[i], 2, false)
							SetVehicleDoorShut(carstrie[i], 3, false)
							SetVehicleDoorsLocked(carstrie[i], 2)
							PlayVehicleDoorCloseSound(carstrie[i], 1)
							TriggerEvent('notification', 'You have locked your '..vehicleLabel..'')
							TriggerServerEvent("InteractSound_SV:PlayOnSource", "lockcar", 1.0)
							if not IsPedInAnyVehicle(PlayerPedId(), true) then
								TaskPlayAnim(PlayerPedId(), dict, "exit", 8.0, 8.0, -1, 48, 1, false, false, false)
							end
							SetVehicleLights(carstrie[i], 2)
							Citizen.Wait(150)
							SetVehicleLights(carstrie[i], 0)
							Citizen.Wait(150)
							SetVehicleLights(carstrie[i], 2)
							Citizen.Wait(150)
							SetVehicleLights(carstrie[i], 0)
							hasAlreadyLocked = true
						elseif lock == 2 then
							SetVehicleDoorsLocked(carstrie[i], 1)
							PlayVehicleDoorOpenSound(carstrie[i], 0)
							TriggerEvent('notification', 'You have unlocked your '..vehicleLabel..'')						
							TriggerServerEvent("InteractSound_SV:PlayOnSource", "unlockcar", 1.0)
							if not IsPedInAnyVehicle(PlayerPedId(), true) then
								TaskPlayAnim(PlayerPedId(), dict, "exit", 8.0, 8.0, -1, 48, 1, false, false, false)
							end
							SetVehicleLights(carstrie[i], 2)
							Citizen.Wait(150)
							SetVehicleLights(carstrie[i], 0)
							Citizen.Wait(150)
							SetVehicleLights(carstrie[i], 2)
							Citizen.Wait(150)
							SetVehicleLights(carstrie[i], 0)
							hasAlreadyLocked = true
						end
					else
						notowned = notowned + 1
					end
					if notowned == #carstrie then
						TriggerEvent('notification', 'No vehicles to lock nearby.', 1)	
					end	
				end, plate)
			end			
		end
	end
  end
end)
