-- dl-disableheadwhip script by shalev
-- this script disables the option to give a whip to player's head.

CreateThread(function()
    while true do
        DrawSpotLightWithShadow(95.64, -1292.61, 31.2, 0.0, 0.0, -1.0, 255, 255, 255, 24.0, 5.0, 10.0, 100.0, 1.0, 1)
        DrawSpotLightWithShadow(95.64, -1292.61, 30.0, 0.0, 0.0, 1.0, 255, 255, 255, 24.0, 5.0, 10.0, 100.0, 1.0, 1)
        DrawSpotLightWithShadow(91.5, -1287.5, 28.74, 91.5, -1287.5, 28.74, 0, 32, 255, 10.0, 10.0, 10.0, 10.0, 1.0, 1)
        Wait(0)
        local ped = PlayerPedId()
                if IsPedArmed(ped, 6) then
            -- disables 'MeeleAttackLight'                	
            DisableControlAction(1, 140, true)
            -- disables 'MeeleAttackHeavy'
                DisableControlAction(1, 141, true)
            -- disables 'MeeleAttackAlternate'
                DisableControlAction(1, 142, true)
        end
    end
end)