local knockedOut = false
local wait = 8
local count = 60
Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.5)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.6)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNUCKLE"), 0.7)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BAT"), 0.7)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_KNIFE"), 0.8)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_DAGGER"), 0.9)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_SWITCHBLADE"), 0.9)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_BOTTLE"), 0.8)
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_MACHETE"), 1.0)
	Wait(0)
    end
end)


Citizen.CreateThread(function()
	while true do
		Wait(1)
		local myPed = GetPlayerPed(-1)
		if IsPedInMeleeCombat(myPed) then
			if GetEntityHealth(myPed) < 0 then
				SetPlayerInvincible(PlayerId(), true)
				SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
				wait = 8
				knockedOut = true
			end
		end
		if knockedOut == true then
			SetPlayerInvincible(PlayerId(), true)
			DisablePlayerFiring(PlayerId(), true)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ResetPedRagdollTimer(myPed)
			
			if wait >= 0 then
				count = count - 1
				if count == 0 then
					count = 60
					wait = wait - 1
				end
			else
				SetPlayerInvincible(PlayerId(), false)
				knockedOut = false
			end
		end
	end
end)