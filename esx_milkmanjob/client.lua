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
local ustaw = false
local wylacz = false
Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)
--
RegisterNetEvent('freezeplayer1')
AddEventHandler('freezeplayer1', function(freeze)
	FreezeEntityPosition(PlayerPedId(), freeze)
end)
RegisterNetEvent('freezeplayer12')
AddEventHandler('freezeplayer12', function()
	wylacz = true
	FreezeEntityPosition(PlayerPedId(), true)
end)
RegisterNetEvent('freezeplayer13')
AddEventHandler('freezeplayer13', function()
	wylacz = false
	FreezeEntityPosition(PlayerPedId(), false)
end)
--
RegisterNetEvent('start1')
AddEventHandler('start1', function()
	Citizen.CreateThread(function()
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
		local procent = 0
		local ziemniak = 1 + math.random(0,1)
		local player = PlayerPedId()
		local lib, anim = 'amb@prop_human_movie_bulb@idle_a', 'idle_a'
		ustaw = true
		ClearPedTasks(ped)
		TriggerEvent('freezeplayer1', true)
		ESX.Streaming.RequestAnimDict(lib, function()
			TaskStartScenarioInPlace(GetPlayerPed(-1), "PROP_HUMAN_BUM_BIN", 0, true)
		end)
		while procent <= 1000 do
			ESX.Game.Utils.DrawText3D(coords, "Milking " .. tonumber(procent * 0.1) ..'%', 0.4)
			Wait(0)
			procent = procent + 1
		end
		TriggerEvent('freezeplayer1', false)
		TriggerServerEvent('wezmleko', ziemniak)
		ClearPedTasks(ped)
		ustaw = false
 end)
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
			local coords = GetEntityCoords(PlayerPedId())
				if(GetDistanceBetweenCoords(coords, 1565.56, -1675.16, 88.19, true) < 3.0) and ustaw == false then
					ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to milk a cow') -- Polskie znaki
					if IsControlJustReleased(0, Keys['E']) then
						TriggerEvent('start1')
					end
				elseif(GetDistanceBetweenCoords(coords, 1559.38, -1657.34, 88.14, true) < 3.0) and ustaw == false then
						ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to milk a cow') -- Polskie znaki
						if IsControlJustReleased(0, Keys['E']) then
							TriggerEvent('start1')
						end
					end
	end
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
    local coords = GetEntityCoords(PlayerPedId())
			if GetDistanceBetweenCoords(coords, 1565.56, -1675.16, 88.19, true) < 30 then
				DrawText3DTest(1565.56, -1675.16, 88.19, '~g~Cow', 0.3)
				DrawText3DTest(1559.38, -1657.34, 88.14, '~g~Cow', 0.3)
			end
  end
end)
function DrawText3DTest(x,y,z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	if onScreen then
			SetTextScale(0.2, 0.2)
			SetTextFont(0)
			SetTextProportional(1)
			-- SetTextScale(0.0, 0.55)
			SetTextColour(255, 255, 255, 255)
			SetTextDropshadow(0, 0, 0, 0, 55)
			SetTextEdge(2, 0, 0, 0, 150)
			SetTextDropShadow()
			SetTextOutline()
			SetTextEntry("STRING")
			SetTextCentre(1)
			AddTextComponentString(text)
			DrawText(_x,_y)
	end
end
--
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(1561.81, -1693.01, 89.21)
	SetBlipSprite (blip, 442)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, 1.0)
	SetBlipColour (blip, 0)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Milking cows')
	EndTextCommandSetBlipName(blip)
end)
--
Citizen.CreateThread(function()
	local blip = AddBlipForCoord(54.68, -1336.33, 29.31)
	SetBlipSprite (blip, 467)
	SetBlipDisplay(blip, 4)
	SetBlipScale  (blip, 0.7)
	SetBlipColour (blip, 0)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName('STRING')
	AddTextComponentString('Sale of milk')
	EndTextCommandSetBlipName(blip)
end)
--
RegisterNetEvent('sprzedajumyte')
AddEventHandler('sprzedajumyte', function()
	ClearPedTasks(PlayerPedId())
	TriggerEvent('freezeplayer', true)
	DoScreenFadeOut(800)
	Citizen.Wait(1000)
	StopScreenEffect('DeathFailOut')
	DoScreenFadeIn(800)
	TriggerServerEvent('sprzedajumyte', source)
	TriggerEvent('freezeplayer', false)
end)
--
Citizen.CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
				if GetDistanceBetweenCoords(coords, 54.68, -1336.33, 29.31, true) < 3 then
					ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to sell milk') -- Polskie znaki
					if IsControlJustReleased(0, Keys['E']) and wylacz == false then
						TriggerServerEvent('sprzedajmleko', source)
					end
				end
  end
end)

Citizen.CreateThread(function()
  
    RequestModel(GetHashKey("a_c_cow"))
    while not HasModelLoaded(GetHashKey("a_c_cow")) do
      Wait(155)
    end

      local ped =  CreatePed(4, GetHashKey("a_c_cow"), 1565.56, -1675.16, 87.19, 295.51, false, true)
      FreezeEntityPosition(ped, true)
      SetEntityInvincible(ped, true)
      SetBlockingOfNonTemporaryEvents(ped, true)
end)

Citizen.CreateThread(function()
  
	RequestModel(GetHashKey("a_c_cow"))
	while not HasModelLoaded(GetHashKey("a_c_cow")) do
		Wait(155)
	end
		local ped =  CreatePed(4, GetHashKey("a_c_cow"), 1559.38, -1657.34, 87.14, 295.51, false, true)
		FreezeEntityPosition(ped, true)
		SetEntityInvincible(ped, true)
		SetBlockingOfNonTemporaryEvents(ped, true)
end)