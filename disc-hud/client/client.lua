ESX = nil
local vehiclesFuel = {}
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

--local isTokovoip = true
local cruiseIsOn = false
local seatbeltIsOn = false
local seatbeltEjectSpeed = 25               -- Speed threshold to eject player (MPH)
local seatbeltEjectAccel = 100              -- Acceleration threshold to eject player (G's)
Citizen.CreateThread(function()
    NetworkSetTalkerProximity(8.0)
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    ESX.TriggerServerCallback('disc-hud:getMoney', {}, function(data)
        SendNUIMessage({
            action = 'display',
            cash = data.cash,
            bank = data.bank
        })
    end)
end)

function CalculateTimeToDisplay()
    hour = GetClockHours()
    minute = GetClockMinutes()

    local obj = {}

    if hour <= 12 then
        obj.ampm = 'AM'
    elseif hour >= 13 then
        obj.ampm = 'PM'
        hour = hour - 12
    end

    if minute <= 9 then
        minute = "0" .. minute
    end

    obj.hour = hour
    obj.minute = minute

    return obj
end

function round(num, numDecimalPlaces)
    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

function getCardinalDirectionFromHeading(heading)
    if ((heading >= 0 and heading < 45) or (heading >= 315 and heading < 360)) then
        return "Northbound" -- North
    elseif (heading >= 45 and heading < 135) then
        return "Westbound" -- West
    elseif (heading >= 135 and heading < 225) then
        return "Southbound" -- South
    elseif (heading >= 225 and heading < 315) then
        return "Eastbound" -- East
    end
end

function ToggleUI()
    showUi = not showUi

    if showUi then
        SendNUIMessage({
            action = 'showui'
        })

        if IsPedInAnyVehicle(PlayerPedId()) then
            SendNUIMessage({
                action = 'showcar'
            })
        end
    else
        SendNUIMessage({
            action = 'hideui'
        })
        SendNUIMessage({
            action = 'hidecar'
        })
    end
end


--General UI Updates
Citizen.CreateThread(function()
    Citizen.Wait(0)
    SendNUIMessage({
        action = 'showui'
    })

    while true do
        local player = PlayerPedId()
		if IsPedInAnyVehicle(player) then
			currSpeed = GetEntitySpeed(GetVehiclePedIsIn(player))
			local speed
			local sign
			if ShouldUseMetricMeasurements() then
				speed = currSpeed * 3.6
				sign = 'KM/H'
			else
				speed = currSpeed * 2.23694
				sign = 'MP/H'
			end

			local time = CalculateTimeToDisplay()
			local heading = getCardinalDirectionFromHeading(GetEntityHeading(player))
			local pos = GetEntityCoords(player)
			local var1, var2 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
			local current_zone = GetLabelText(GetNameOfZone(pos.x, pos.y, pos.z))

			SendNUIMessage({
				action = 'tick',
				show = IsPauseMenuActive(),
				health = (GetEntityHealth(player) - 100),
				armor = GetPedArmour(player),
				stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId()),
				time = time.hour .. ':' .. time.minute,
				ampm = time.ampm,
				direction = heading,
				street1 = GetStreetNameFromHashKey(var1),
				street2 = GetStreetNameFromHashKey(var2),
				area = current_zone,
				speed = math.ceil(speed),
				sign = sign
			})
		else
			SendNUIMessage({action = "tick", show = true, health = (GetEntityHealth(player) - 100), armor = GetPedArmour(player), stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId())})
			Wait(500)
		end
        Wait(200)
    end
end)

--Network Talking Updates
--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(100)
        if isTokovoip then
            SendNUIMessage({
                action = 'voice-color',
                isTalking = exports.tokovoip_script:getPlayerData(GetPlayerServerId(PlayerId()), 'voip:talking')
            })
        else
            SendNUIMessage({
                action = 'voice-color',
                isTalking = NetworkIsPlayerTalking(PlayerId())
            })
        end
    end
end)]]--

