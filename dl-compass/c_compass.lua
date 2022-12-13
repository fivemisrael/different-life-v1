local settings = {x = 0.175, y = 0.98, w = 0.04, degrees = 45, line = 9, rw = 2, rh = 8}

function degreesName(h)
	if h < 22.5 then
		return "N"
	elseif h < 67.5 then
		return "NW"
	elseif h < 112.5 then
		return "W"
	elseif h < 157.5 then
		return "SW"
	elseif h < 202.5 then
		return "S"
	elseif h < 247.5 then
		return "SE"
	elseif h < 292.5 then
		return "E"
	else
		return "NE"
	end
end

function drawTxt(text, x, y, scale, r, g, b, a)
	SetTextFont(0)
	SetTextProportional(0)
	SetTextScale(scale, scale)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextCentre(true)
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x, y)
end

CreateThread(function()
	local inveh = false
	while true do
		Wait(inveh and 0 or 250)
		local ped = PlayerPedId()
		inveh = IsPedInAnyVehicle(ped)
		if inveh then
			local sx, sy = GetActiveScreenResolution()
			local cw, ch = settings.rw/sx, settings.rh/sy
			local rot = GetGameplayCamRot()
			local z = (rot.z+360-settings.degrees/2)%360
			local lz = z%settings.line
			for i = settings.degrees+lz, lz, -settings.line do
				local ang = math.floor(settings.degrees-i+z)%360
				local x, y = settings.x+((i/settings.degrees)*settings.w), settings.y
				local test1 = ang%90
				local test2 = test1%45 == 0
				test1 = test1 == 0
				if test2 then
					drawTxt(degreesName(ang), x, test1 and y-0.012 or (y-ch/2-0.02), test1 and 0.3 or 0.2, 255, 255, 255, 255)
				end
				if test1 then
					DrawRect(x, y, (settings.w*(settings.line/settings.degrees))*1.25, 24/sy, 0, 0, 0, 100)
				else
					DrawRect(x, y, cw, ch*(test2 and 1.5 or 1), 255, 255, 255, 255)
				end
			end
		end
	end
end)