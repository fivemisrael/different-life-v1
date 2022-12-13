Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5) -- A Short Daily of 5 MS
		DisableControlAction(0, 140, true) -- Disable the Light Dmg Contr ol
	end
end)