Citizen.CreateThread(function()
    local currLevel = 1
    while true do
        Citizen.Wait(0)
		HideHudComponentThisFrame(7) -- Area Name
        HideHudComponentThisFrame(9) -- Street Name
        HideHudComponentThisFrame(3) -- SP Cash display
        HideHudComponentThisFrame(4)  -- MP Cash display
        HideHudComponentThisFrame(13) -- Cash changesSetPedHelmet(PlayerPedId(), false)

        if IsControlJustReleased(0, 344) then
            ToggleUI()
        end
		
        if IsControlJustReleased(1, 20) then
            if isTokovoip == true then
                currLevel =  exports.tokovoip_script:getPlayerData(GetPlayerServerId(PlayerId()), 'voip:mode')
                if currLevel == 1 then
                    SendNUIMessage({
                        action = 'set-voice',
                        value = 66
                    })
                elseif currLevel == 2 then
                    SendNUIMessage({
                        action = 'set-voice',
                        value = 33
                    })
                elseif currLevel == 3 then
                    SendNUIMessage({
                        action = 'set-voice',
                        value = 100
                    })
                end
            else
                currLevel = (currLevel + 1) % 3
                if currLevel == 0 then
                    SendNUIMessage({
                        action = 'set-voice',
                        value = 66
                    })
                elseif currLevel == 1 then
                    SendNUIMessage({
                        action = 'set-voice',
                        value = 100
                    })
                elseif currLevel == 2 then
                    SendNUIMessage({
                        action = 'set-voice',
                        value = 33
                    })
                end
            end
        end
    end
end)

--Food Thirst
Citizen.CreateThread(function()
    while true do
        TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
            TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
        local pHunger, pThirst = hunger.getPercent(), thirst.getPercent()
        if pHunger == 0.0 or pThirst == 0.0 then
            if not AnimpostfxIsRunning("DrugsTrevorClownsFight") then
                AnimpostfxPlay("DrugsTrevorClownsFight", 0, true)
                TriggerEvent('notification', 'You are feeling Hungry and dizzy', 1)
            end
        else
            if AnimpostfxIsRunning("DrugsTrevorClownsFight") then
                AnimpostfxStop("DrugsTrevorClownsFight")
                TriggerEvent('notification', 'You are feeling better within time', 1)
            end
        end
                SendNUIMessage({
                    action = "updateStatus",
                    hunger = pHunger,
                    thirst = pThirst
                })
            end)
        end)
        Citizen.Wait(5000)
    end
end)

RegisterNetEvent('disc-hud:EnteredVehicle')
AddEventHandler('disc-hud:EnteredVehicle', function()
    SendNUIMessage({
        action = 'showcar'
    })

    local player = PlayerPedId()
    local veh = GetVehiclePedIsIn(player)

    local prevHp = GetEntityHealth(veh)

    DisplayRadar(true)
    cruiseIsOn = false
    seatbeltIsOn = false
    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(0)
            -- When player in driver seat, handle cruise control
            if (GetPedInVehicleSeat(veh, -1) == player) then
                -- Check if cruise control button pressed, toggle state and set maximum speed appropriately
                if IsControlJustReleased(0, 48) then
                    if cruiseIsOn then
                        TriggerEvent('notification', 'Cruise Disabled', 2)
                    else
                        TriggerEvent('notification', 'Cruise Enabled', 1)
                    end

                    cruiseIsOn = not cruiseIsOn
                    SendNUIMessage({
                        action = 'toggle-cruise'
                    })
                    cruiseSpeed = GetEntitySpeed(veh)
                end
                local maxSpeed = cruiseIsOn and cruiseSpeed or GetVehicleHandlingFloat(veh, "CHandlingData", "fInitialDriveMaxFlatVel")
                SetEntityMaxSpeed(veh, maxSpeed)
            end
        end
    end)

    Citizen.CreateThread(function()
        local currSpeed = 0
        local prevVelocity = { x = 0.0, y = 0.0, z = 0.0 }
        while true do
            Citizen.Wait(0)
            local prevSpeed = currSpeed
            local position = GetEntityCoords(player)
            currSpeed = GetEntitySpeed(veh)
            if not seatbeltIsOn then
                local vehIsMovingFwd = GetEntitySpeedVector(veh, true).y > 1.0
                local vehAcc = (prevSpeed - currSpeed) / GetFrameTime()
                if (vehIsMovingFwd and (prevSpeed > seatbeltEjectSpeed) and (vehAcc > (seatbeltEjectAccel * 9.81))) then
                    SetEntityCoords(player, position.x, position.y, position.z - 0.47, true, true, true)
                    SetEntityVelocity(player, prevVelocity.x, prevVelocity.y, prevVelocity.z)
                    Citizen.Wait(1)
                    SetPedToRagdoll(player, 1000, 1000, 0, 0, 0, 0)
                else
                    prevVelocity = GetEntityVelocity(veh)
                end
            else
                DisableControlAction(0, 75)
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(0)
            if IsControlJustReleased(0, 305) then
                local vehClass = GetVehicleClass(veh)
                if vehClass ~= 8 and vehClass ~= 13 and vehClass ~= 14 then
                    if seatbeltIsOn then
                        TriggerEvent('notification', 'Seatbelt Disabled', 2)
                    else
                        TriggerEvent('notification', 'Seatbelt Enabled', 1)
                    end
                    seatbeltIsOn = not seatbeltIsOn
                    SendNUIMessage({
                        action = 'toggle-seatbelt'
                    })
                end
            end
        end
    end)

    Citizen.CreateThread(function()
        while IsPedInAnyVehicle(player) do
            Citizen.Wait(1000)
        end
        DisplayRadar(false)
        seatbeltIsOn = false
        cruiseIsOn = false
        SendNUIMessage({
            action = 'hidecar'
        })
    end)
