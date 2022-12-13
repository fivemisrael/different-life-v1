local pizzeria = { x = -1095.69,  y = -817.54,  z = 19.04} 

Citizen.CreateThread(function()
local time = 0
  while true do
    Wait(time)
	DrawMarker(20,pizzeria.x,pizzeria.y,pizzeria.z, 0, 0, 0, 0, 0, 0, 0.7, 0.7, 0.7,0,0,255, 100, 1, 1, 1, 1)
	if GetDistanceBetweenCoords(pizzeria.x, pizzeria.y, pizzeria.z, GetEntityCoords(GetPlayerPed(-1),true)) < 1.5 then
	 HelpText("Press ~INPUT_CONTEXT~ to open the ~b~Police Weapon Form",0,1,0.5,0.8,0.6,255,255,255,255)
		if IsControlJustPressed(1,38) then
openmenu()
	end
	end
	end
	end)
	





Citizen.CreateThread(function()
SetNuiFocus(false)
end)

function openmenu()
				SetNuiFocus(true, true)
				SendNUIMessage({type = 'open', players = getPlayers()})
end

RegisterNUICallback('close', function(data, cb)
	SetNuiFocus(false)
end)

function getPlayers()
	local players = {}
	for i = 0,32 do
		if NetworkIsPlayerActive(i) then
			table.insert(players, {id = GetPlayerServerId(i), name = GetPlayerName(i)})
		end
	end
	return players
end

function HelpText(text, state) --Fonction qui permet de creer les "Help Text" (Type "Appuyez sur ...")
  SetTextComponentFormat("STRING")
  AddTextComponentString(text)
  DisplayHelpTextFromStringLabel(0, state, 0, -1)
end
