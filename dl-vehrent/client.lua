-- Script Made By Aljunier | Made For ESX Framework --

ESX                           = nil
local PlayerData              = {}

--ESX & Blips & Markers
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	
    PlayerData = ESX.GetPlayerData()
    
    LoadBlips()
    LoadMarkers()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(5000)
end)



--Blips & Markers Functions
function LoadBlips()
    Citizen.CreateThread(function()
        Citizen.Wait(5)
        for _, coords in pairs(Config.RentalLocations) do
            local Marker = coords['Marker']
            local blip = AddBlipForCoord(Marker['x'], Marker['y'], Marker['z'])
            local Type = Marker['Type']

            if Type == 'Commercial Rental' then --Change Blip For Commercial Rental Locations
                SetBlipSprite  (blip, 67)
            else
                SetBlipSprite  (blip, 326)
            end
            SetBlipDisplay (blip, 4)
            SetBlipScale   (blip, 0.7)
            SetBlipColour  (blip, 55)
            SetBlipAsShortRange (blip, true)

            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(Type) -- Will Be Named As The Type
            EndTextCommandSetBlipName(blip)
        end
    end)
end

function LoadMarkers()
    Citizen.CreateThread(function()

        while true do   --Constance Loop
            Citizen.Wait(5)

            local playercoords = GetEntityCoords(PlayerPedId())

            for _, v in pairs(Config.RentalLocations) do    --Establishes Config
                local Marker = v['Marker']
                local VS = v['VehicleSpawn']
                local VR = v['VehicleReturn']
                local PlayerDistance = GetDistanceBetweenCoords(playercoords, Marker['x'], Marker['y'], Marker['z'], true)
                local PlayerDistanceVR = GetDistanceBetweenCoords(playercoords, VR['x'], VR['y'], VR['z'], true)

                --Draws Marker If Close By
                if PlayerDistance <= 20 then
                    DrawMarker(Config.MarkerType, Marker['x'], Marker['y'], Marker['z'] - 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 0.0, 200, 0.0, 100, false, false, 2, true, false, false, false)

                    --Give player a hint once close to the marker
                    if PlayerDistance <= 3 then
                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to rent a vehicle") --Hint
                        if IsControlJustReleased(0, 38) and not IsPedInAnyVehicle(GetPlayerPed(-1), false) then --If player pressed E and isn't in a vehicle
                            local type = Marker['Type'] --Collects vehicle type to give correct vehicle listings in ESX UI
                            OpenRentVehicleMenu(VS['x'], VS['y'], VS['z'], VS['Heading'], type)
                        elseif IsControlJustPressed(0, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) then  --If they are in a vehicle
                            TriggerEvent('notification', 'You cannot be in a vehicle!', 2)
                        end
                    end
                end
                

                -- Vehicle Returns

                --Draw Marker If Close By
                if PlayerDistanceVR <= 20 and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                    DrawMarker(Config.MarkerType, VR['x'], VR['y'], VR['z'] - 0.95, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 200, 0.0, 0.0, 100, false, false, 2, true, false, false, false)

                    --Give player a hint once close to the marker & in vehicle
                    if PlayerDistanceVR <= 1.5 and IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                        ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to return vehicle") --Hint

                        -- Checks to see if player is in vehicle and is in driver seat
                        if IsControlJustReleased(0, 38) and IsPedInAnyVehicle(GetPlayerPed(-1), false) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) then

                            for _, rc in pairs(Config.RentalCars) do
                                local RI = rc['Rental Info']
                                local RC = RI['model']
--[[
                                for __, c in pairs(Config.CommercialRentals) do
                                    local CRI = c['Rental Info']
                                    local CR = CRI['model']
]]
                                    -- Checks if vehicle player is trying to return is a rental or not
                                    if GetEntityModel(GetVehiclePedIsIn(GetPlayerPed(-1), false)) == GetHashKey(RC) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1) then
                                        ESX.Game.DeleteVehicle(GetVehiclePedIsIn(GetPlayerPed(-1), false))
                                        TriggerEvent('notification', 'You returned your rental!', 1)
                                    end
                               -- end
                            end
                        end
                    end
                end                
            end
        end
    end)
end



-- Rental Menu
function OpenRentVehicleMenu(x, y, z, heading, type)
    local elements = {} --Puts config in a table

    --Overview: Inserts Value Into ESX UI
    if type == 'Car Rental' then    -- If it is a car rental location then insert those vehicles in the UI
        for _, vehicle in pairs(Config.RentalCars) do
            local V = vehicle['Rental Info']
            table.insert(elements, {label = V['information'], value = V['price'], model = V['model']})
        end
    elseif type == 'Commercial Rental' then    -- If it is a commercial rental location then insert those vehicles in the UI
        for _, vehicle in pairs(Config.CommercialRentals) do
            local V = vehicle['Rental Info']
            table.insert(elements, {label = V['information'], value = V['price'], model = V['model']})
        end
    end


    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'rent_vehicle',
    {
        title = 'Rent A Vehicle',
        align = 'bottom-right',
        elements = elements,
      },
      function (data, menu)
        menu.close()

        local closevehicle = GetClosestVehicle(x, y, z, 3.0,  0,  71)   --Checks if there is a vehicle in the way

        if not DoesEntityExist(closevehicle) then   --If there is no vehicle in the way, the rental will spawn
            TriggerServerEvent('Al_RentVehicle', x, y, z, heading, data.current.value, data.current.model)
        elseif DoesEntityExist(closevehicle) then   --If there is a vehicle in the way, then an error message will appear
            TriggerEvent('notification', 'There is a vehicle in the way!', 2)
        end
	end, function(data, menu)
		menu.close()
	end)
end



--Function for spawning vehicle
RegisterNetEvent('Al_SpawnRentalVehicle')
AddEventHandler('Al_SpawnRentalVehicle', function(x, y, z, heading, vehicle)
    ESX.Game.SpawnVehicle(vehicle,{
        x = x,
        y = y,
        z = z + 1							
        },heading, function(rental) --Spawns vehicle and declares extra functions: Radio Off, Teleport Player In Vehicle, Ensure Vehicle Won't Despawn, Set Vehicle Plate To "Rental", Sets Vehicle Fuel To 100%
        SetVehRadioStation(rental, "OFF")
        TaskWarpPedIntoVehicle(GetPlayerPed(-1), rental, -1)
        SetEntityAsMissionEntity(rental, false, false)
        SetVehicleNumberPlateText(rental, "Rental")
        SetVehicleFuelLevel(rental, 100.0 )
    end)
end)