end)

RegisterNetEvent("fuel:updatefuel")
AddEventHandler("fuel:updatefuel", function(vehs)

	vehiclesFuel = vehs
	--for a, b in pairs(vehiclesFuel) do if NetToVeh(a) and DoesEntityExist(NetToVeh(a)) then SetVehicleFuelLevel(NetToVeh(a), b) end end
end)

function map(x, in_min, in_max, out_min, out_max)
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end
local function IsVehicleValidForFuel(veh)
	local validVehs = {
		IsThisModelABicycle,
		IsThisModelAHeli
	}
	for _, b in ipairs(validVehs) do
		if b(GetEntityModel(veh)) then
			return false
		end
	end
	return true
end


local fueltimer = GetGameTimer()
CreateThread(function()
	while true do
		Wait(300)
		local playerPed = PlayerPedId()
		if IsPedInAnyVehicle(playerPed) then
			local fuel = nil
			local veh = GetVehiclePedIsUsing(PlayerPedId())
			local driver = GetPedInVehicleSeat(veh, -1)
			local vehnet = VehToNet(veh)
			if driver == playerPed then 

				if GetGameTimer() - fueltimer > 30000 then
					if IsVehicleValidForFuel(veh) then
						if GetIsVehicleEngineRunning(veh) then 
							TriggerServerEvent("fuel:updatefuel", vehnet)
						end
					end
					fueltimer = GetGameTimer()
				end
				--for a, b in pairs(vehiclesFuel) do print(a, VehToNet(GetVehiclePedIsUsing(PlayerPedId())), vehnet, vehiclesFuel[vehnet]) end
				--print(tostring(vehiclesFuel[vehnet]))
				if vehiclesFuel[vehnet] then
					if vehiclesFuel[vehnet] <= 0.0 then
						SetVehicleEngineOn(veh, false, false, true)
					end
					fuel = vehiclesFuel[vehnet]
				else
					local maxfuel = GetVehicleHandlingFloat(veh, "CHandlingData", "fPetrolTankVolume")
					local randomFuel = 0
					if maxfuel > 35 then
						randomFuel = math.random(35, maxfuel)
					end
					fuel = randomFuel

					vehiclesFuel[vehnet] = randomFuel
					TriggerServerEvent("fuel:updatefuel", vehnet, fuel)
				end
			else
				fuel = vehiclesFuel[vehnet]
			end
			if fuel then
				SendNUIMessage({
					action = 'update-fuel',
					fuel = math.floor(map(fuel, 0, 65, 0, 99))
				})
			end
			SetVehicleFuelLevel(veh, fuel + 0.0)
		end
		
		
	end
end)

RegisterNetEvent('disc-hud:EnteringVehicle')
AddEventHandler('disc-hud:EnteringVehicle', function(veh)
    seatbeltIsOn = false
    cruiseIsOn = false
    SendNUIMessage({
        action = "set-seatbelt",
        seatbelt = false
    })
    SendNUIMessage({
        action = "set-cruise",
        cruise = false
    })
end)

local hudStatus = true
local health = 0
local armor = 0
local myStamina = 0
local usingSeatbelt = false
local isTalking = false
local myOxygen = 10.0

local hour = 0
local minute = 0

local opacityBars = 0 

local Addition = 0.0

local HudStage = 1

--oxygenTank = 100.0

opacity = 0

local thirsty = 0

local hunger = 0

Citizen.CreateThread(function()
	
	while true do
		Citizen.Wait(5000)
		
		TriggerEvent('esx_status:getStatus', 'hunger', function(status)
			thirsty = status.val/1000000*100

		end)

		TriggerEvent('esx_status:getStatus', 'thirst', function(status)
			hunger = status.val/1000000*100

		end)
		
	end

end)


