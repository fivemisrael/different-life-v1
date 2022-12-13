local pendingPing = nil
local isPending = false

function AddBlip(bData)
    pendingPing.blip = AddBlipForCoord(bData.x, bData.y, bData.z)
    SetBlipSprite(pendingPing.blip, bData.id)
    SetBlipAsShortRange(pendingPing.blip, true)
    SetBlipScale(pendingPing.blip, bData.scale)
    SetBlipColour(pendingPing.blip, bData.color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(bData.name)
    EndTextCommandSetBlipName(pendingPing.blip)

    pendingPing.count = 0
end

function TimeoutPingRequest()
    Citizen.CreateThread(function()
        local count = 0
        while isPending do
            count = count + 1
            if count >= Config.Timeout and isPending then
                TriggerEvent('notification', 'Ping From ' .. pendingPing.name .. ' Timed Out', 1)
                TriggerServerEvent('mythic_ping:server:SendPingResult', pendingPing.id, 'timeout')
                pendingPing = nil
                isPending = false
            end
            Citizen.Wait(1000)
        end
    end)
end

function TimeoutBlip()
    Citizen.CreateThread(function()
        while pendingPing ~= nil do
            if pendingPing.count ~= nil then
                if pendingPing.count >= Config.BlipDuration then
                    RemoveBlip(pendingPing.blip)
                    pendingPing = nil
                else
                    pendingPing.count = pendingPing.count + 1
                end
            end
            Citizen.Wait(1000)
        end
    end)
end

function RemoveBlipDistance()
    local player = PlayerPedId()
    Citizen.CreateThread(function()
        while pendingPing ~= nil do
            local plyCoords = GetEntityCoords(player)
            local dist = math.floor(#(vector2(pendingPing.pos.x, pendingPing.pos.y) - vector2(plyCoords.x, plyCoords.y)))

            if dist < Config.DeleteDistance then
                RemoveBlip(pendingPing.blip)
                pendingPing = nil
            else
                Citizen.Wait(math.floor((dist - Config.DeleteDistance) * 30))
            end
        end
    end)
end

RegisterNetEvent('mythic_ping:client:SendPing')
AddEventHandler('mythic_ping:client:SendPing', function(sender, senderId)
    if pendingPing == nil then
        pendingPing = {}
        pendingPing.id = senderId
        pendingPing.name = sender
        pendingPing.pos = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(pendingPing.id)), false) 

        TriggerServerEvent('mythic_ping:server:SendPingResult', pendingPing.id, 'received')
        TriggerEvent('notification', 'Ping From ' .. pendingPing.name .. ' Sent You a Ping, Use /ping accept To Accept', 1)
        isPending = true

        if Config.Timeout > 0 then
            TimeoutPingRequest()
        end

    else
        TriggerEvent('notification', 'Ping From ', sender .. ' Attempted To Ping You', 2)
        TriggerServerEvent('mythic_ping:server:SendPingResult', senderId, 'unable')
    end
end)

RegisterNetEvent('mythic_ping:client:AcceptPing')
AddEventHandler('mythic_ping:client:AcceptPing', function()
    if isPending then
        local playerBlip = { name = pendingPing.name, color = Config.BlipColor, id = Config.BlipIcon, scale = Config.BlipScale, x = pendingPing.pos.x, y = pendingPing.pos.y, z = pendingPing.pos.z }
        AddBlip(playerBlip)

        if Config.RouteToPing then
            SetNewWaypoint(pendingPing.pos.x, pendingPing.pos.y)
        end

        if Config.Timeout > 0 then
            TimeoutBlip()
        end

        if Config.DeleteDistance > 0 then
            RemoveBlipDistance()
        end

        TriggerEvent('notification', pendingPing.name .. '\'s Location Showing On Map', 1)
        TriggerServerEvent('mythic_ping:server:SendPingResult', pendingPing.id, 'accept')
        isPending = false
    else
        TriggerEvent('notification', 'You Have No Pending Ping', 2)
    end
end)

RegisterNetEvent('mythic_ping:client:RejectPing')
AddEventHandler('mythic_ping:client:RejectPing', function()
    if pendingPing ~= nil then
        TriggerEvent('notification', 'Rejected Ping From ' .. pendingPing.name, 2)
        TriggerServerEvent('mythic_ping:server:SendPingResult', pendingPing.id, 'reject')
        pendingPing = nil
        isPending = false
    else
        TriggerEvent('notification', 'You Have No Pending Ping', 2)
    end
end)

RegisterNetEvent('mythic_ping:client:RemovePing')
AddEventHandler('mythic_ping:client:RemovePing', function()
    if pendingPing ~= nil then
        RemoveBlip(pendingPing.blip)
        pendingPing = nil
        TriggerEvent('notification', 'Player Ping Removed', 1)
    else
        TriggerEvent('notification', 'You Have No Player Ping', 1)
    end
end)