local BleedingStates = {
    'Minor Bleeding',
    'Significant Bleeding',
    'Major Bleeding',
    'Extreme Bleeding',
}

local WoundStates = {
    'Irritated',
    'Fairly Painful',
    'Extremely Painful',
    'Unbearably Painful',
}

local Bones = {
    [0]     = 'NONE',
    [31085] = 'HEAD',
    [31086] = 'HEAD',
    [39317] = 'NECK',
    [57597] = 'SPINE',
    [23553] = 'SPINE',
    [24816] = 'SPINE',
    [24817] = 'SPINE',
    [24818] = 'SPINE',
    [10706] = 'UPPER_BODY',
    [64729] = 'UPPER_BODY',
    [11816] = 'LOWER_BODY',
    [45509] = 'LARM',
    [61163] = 'LARM',
    [18905] = 'LHAND',
    [4089] = 'LFINGER',
    [4090] = 'LFINGER',
    [4137] = 'LFINGER',
    [4138] = 'LFINGER',
    [4153] = 'LFINGER',
    [4154] = 'LFINGER',
    [4169] = 'LFINGER',
    [4170] = 'LFINGER',
    [4185] = 'LFINGER',
    [4186] = 'LFINGER',
    [26610] = 'LFINGER',
    [26611] = 'LFINGER',
    [26612] = 'LFINGER',
    [26613] = 'LFINGER',
    [26614] = 'LFINGER',
    [58271] = 'LLEG',
    [63931] = 'LLEG',
    [2108] = 'LFOOT',
    [14201] = 'LFOOT',
    [40269] = 'RARM',
    [28252] = 'RARM',
    [57005] = 'RHAND',
    [58866] = 'RFINGER',
    [58867] = 'RFINGER',
    [58868] = 'RFINGER',
    [58869] = 'RFINGER',
    [58870] = 'RFINGER',
    [64016] = 'RFINGER',
    [64017] = 'RFINGER',
    [64064] = 'RFINGER',
    [64065] = 'RFINGER',
    [64080] = 'RFINGER',
    [64081] = 'RFINGER',
    [64096] = 'RFINGER',
    [64097] = 'RFINGER',
    [64112] = 'RFINGER',
    [64113] = 'RFINGER',
    [36864] = 'RLEG',
    [51826] = 'RLEG',
    [20781] = 'RFOOT',
    [52301] = 'RFOOT',
}

local BodyParts = {
    ['HEAD'] = 'Head',
    ['NECK'] = 'Neck',
    ['SPINE'] = 'Spine',
    ['UPPER_BODY'] = 'Upper Body',
    ['LOWER_BODY'] = 'Lower Body',
    ['LARM'] = 'Left Arm',
    ['LHAND'] = 'Left Hand',
    ['LFINGER'] = 'Left Hand Fingers',
    ['LLEG'] = 'Left Leg',
    ['LFOOT'] = 'Left Foot',
    ['RARM'] = 'Right Arm',
    ['RHAND'] = 'Right Hand',
    ['RFINGER'] = 'Right Hand Fingers',
    ['RLEG'] = 'Right Leg',
    ['RFOOT'] = 'Right Foot'
}
local Damages = {
	2, -- 3hp in 45 seconds.
	5, -- 5hp in 30 seconds.
	7, -- 7hp in 30 seconds.
	10, -- 10hp in 30 seconds.	
}
local hurtLevel = 0
local limbNotifId = '1'
local bleedNotifId = '2'

--[[
RegisterNetEvent('mythic_hospital:client:UsePainKiller')
AddEventHandler('mythic_hospital:client:UsePainKiller', function(tier)
   print("painkiller")
   painkiller()
end)
]]
RegisterNetEvent('mythic_hospital:heal')
AddEventHandler('mythic_hospital:heal', function(itemName)
	if itemName == 'medkit' then
		painkiller()
	elseif itemName == 'bandage' then
		painkiller(1)
	end
end)

function painkiller(num)
	if num then
		if hurtLevel > 0 then
			hurtLevel = hurtLevel - num
		end
	else
		ResetPedMovementClipset(PlayerPedId(), 0.0)
		exports['mythic_notify']:PersistentAlert('end', limbNotifId)
		exports['mythic_notify']:PersistentAlert('end', bleedNotifId)
		hurtLevel = 0
	end
end

function BlackScreen()
	DoScreenFadeOut(100)
	while not IsScreenFadedOut() do
		Wait(50)
	end
	if not IsPedRagdoll(playerPed) and IsPedOnFoot(playerPed) and not IsPedSwimming(playerPed) then
		ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.08) -- change this float to increase/decrease camera shake
		SetPedToRagdoll(playerPed, 5000, 1, 2)
	end
	Wait(2000)
	DoScreenFadeIn(250)
end
local oldHealth = GetEntityHealth(PlayerPedId())
AddEventHandler('gameEventTriggered', function (name, args)
	--print('game event ' .. name .. ' (' .. json.encode(args) .. ')')
	if name == "CEventNetworkEntityDamage" and args[1] == PlayerPedId() then
		if oldHealth - GetEntityHealth(PlayerPedId()) > 10.0 then
			CreateThread(function()
				Wait(100)
				local hit, bone = GetPedLastDamageBone(PlayerPedId())
				if hit and Bones[bone] ~= 'NONE' then
					if hurtLevel < 4 then hurtLevel = hurtLevel + 1 end
					local limbDamageMsg = "Your "..BodyParts[Bones[bone]].." feels "..WoundStates[hurtLevel]
					local bleedMsg = "You have "..BleedingStates[hurtLevel]
					exports['mythic_notify']:PersistentAlert('end', bleedNotifId)
					--
					exports['mythic_notify']:PersistentAlert('start', limbNotifId, 'inform', limbDamageMsg, { ['background-color'] = '#760036' })
					exports['mythic_notify']:PersistentAlert('start', bleedNotifId, 'inform', bleedMsg, { ['background-color'] = '#760036' })
				--[[	if Bones[bone] == "HEAD" then
						CreateThread(BlackScreen)
					end]]
				end
			end)
		end
		
	end
end)
CreateThread(function()
	local playerPed = PlayerPedId()
	local health = GetEntityHealth(playerPed)
	local timer = 30
	RequestAnimSet("move_m@injured")
	while not HasAnimSetLoaded("move_m@injured") do
		Wait(1000)
	end
	while true do
		Wait(1000)
		playerPed = PlayerPedId()
		health = GetEntityHealth(playerPed)
		if hurtLevel > 0 then
			SetPedMovementClipset(playerPed, "move_m@injured", 1 )
			SetPlayerSprint(PlayerId(), false)
			timer = timer - 1
			if timer == 0 then
				SetEntityHealth(playerPed, health - Damages[hurtLevel])
				timer = 30
			end
			if health == 200 then
				painkiller()
			end
		else
			exports['mythic_notify']:PersistentAlert('end', limbNotifId)
			exports['mythic_notify']:PersistentAlert('end', bleedNotifId)
		end
	end
end)