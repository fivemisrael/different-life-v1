local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

ESX = nil
local PlayerData                = {}
local radio = false

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
	end
end)


local hasRadio = false
CreateThread(function()
	while true do
		Wait(6000)
		if (ESX == nil) then hasRadio = false return end
		ESX.TriggerServerCallback('tokovoip_getradio', function(qtty)
			if qtty > 0 then hasRadio = true else hasRadio = false end
		end, 'radio')
	end
	
end)


local keybindEnabled = true -- When enabled, radio are available by keybind
local radioKey = Keys["LEFTALT"]

--THREADS--

Citizen.CreateThread(function()
  while true do

    Citizen.Wait(0)

    local lPed = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(lPed)

    if radio or (keybindEnabled and IsControlJustReleased(1, radioKey)) then
      radio = true
        end
      end
  end)
 

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)


local radioMenu = false

function PrintChatMessage(text)
    TriggerEvent('chatMessage', "system", { 255, 0, 0 }, text)
end

function enableRadio(enable)
  if hasRadio then
    SetNuiFocus(true, true)
    radioMenu = enable

    SendNUIMessage({

      type = "enableui",
      enable = enable

    })
  else
    ESX.ShowNotification("You do not have a ~r~Radio~s~")
  end

end

-- Activate radio
RegisterNetEvent('radio:Activate')
AddEventHandler('radio:Activate', function()
  radio = not radio
end)

--- sprawdza czy komenda /radio jest włączony

RegisterCommand('radio', function(source, args)
    if Config.enableCmd then
      enableRadio(true)
    end
end, false)


-- radio test

RegisterCommand('radiotest', function(source, args)
  local playerName = GetPlayerName(PlayerId())
  local data = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

  print(tonumber(data))

  if data == "nil" then
    exports['mythic_notify']:SendAlert('inform', Config.messages['not_on_radio'])
  else
   exports['mythic_notify']:SendAlert('inform', Config.messages['on_radio'] .. data .. ' MHz </b>')
 end

end, false)

-- dołączanie do radia

RegisterNUICallback('joinRadio', function(data, cb)
    local _source = source
    local PlayerData = ESX.GetPlayerData(_source)
    local playerName = GetPlayerName(PlayerId())
    local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")
	if tonumber(data.channel) then
		data.channel = tonumber(data.channel+0.0)
		if tonumber(data.channel) ~= tonumber(getPlayerRadioChannel) then
			if tonumber(data.channel) <= Config.RestrictedChannels then
				if(PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire') then
					exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
					exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
					exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
					exports['mythic_notify']:SendAlert('inform', Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>')
				elseif not (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'fire') then
				--- info że nie możesz dołączyć bo nie jesteś policjantem
					exports['mythic_notify']:SendAlert('error', Config.messages['restricted_channel_error'])
				end
			end
			if tonumber(data.channel) > Config.RestrictedChannels then
				exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
				exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
				exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
				exports['mythic_notify']:SendAlert('inform', Config.messages['joined_to_radio'] .. data.channel .. ' MHz </b>')
			end
		else
			exports['mythic_notify']:SendAlert('error', Config.messages['you_on_radio'] .. data.channel .. ' MHz </b>')
		end
	else
		exports['mythic_notify']:SendAlert('error', "error must be a number")
	end
      --[[
    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", tonumber(data.channel), true);
    exports.tokovoip_script:addPlayerToRadio(tonumber(data.channel))
    PrintChatMessage("radio: " .. data.channel)
    print('radiook')
      ]]--
    cb('ok')
end)

-- opuszczanie radia

RegisterNUICallback('leaveRadio', function(data, cb)
   local playerName = GetPlayerName(PlayerId())
   local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")

    if getPlayerRadioChannel == "nil" then
      exports['mythic_notify']:SendAlert('inform', Config.messages['not_on_radio'])
        else
          exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
          exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
          exports['mythic_notify']:SendAlert('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>')
    end

   cb('ok')

end)

RegisterNUICallback('escape', function(data, cb)

    enableRadio(false)
    SetNuiFocus(false, false)


    cb('ok')
end)

function EnableActions(ped)
    EnableControlAction(1, 140, true)
    EnableControlAction(1, 141, true)
    EnableControlAction(1, 142, true)
    EnableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
    DisablePlayerFiring(ped, false) -- Disable weapon firing
end

function DisableActions(ped)
    DisableControlAction(1, 140, true)
    DisableControlAction(1, 141, true)
    DisableControlAction(1, 142, true)
    DisableControlAction(1, 37, true) -- Disables INPUT_SELECT_WEAPON (TAB)
    DisablePlayerFiring(ped, true) -- Disable weapon firing
end

-- EVENTS

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    
    Citizen.Wait(5000)
end)

RegisterNetEvent("ls-radio:startActionB") -- Aktion Person B
AddEventHandler("ls-radio:startActionB", function()
    NetworkSetTalkerProximity(0.00) -- Sprachreichweite wird unbegrenzt
end)

RegisterNetEvent("ls-radio:stopActionB") -- Aktion Person B
AddEventHandler("ls-radio:stopActionB", function()
    NetworkSetTalkerProximity(6.00) -- Sprachreichweite wird 6 Meter
end)

RegisterNetEvent("ls-radio:startAnim") -- Event, um andere Personen Animation starten zu lassen
AddEventHandler("ls-radio:startAnim", function()
    Citizen.CreateThread(function()
        if not IsPedSittingInAnyVehicle(PlayerPedId()) and not GetIsTaskActive(PlayerPedId(), 12) then
            RequestAnimDict("random@arrests")
            while not HasAnimDictLoaded("random@arrests") do
                Citizen.Wait(1)
            end
        end
    end)
end)
RegisterNetEvent("ls-radio:stopAnim")
AddEventHandler("ls-radio:stopAnim", function()
    Citizen.CreateThread(function()
        Citizen.Wait(1)
        ClearPedTasks(GetPlayerPed(-1))
    end)
end)
-- net eventy

RegisterNetEvent('ls-radio:use')
AddEventHandler('ls-radio:use', function()
  enableRadio(true)
end)

RegisterNetEvent('ls-radio:onRadioDrop')
AddEventHandler('ls-radio:onRadioDrop', function(source)
  local playerName = GetPlayerName(source)
  local getPlayerRadioChannel = exports.tokovoip_script:getPlayerData(playerName, "radio:channel")


  if getPlayerRadioChannel ~= "nil" then

    exports.tokovoip_script:removePlayerFromRadio(getPlayerRadioChannel)
    exports.tokovoip_script:setPlayerData(playerName, "radio:channel", "nil", true)
    exports['mythic_notify']:SendAlert('inform', Config.messages['you_leave'] .. getPlayerRadioChannel .. '.00 MHz </b>')

end
end)

Citizen.CreateThread(function()
    while true do
        if radioMenu then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown

            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate

            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride

            if IsDisabledControlJustReleased(0, 142) then -- MeleeAttackAlternate
                SendNUIMessage({
                    type = "click"
                })
            end
        end
		if IsControlJustReleased(0, 246) then
			enableRadio(true)
		end
        Citizen.Wait(0)
    end
end)