oxygenTank = 25.0

RegisterNetEvent("RemoveOxyTank")
AddEventHandler("RemoveOxyTank",function()
	if oxygenTank > 25.0 then
		oxygenTank = 25.0
	end
end)

RegisterNetEvent("UseOxygenTank")
AddEventHandler("UseOxygenTank",function()
	oxygenTank = 100.0
end)




function drawRct(x,y,width,height,r,g,b,a)

	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end

function NdrawTxt(x, y, width, height, scale, text, r, g, b, a, center)
  SetTextFont(6)
  SetTextProportional(0)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 1, 1, 1, 1)
  SetTextDropshadow(0, 0, 0, 0, 255)
  SetTextCentre(center)
  SetTextEntry("STRING")
  AddTextComponentString(text)
  DrawText(x - width / 2, y - height / 2 + 0.005)
end


local voipTypes = {
	
	{type = "Whisper", event = "pv:voip1"},
	{type = "Normal", event = "pv:voip2"},
	{type = "Yell", event = "pv:voip3"}
}

local voip = {}
voip['default'] = {name = 'default', setting = 18.0}
voip['local'] = {name = 'local', setting = 18.0}
voip['whisper'] = {name = 'whisper', setting = 4.0}
voip['yell'] = {name = 'yell', setting = 35.0}

AddEventHandler('np-base:playerSessionStarted', function()
	NetworkSetTalkerProximity(voip['default'].setting)
end)

RegisterNetEvent('pv:voip')
AddEventHandler('pv:voip', function(voipDistance)

	NotificationMessage("Your VOIP is now ~b~" .. voipsetting ..".")
	NetworkSetTalkerProximity(distanceSetting)
		
end)


distanceSetting = 18.0
NetworkSetTalkerProximity(18.0)

voipsetting = "Normal"
RegisterNetEvent('pv:voip1')
AddEventHandler('pv:voip1', function(voipDistance)
	distanceSetting = 4.0
	NetworkSetTalkerProximity(distanceSetting)
	voipsetting = "Whisper"
end)

RegisterNetEvent('pv:voip2')
AddEventHandler('pv:voip2', function(voipDistance)
	distanceSetting = 18.0
	NetworkSetTalkerProximity(distanceSetting)	
	voipsetting = "Normal"
end)


RegisterNetEvent('pv:voip3')
AddEventHandler('pv:voip3', function(voipDistance)
	distanceSetting = 35.0
	NetworkSetTalkerProximity(distanceSetting)	
	voipsetting = "Yell"
end)


