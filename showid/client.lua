RegisterNetEvent("showid:event")
local showid = false
CreateThread(function()
    while true do
        Wait(showid and 0 or 250)
        if showid then
            playerid = PlayerId()
            local pos2 = GetEntityCoords(PlayerPedId())
            for a, b in ipairs(GetActivePlayers()) do
                if b ~= playerid then
                    local pos = GetEntityCoords(GetPlayerPed(b))
                    if Vdist2(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 2500 then
                        Draw3DText(pos.x, pos.y, pos.z, GetPlayerServerId(b))
                    end
                end
            end
        end
    end
end)

AddEventHandler("showid:event", function()
    showid = not showid
end)

function Draw3DText(x, y, z, text)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.0, 0.23)
    SetTextColour(255, 0, 0, 255)
    SetTextDropshadow(0, 0, 0, 0, 255)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end