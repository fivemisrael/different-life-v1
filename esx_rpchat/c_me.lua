RegisterNetEvent("me:event")
local players = {}
local doPlayers = {}
CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, players do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetEntityCoords(ped)
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z)
                    if not ons then
                        x = (x*100)
                        y = (y*100)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #FFFFFF;background-color: #000000AA;border-radius:3px;font-family:Calibri;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                players[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "me", html = str})
            lstr = str
        end
    end
end)


CreateThread(function()
    local lstr = ""
    while true do
        Wait(0)
        local tick = GetGameTimer()
        local str = ""
        local removes = {}
        for a, b in next, doPlayers do
            if b.rtime < tick then
                removes[#removes+1] = a
            end
            local p = GetPlayerFromServerId(a)
            if NetworkIsPlayerActive(p) then
                local ped = GetPlayerPed(p)
                if DoesEntityExist(ped) then
                    local coords = GetPedBoneCoords(ped, 0x796e, 0.0, 0.0, 0.0) --HEAD
                    local ons, x, y = GetHudScreenPositionFromWorldPosition(coords.x, coords.y, coords.z+0.4)
                    if not ons then
                        x = (x*100)
                        y = (y*100)
                        str = str.."<p style=\"left: "..x.."%;top: "..y.."%;-webkit-transform: translate(-50%, 0%);max-width: 100%;position: fixed;text-align: center;color: #0066FF;background-color: #000000AA;border-radius:3px;font-family:Calibri;\"><b>⠀"..b.message.."⠀</b></p>"
                    end
                end
            end
        end
        if #removes > 0 then
            for a, b in ipairs(removes) do
                doPlayers[b] = nil
            end
        end
        if str ~= lstr then
            SendNUIMessage({meta = "do", html = str})
            lstr = str
        end
    end
end)

AddEventHandler("me:event", function(source, message, type1)

    source = tonumber(source)
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(source)))
    local mcoords = GetEntityCoords(PlayerPedId())
    if GetDistanceBetweenCoords(coords.x, coords.y, coords.z, mcoords.x, mcoords.y, mcoords.z, true) < 30 then
		message = string.gsub(message, "&", "&amp")
		message = string.gsub(message, "<", "&lt")
		message = string.gsub(message, ">", "&gt")
		message = string.gsub(message, "\"", "&quot")
		message = string.gsub(message, "'", "&#039")
        if type1 == 0 then players[source] = {message = message, rtime = 7000+GetGameTimer()} elseif type1 == 1 then doPlayers[source] = {message = message, rtime = 7000+GetGameTimer()} elseif type1 == 2 then 
			local name = GetPlayerName(GetPlayerFromServerId(source))
			TriggerEvent('chat:addMessage', { args = { "OOC | "..name..":", message }, color = { 128, 128, 128 } })
		end
    end
end)