Citizen.CreateThread(function()

	while true do
		if sleeping then
			if IsControlJustPressed(0,38) then
				sleeping = false
				DetachEntity(GetPlayerPed(-1), 1, true)
			end
		end


		if IsControlJustPressed(0,178) then
			if HudStage == 1 then
				HudStage = 2				
			elseif HudStage == 2 then
				HudStage = 3
				Addition = 0.001
			elseif HudStage == 3 then
				HudStage = 4
				Addition = 0.001
			else
				HudStage = 1			
				Addition = 0.001
			end
			TriggerEvent("disableHUD",HudStage)
		end

		if HudStage == 4 then
			if opacityBars < 255 then
				opacityBars = opacityBars + 1
			else
				opacityBars = 255
			end
			if Addition < 0.2 then
				Addition = Addition + 0.001
			end

			DrawRect(0,-0.2 + Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
			DrawRect(0,1.20 - Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
		end

		if HudStage ~= 4 then
			if opacityBars > 0 then
				opacityBars = opacityBars - 1
				Addition = Addition + 0.001
				DrawRect(0,0 - Addition, 2.0, 0.2, 1, 1, 1, opacityBars)
				DrawRect(0,0.98 + Addition, 2.0, 0.2, 1, 1, 1, opacityBars)				
			end
		end

		last_health = GetVehicleBodyHealth(GetVehiclePedIsIn(GetPlayerPed(-1),false))
		Citizen.Wait(1)

	    if IsHudComponentActive(1) then 
	        HideHudComponentThisFrame(1)
	    end

	    if IsHudComponentActive(6) then 
	        HideHudComponentThisFrame(6)
	    end

	    if IsHudComponentActive(7) then 
	        HideHudComponentThisFrame(7)
	    end

	    if IsHudComponentActive(9) then 
	        HideHudComponentThisFrame(9)
	    end

	    if IsHudComponentActive(0) and not IsPedInAnyVehicle(GetPlayerPed( -1 ), true) then 
	        HideHudComponentThisFrame(0)
	    end
		
	    SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)

		SetPedMinGroundTimeForStungun(GetPlayerPed(-1), 16000)

		if HudStage < 3 then

			local get_ped = GetPlayerPed(-1) -- current ped
			local get_ped_veh = GetVehiclePedIsIn(get_ped,false) -- Current Vehicle ped is in
			local plate_veh = GetVehicleNumberPlateText(get_ped_veh) -- Vehicle Plate
			local veh_stop = IsVehicleStopped(get_ped_veh) -- Parked or not
			local veh_engine_health = GetVehicleEngineHealth(get_ped_veh) -- Vehicle Engine Damage 
			local veh_body_health = GetVehicleBodyHealth(get_ped_veh)
			local veh_burnout = IsVehicleInBurnout(get_ped_veh) -- Vehicle Burnout
			local thespeed = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
			local siren_on = IsVehicleSirenOn(get_ped_veh)
			local varVoipSet = 0
			local stamina = 100 - GetPlayerSprintStaminaRemaining(PlayerId())


			if oxygenTank > 0 and IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
				SetPedDiesInWater(GetPlayerPed(-1), false)
				if oxygenTank > 25.0 then
					oxygenTank = oxygenTank - 0.001
				else
					oxygenTank = oxygenTank - 0.01
				end
			else
				SetPedDiesInWater(GetPlayerPed(-1), true)
			end

			if IsControlJustPressed(1, 303) then
				for k,v in ipairs(voipTypes) do
					if v.type == voipsetting then
						if k >= #voipTypes then TriggerEvent(voipTypes[1].event) break else TriggerEvent(voipTypes[k + 1].event) break end
					end
				end
			end

			if distanceSetting == 35.0 then
				varVoipSet = 0.027 * 0.1
			elseif distanceSetting == 18.0 then
				varVoipSet = 0.027 * 0.5
			elseif distanceSetting == 4.0 then
				varVoipSet = 0.027
			end


			if not IsPedSwimmingUnderWater( GetPlayerPed(-1) ) and oxygenTank < 25.0 then
				oxygenTank = oxygenTank + 0.01
				if oxygenTank > 25.0 then
					oxygenTank = 25.0
				end
			end

			if oxygenTank > 25.0 and not oxyOn then
				oxyOn = true

			elseif oxyOn and oxygenTank <= 25.0 then
				oxyOn = false
			end

		    if opacity > 0 and not fadein then
		    	opacity = opacity - 10
		    end

		    if opacity < 250 and fadein then
		    	opacity = opacity + 10
		    end

			if IsControlPressed(1, 249) or IsDisabledControlPressed(1, 249)  then
				talking = true
			else
				talking = false
			end

			drawRct(0.015, 0.9677, 0.1418,0.028,80,80,80,177)
			if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then
				SetEntityMaxHealth(GetPlayerPed(-1), 200)
				SetEntityHealth(GetPlayerPed(-1), 200)
			end					
			local health = GetEntityHealth(GetPlayerPed(-1)) - 100
			
			if health < 1 then health = 100 end

			local varSet = 0.06938 * (health / 100)
			
			drawRct(0.016, 0.97, 0.06938,0.01,190,190,190,80)
			drawRct(0.016, 0.97, varSet,0.01,55,190,55,177)



			armor = GetPedArmour(GetPlayerPed(-1))
			if armor > 100.0 then armor = 100.0 end

			local varSet = 0.06938 * (armor / 100)

			drawRct(0.0865, 0.97, 0.06938,0.01,190,190,190,80)
			drawRct(0.0865, 0.97, varSet,0.01,120,120,255,177)

			if hunger < 0 then
				hunger = 0
			end
			if thirsty < 0 then
				thirsty = 0
			end


			if thirsty > 100 then thirsty = 100 end
			varSet = 0.027 * (thirsty / 100)

			drawRct(0.016, 0.983, 0.0268,0.01,190,190,190,80)
			drawRct(0.016, 0.983, varSet,0.01,55,190,55,177)


			if hunger > 100 then hunger = 100 end
			varSet = 0.0268 * (hunger / 100)

			drawRct(0.044, 0.983, 0.027,0.01,190,190,190,80)
			drawRct(0.044, 0.983, varSet,0.01,80,80,255,177)


			varSet = 0.027 * (oxygenTank / 100)
			drawRct(0.072, 0.983, 0.027,0.01,190,190,190,80)
			drawRct(0.072, 0.983, varSet,0.01,255,255,55,177)

			if distanceSetting == 4.0 then
				varSet = 0.027 * 0.1
			elseif distanceSetting == 18.0 then
				varSet = 0.027 * 0.5
			elseif distanceSetting == 35.0 then
				varSet = 0.027
			end
			
			if talking  then
				drawRct(0.1, 0.983, varVoipSet,0.01,255, 55, 155,155)
				drawRct(0.1, 0.983, 0.027,0.01,255, 55, 155,170)
			else
				drawRct(0.1, 0.983, varVoipSet,0.01,205,205,205,155)
				drawRct(0.1, 0.983, 0.027,0.01,188,188,188,80)
			end

			varSet = 0.0278 * (stamina / 100)
			drawRct(0.128, 0.983, 0.0278,0.01,190,190,190,80)
			drawRct(0.128, 0.983, varSet,0.01,200, 0, 0,177)


			if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
				fadein = true
			else
				fadein = false
				veh_body_health = 0
			end	
		end
	end
end)




--[[local zoneNames = {
 AIRP = "Los Santos International Airport",
 ALAMO = "Alamo Sea",
 ALTA = "Alta",
 ARMYB = "Fort Zancudo",
 BANHAMC = "Banham Canyon Dr",
 BANNING = "Banning",
 BAYTRE = "Baytree Canyon",
 BEACH = "Vespucci Beach",
 BHAMCA = "Banham Canyon",
 BRADP = "Braddock Pass",
 BRADT = "Braddock Tunnel",
 BURTON = "Burton",
 CALAFB = "Calafia Bridge",
 CANNY = "Raton Canyon",
 CCREAK = "Cassidy Creek",
 CHAMH = "Chamberlain Hills",
 CHIL = "Vinewood Hills",
 CHU = "Chumash",
 CMSW = "Chiliad Mountain State Wilderness",
 CYPRE = "Cypress Flats",
 DAVIS = "Davis",
 DELBE = "Del Perro Beach",
 DELPE = "Del Perro",
 DELSOL = "La Puerta",
 DESRT = "Grand Senora Desert",
 DOWNT = "Downtown",
 DTVINE = "Downtown Vinewood",
 EAST_V = "East Vinewood",
 EBURO = "El Burro Heights",
 ELGORL = "El Gordo Lighthouse",
 ELYSIAN = "Elysian Island",
 GALFISH = "Galilee",
 GALLI = "Galileo Park",
 golf = "GWC and Golfing Society",
 GRAPES = "Grapeseed",
 GREATC = "Great Chaparral",
 HARMO = "Harmony",
 HAWICK = "Hawick",
 HORS = "Vinewood Racetrack",
 HUMLAB = "Humane Labs and Research",
 JAIL = "Bolingbroke Penitentiary",
 KOREAT = "Little Seoul",
 LACT = "Land Act Reservoir",
 LAGO = "Lago Zancudo",
 LDAM = "Land Act Dam",
 LEGSQU = "Legion Square",
 LMESA = "La Mesa",
 LOSPUER = "La Puerta",
 MIRR = "Mirror Park",
 MORN = "Morningwood",
 MOVIE = "Richards Majestic",
 MTCHIL = "Mount Chiliad",
 MTGORDO = "Mount Gordo",
 MTJOSE = "Mount Josiah",
 MURRI = "Murrieta Heights",
 NCHU = "North Chumash",
 NOOSE = "N.O.O.S.E",
 OCEANA = "Pacific Ocean",
 PALCOV = "Paleto Cove",
 PALETO = "Paleto Bay",
 PALFOR = "Paleto Forest",
 PALHIGH = "Palomino Highlands",
 PALMPOW = "Palmer-Taylor Power Station",
 PBLUFF = "Pacific Bluffs",
 PBOX = "Pillbox Hill",
 PROCOB = "Procopio Beach",
 RANCHO = "Rancho",
 RGLEN = "Richman Glen",
 RICHM = "Richman",
 ROCKF = "Rockford Hills",
 RTRAK = "Redwood Lights Track",
 SanAnd = "San Andreas",
 SANCHIA = "San Chianski Mountain Range",
 SANDY = "Sandy Shores",
 SKID = "Mission Row",
 SLAB = "Stab City",
 STAD = "Maze Bank Arena",
 STRAW = "Strawberry",
 TATAMO = "Tataviam Mountains",
 TERMINA = "Terminal",
 TEXTI = "Textile City",
 TONGVAH = "Tongva Hills",
 TONGVAV = "Tongva Valley",
 VCANA = "Vespucci Canals",
 VESP = "Vespucci",
 VINE = "Vinewood",
 WINDF = "Ron Alternates Wind Farm",
 WVINE = "West Vinewood",
 ZANCUDO = "Zancudo River",
 ZP_ORT = "Port of South Los Santos",
 ZQ_UAR = "Davis Quartz"
}

local showCompass = true
local lastStreet = nil
local lastStreetName = ""
local zone = "Unknown";

function getCardinalDirectionFromHeading(heading)
    if heading >= 315 or heading < 45 then
        return "North Bound"
    elseif heading >= 45 and heading < 135 then
        return "West Bound"
    elseif heading >=135 and heading < 225 then
        return "South Bound"
    elseif heading >= 225 and heading < 315 then
        return "East Bound"
    end
end]]--

--[[Citizen.CreateThread(function()
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
    local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
    currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    intersectStreetName = GetStreetNameFromHashKey(intersectStreetHash)
    zone = tostring(GetNameOfZone(x, y, z))
    playerStreetsLocation = zoneNames[tostring(zone)]

    if not zone then
        zone = "UNKNOWN"
        zoneNames['UNKNOWN'] = zone
    elseif not zoneNames[tostring(zone)] then
        local undefinedZone = zone .. " " .. x .. " " .. y .. " " .. z
        zoneNames[tostring(zone)] = "Undefined Zone"
    end

    if intersectStreetName ~= nil and intersectStreetName ~= "" then
        playerStreetsLocation = currentStreetName .. " | " .. intersectStreetName .. " | " .. zoneNames[tostring(zone)]
    elseif currentStreetName ~= nil and currentStreetName ~= "" then
        playerStreetsLocation = currentStreetName .. " | " .. zoneNames[tostring(zone)]
    else
        playerStreetsLocation = zoneNames[tostring(zone)]
    end

    while true do
        Citizen.Wait(2000)

		        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), true))
		        local currentStreetHash, intersectStreetHash = GetStreetNameAtCoord(x, y, z, currentStreetHash, intersectStreetHash)
		        currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
		        intersectStreetName = GetStreetNameFromHashKey(intersectStreetHash)
		        zone = tostring(GetNameOfZone(x, y, z))
		        playerStreetsLocation = zoneNames[tostring(zone)]

		        if not zone then
		            zone = "UNKNOWN"
		            zoneNames['UNKNOWN'] = zone
		        elseif not zoneNames[tostring(zone)] then
		            local undefinedZone = zone .. " " .. x .. " " .. y .. " " .. z
		            zoneNames[tostring(zone)] = "Undefined Zone"
		        end

		        if intersectStreetName ~= nil and intersectStreetName ~= "" then
		            playerStreetsLocation = currentStreetName .. " | " .. intersectStreetName .. " | " .. zoneNames[tostring(zone)]
		        elseif currentStreetName ~= nil and currentStreetName ~= "" then
		            playerStreetsLocation = currentStreetName .. " | " .. zoneNames[tostring(zone)]
		        else
		            playerStreetsLocation = zoneNames[tostring(zone)]
		        end

	end
end)]]--


