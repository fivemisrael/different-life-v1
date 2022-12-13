ESX              = nil
local PlayerData = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand("time", function(args, rawCommand)
	TriggerEvent('notification', string.format("%02d:%02d", GetClockHours(), GetClockMinutes()), 1)
end)