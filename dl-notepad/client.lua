local attachedProp = nil
local attachedProp2 = nil

local openedNote = false
local getCoords = nil

local Keys = {
    ["Eb5m"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/notepad', 'Open Notepad', {
})
end)

Citizen.CreateThread(function()
    while true do
        local sleepThread = 500
        --SetNuiFocus(false, false)
        TriggerServerEvent('dl-notepad:getCoords')
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)

        if openedNote then
            sleepThread = 5
            DisableControlAction(0, 1, openedNote)
            DisableControlAction(0, 2, openedNote)
            DisableControlAction(0, 142, openedNote)
            DisableControlAction(0, 106, openedNote)
            DisableControlAction(0, 14, openedNote)
            DisableControlAction(0, 15, openedNote)
            DisableControlAction(0, 16, openedNote)
            DisableControlAction(0, 17, openedNote)
        end

        if getCoords ~= nil then
            for k, v in pairs(getCoords) do
                local noteDist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, v.x, v.y, v.z, true)

                SetPlayerTalkingOverride(playerPed, true)

                if noteDist < 5 then
                    sleepThread = 5
                   -- DrawMarker(20, v.x, v.y, v.z - 0.3, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.3, 0.3, 0.3, 255, 255, 255, 200, false, true, 2, true, false, false, false)                --end
                    DrawMarker(20, v.x, v.y, v.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.6, 0.6, 0.6, 255, 255, 255, 200, false, true, 2, true, false, false, false)                --end
                    Draw3DText (v.x, v.y, v.z  , 'Press ~r~E~w~ To Grab The Note')

                    if noteDist < 1.0 then
                        --DisplayHelpText("Press ~r~E~w~ To Grab The Note")
                        

                        if IsControlPressed(0, Keys['E']) then
                            TriggerServerEvent('dl-notepad:deleteCoord', k)
                            TriggerEvent('dl-notepad:pickup', v.noteTxt, k)
                            Draw3DText (v.x, v.y, v.z  , 'Press ~g~E~w~ To Grab The Note')
                        end
                    end
                end
            end
        end
		collectgarbage()
        Citizen.Wait(sleepThread)
    end
end)

RegisterNetEvent('dl-notepad:open')
AddEventHandler('dl-notepad:open', function()
    SetNuiFocus(true, false)
    SendNUIMessage({ type = 'showpage' })

    openedNote = true

    TriggerEvent('dl-notepad:anim')
end)

RegisterNetEvent('dl-notepad:pickup')
AddEventHandler('dl-notepad:pickup', function(txt, id)
    SetNuiFocus(true, false)

    openedNote = true

    SendNUIMessage({
        type = 'pickup',
        notetxt = txt,
        noteid = id
    })

    TriggerEvent('dl-notepad:pickupanim')
end)

RegisterNetEvent('dl-notepad:pickupanim')
AddEventHandler('dl-notepad:pickupanim', function()
    RequestAnimDict("pickup_object")
    while not HasAnimDictLoaded("pickup_object") do
        Citizen.Wait(0)
    end

    TaskPlayAnim(GetPlayerPed(-1), "pickup_object", "pickup_low", 8.0, -8, -1, 9, 0, 0, 0, 0)
    Wait(2000)
    ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('dl-notepad:anim')
AddEventHandler('dl-notepad:anim', function()
    attachModel = GetHashKey('prop_notepad_01')
	local playerPed = PlayerPedId()

    SetCurrentPedWeapon(playerPed, 0xA2719263)

    local bone = GetPedBoneIndex(playerPed, 60309)

    RequestModel(attachModel)
    while not HasModelLoaded(attachModel) do
        Citizen.Wait(100)
    end
    attachedProp = CreateObject(attachModel, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(attachedProp, playerPed, bone, 0.0, -0.0, -0.0, 0.0, 0.0, -30.0, true, true, false, true, 1, true)

    attachModel2 = GetHashKey('prop_pencil_01')

    SetCurrentPedWeapon(playerPed, 0xA2719263)

    local bone2 = GetPedBoneIndex(playerPed, 58870)

    RequestModel(attachModel2)
    while not HasModelLoaded(attachModel2) do
        Citizen.Wait(100)
    end
    attachedProp2 = CreateObject(attachModel2, 1.0, 1.0, 1.0, 1, 1, 0)
    AttachEntityToEntity(attachedProp2, playerPed, bone2, 0.05, 0.0, 0.09, -455.0, -400.0, 0.0, true, true, false, true, 1, true)

    RequestAnimDict("amb@medic@standing@timeofdeath@base")
    while not HasAnimDictLoaded("amb@medic@standing@timeofdeath@base") do
        Citizen.Wait(0)
    end

    if IsEntityPlayingAnim(playerPed, "amb@medic@standing@timeofdeath@base", "base", 3) then
        ClearPedSecondaryTask(playerPed)
    else
        TaskPlayAnim(playerPed, "amb@medic@standing@timeofdeath@base", "base", 8.0, -8, -1, 9, 0, 0, 0, 0)
        Citizen.Wait(500)
        ClearPedSecondaryTask(ped)
        Citizen.Wait(2000)
        ClearPedTasks(ped)
    end
end)

RegisterNetEvent('dl-notepad:dropnote')
AddEventHandler('dl-notepad:dropnote', function(txt)
    local playerPed = PlayerPedId()
    local pos = GetEntityCoords(playerPed)

    newNote = {
        x = pos.x,
        y = pos.y,
        z = pos.z,
        noteTxt = txt
    }
    TriggerServerEvent("dl-notepad:saveCoord", newNote)
end)

RegisterNetEvent('dl-notepad:getCoords')
AddEventHandler('dl-notepad:getCoords', function(coords)
    if coords ~= nil then
        getCoords = coords
    end
end)

RegisterNUICallback('getNote', function(data)
    TriggerEvent('dl-notepad:dropnote', data)
    openedNote = false
end)

RegisterNUICallback('destroynote', function(data)
    TriggerServerEvent('dl-notepad:deleteCoord', data)
    openedNote = false
end)

RegisterNUICallback('NUIFocusOff', function()
    SetNuiFocus(false, false)
    openedNote = false

    ClearPedTasksImmediately(GetPlayerPed(-1))
    DeleteObject(attachedProp)
    DeleteObject(attachedProp2)
end)

function DisplayHelpText(Text)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(Text)
	EndTextCommandDisplayHelp(0, 0, 1, -1)
end

function Draw3DText(x, y, z, text,messageTimeout)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local b5male = (1/dist)*1
    local fov = (1/GetGameplayCamFov())*100
    local b5male = 2.1
   
    if onb5mreen then
        --SetTextb5male(0.0*b5male, 0.25*b5male)
        SetTextFont(6)
        SetTextProportional(1)
        SetTextb5male(0.0, 0.35)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 50, 50, 50, 0)
    end
end