RegisterNetEvent("realtime:event")
local servertime = {h = 0, m = 0, s = 0}
CreateThread(function()
	NetworkOverrideClockTime(12, 0, 0)
	Wait(500)
	while true do
		Wait(33)
		NetworkOverrideClockTime(servertime.h, servertime.m, servertime.s)
	end
end)

AddEventHandler("realtime:event", function(thefunction, args)
	if thefunction == "SetTime" then
		servertime = args
	end
end)