--[[Citizen.CreateThread(function()

    while true do
        Citizen.Wait(1)
        DisplayRadar(true)
        if IsPedInAnyVehicle(PlayerPedId(), false) then

		  		local Mph = GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936
				local fuel = GetVehicleFuelLevel(GetVehiclePedIsIn(GetPlayerPed(-1), false))
				local time = CalculateTimeToDisplay()


				drawTxt(0.667, 1.424, 1.0,1.0,0.55 , "~w~" .. math.ceil(Mph), 255, 255, 255, 255)  
				drawTxt(0.685, 1.432, 1.0,1.0,0.3, "~w~ mph", 255, 255, 255, 255)
				drawTxt(0.714, 1.424, 1.0,1.0,0.55 , "~w~" .. math.ceil(fuel), 255, 255, 255, 255)
				drawTxt(0.732, 1.432, 1.0,1.0,0.3, "~w~ fuel", 255, 255, 255, 255)

				if usingSeatbelt then
          DisableControlAction(0, 75)
					drawTxt(0.757, 1.429, 1.0,1.0,0.4 , "~g~ BELT", 255, 255, 255, 255) 
				else
					drawTxt(0.757, 1.429, 1.0,1.0,0.4, "~r~ BELT", 255, 255, 255, 255)
				end

          drawTxt(0.668, 1.395, 1.0,1.0,0.33 ,"" .. hour .. ":" .. minute, 255, 255, 255, 255)

	        SetTextFont(4)
	        SetTextProportional(1)
	        SetTextScale(0.0, 0.43)
	        SetTextColour(255, 255, 255, 255)
	        SetTextDropshadow(0, 0, 0, 0, 255)
	        SetTextEdge(1, 0, 0, 0, 255)
	        SetTextDropShadow()
	        SetTextOutline()
	        SetTextEntry("STRING")

	        if showCompass then
	        	compass = getCardinalDirectionFromHeading(math.floor(GetEntityHeading(GetPlayerPed(-1)) + 0.5))
	        	lastStreetName = compass .. " | " .. playerStreetsLocation
	        end

	        AddTextComponentString(lastStreetName)
	        DrawText(0.168, 0.964)
      else
       DisplayRadar(false)
       Citizen.Wait(2000)
	    end
	end
end)]]--

function drawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end



--[[function CalculateTimeToDisplay()
  hour = GetClockHours()
  minute = GetClockMinutes()
  local type = 'AM'

 if hour == 1 or hour == 2 or hour == 3 or hour == 4 or hour == 5 or hour == 6 or hour == 7 or hour == 8 or hour == 9 or hour == 10 or hour == 11 or hour == 12 then
  type = 'AM'
 else
  type = 'PM'
 end

 if hour <= 9 then
  hour = "0" .. hour
 end
 if minute <= 9 then
  minute = "0" .. minute
 end
 minute = minute..' '..type
end

--SEATBELT--

local speedBuffer  = {}
local velBuffer    = {}
local wasInCar     = false
local carspeed = 0
local speed = 0

Citizen.CreateThread(function()
 Citizen.Wait(500)
  while true do
   local ped = GetPlayerPed(-1)
   local car = GetVehiclePedIsIn(ped)
   if car ~= 0 and (wasInCar or IsCar(car)) then
    wasInCar = true
    speedBuffer[2] = speedBuffer[1]
    speedBuffer[1] = GetEntitySpeed(car)
    if speedBuffer[2] ~= nil and GetEntitySpeedVector(car, true).y > 1.0 and speedBuffer[2] > 18.00 and (speedBuffer[2] - speedBuffer[1]) > (speedBuffer[2] * 0.465) and usingSeatbelt == false then
    local co = GetEntityCoords(ped, true)
    local fw = Fwv(ped)
    SetEntityCoords(ped, co.x + fw.x, co.y + fw.y, co.z - 0.47, true, true, true)
    SetEntityVelocity(ped, velBuffer[2].x-10/2, velBuffer[2].y-10/2, velBuffer[2].z-10/4)
    Citizen.Wait(1)
    SetPedToRagdoll(ped, 1000, 1000, 0, 0, 0, 0)
   end
    velBuffer[2] = velBuffer[1]
    velBuffer[1] = GetEntityVelocity(car)

    if IsControlJustPressed(0, 29) then
      if usingSeatbelt == false then
       usingSeatbelt = true
       TriggerEvent('notification', 'Seat Belt Enabled', 1)
       TriggerEvent('InteractSound_CL:PlayOnOne', 'buckle', 0.8)
       --ESX.ShowNotification('~g~Cintura allacciata')
      else
       usingSeatbelt = false
       TriggerEvent('notification', 'Seat Belt Disabled', 1)
       TriggerEvent('InteractSound_CL:PlayOnOne', 'unbuckle', 0.8)
       --ESX.ShowNotification('~r~Cintura tolta')
      end
    end


   elseif wasInCar then
    wasInCar = false
    usingSeatbelt = false
    speedBuffer[1], speedBuffer[2] = 0.0, 0.0
   end
   Citizen.Wait(5)
   speed = math.floor(GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false)) * 2.236936)
  end
end)

function IsCar(veh)
 local vc = GetVehicleClass(veh)
 return (vc >= 0 and vc <= 7) or (vc >= 9 and vc <= 12) or (vc >= 17 and vc <= 20)
end

function Fwv(entity)
 local hr = GetEntityHeading(entity) + 90.0
 if hr < 0.0 then hr = 360.0 + hr end
 hr = hr * 0.0174533
 return { x = math.cos(hr) * 2.0, y = math.sin(hr) * 2.0 }
end]]--