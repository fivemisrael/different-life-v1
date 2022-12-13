RegisterNetEvent("anticarpg:event")
CreateThread(function()
	local wtime = 250
	local lastvelocity = nil
	while true do
		Wait(wtime)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsUsing(ped)
			if not IsVehicleSeatFree(veh, -1) and GetPedInVehicleSeat(veh, -1) == ped then
				if NetworkGetEntityIsNetworked(veh) then
					if wtime ~= 0 then wtime = 0 end
					local velocity = GetEntityVelocity(veh)
					if lastvelocity then
						local e = (velocity.x-lastvelocity.x)*(velocity.x-lastvelocity.x)+(velocity.y-lastvelocity.y)*(velocity.y-lastvelocity.y)+(velocity.z-lastvelocity.z)*(velocity.z-lastvelocity.z)
						if e > 289 then
							e = math.sqrt(e)
							local health = math.floor(((e-17)*(100/90))*0.8)
							print(health, GetEntityHealth(PlayerPedId()))
							if health > 0 then
								if health > 100 then health = 100 end
								TriggerServerEvent("anticarpg:event", "cardmg", {health = health, veh = NetworkGetNetworkIdFromEntity(veh)})
							end
						end
					end
					lastvelocity = velocity
				end
			end
		elseif wtime == 0 then
			wtime = 250
			lastvelocity = nil
		end
	end
end)

AddEventHandler("anticarpg:event", function(thefunc, data)
	if thefunc == "cardmg" then
		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed, true) then
			if NetworkDoesNetworkIdExist(data.veh) then
				local veh = NetworkGetEntityFromNetworkId(data.veh)
				if GetVehiclePedIsUsing(playerPed) == veh then
					local health = GetEntityHealth(playerPed)-data.health
					if health < 99 then health = 99 end
					SetEntityHealth(playerPed, health)
				end
			end
		end
	end
end)