ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



---No HP Regeneration
Citizen.CreateThread(function()
     while true do
          Citizen.Wait(0)
          SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
     end
end)