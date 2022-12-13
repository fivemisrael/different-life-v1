-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

MF_PlayerSafes = {}
local MFS = MF_PlayerSafes

MFS.UpdateVersion = '1.0.10'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

MFS.DrawTextDist  = 03.0
MFS.InteractDist  = 002.0
MFS.LoadSafeDist  = 050.0
MFS.DespawnDist   = 100.0