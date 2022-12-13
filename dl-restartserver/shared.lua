if IsDuplicityVersion() then
	RegisterCommand("newgoto", function(source, args, rawCommand)
        local ped = GetPlayerPed(args[1])
        if ped then
            SetEntityCoords(GetPlayerPed(source), GetEntityCoords(ped))
        end
    end, true)

    RegisterCommand("newbring", function(source, args, rawCommand)
        local ped = GetPlayerPed(args[1])
        if ped then
            SetEntityCoords(GetPlayerPed(ped), GetEntityCoords(source))
        end
    end, true)

    RegisterCommand("newspec", function(source, args, rawCommand)
        local ped = GetPlayerPed(args[1])
        if ped then
			local coords = GetEntityCoords(ped)
            SetEntityCoords(GetPlayerPed(source), coords)
            TriggerClientEvent("newSpec", source, args[1], "on")
        end
    end, true)

    RegisterCommand("newspecoff", function(source)
        TriggerClientEvent("newSpec", source, nil, "off")
    end, true)
else
    RegisterNetEvent("newSpec")
    AddEventHandler("newSpec", function(player, mode, pos)
        if mode == "on" then
            local id = GetPlayerFromServerId(tonumber(player))
            local ped = PlayerPedId()
            local target = GetPlayerPed(id)
			if target ~= 0 then
				SetEntityVisible(ped, false)
				AttachEntityToEntity(ped, target)
				NetworkSetInSpectatorMode(true, target)
			end
        else
            local ped = PlayerPedId()
            NetworkSetInSpectatorMode(false, ped)
            DetachEntity(ped, true, true)
			Wait(10000)
			SetEntityVisible(ped, true)
        end
    end)
end