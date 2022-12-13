RegisterNetEvent("hotwire:event")
local vehicles = {}
local tiptext = ""
local lockpick = false
--[[CreateThread(function()
	TriggerServerEvent("hotwire:event", "getinfo")
	while true do
		Wait(0)
		local ped = PlayerPedId()
		if IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsUsing(ped)
			if GetPedInVehicleSeat(veh, -1) == ped then
				if IsVehicleNeedsToBeHotwired(veh) then
					SetVehicleNeedsToBeHotwired(veh, false)
					SetVehicleEngineOn(veh, false, false, true)
					if NetworkGetEntityIsNetworked(veh) then -- מניעת באגים
						local nveh = NetworkGetNetworkIdFromEntity(veh) -- סיכרון עם השרת
						TriggerServerEvent("hotwire:event", "hotwirecheck", nveh)
					end
				end
				if IsControlJustPressed(ped, 104) then
					print("check1")
					if NetworkGetEntityIsNetworked(veh) then -- מניעת באגים
						print("check1.5")
						local nveh = NetworkGetNetworkIdFromEntity(veh) -- סיכרון עם השרת
						while (not vehicles[nveh] or not vehicles[nveh].hotwire) and IsPedInAnyVehicle(ped, true) do
							print("check2")
							Wait(100)
						end
						if IsPedInAnyVehicle(ped, true) and vehicles[nveh].hotwire then
							if vehicles[nveh].hotwire == "key" then
								SetVehicleEngineOn(veh, false, true, false)
							end
							if vehicles[nveh].hotwire == "hotwire" then
								local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
								local anim = "machinic_loop_mechandplayer"
								RequestAnimDict(animDict)
								while not HasAnimDictLoaded(animDict) do Wait(100) end
								TaskPlayAnim(ped, animDict, anim, 3.0, 1.0, -1, 49, 1, 0, 0, 0)
								SendNUIMessage({meta = "show"})
								local vtext = {"מסדר מערך כבלים", "מתניע את הרכב..."}
								local finished = true
								for i = 1, #vtext do
									if IsPedInAnyVehicle(ped, true) then
										local atime = GetGameTimer()
										local btime = 0
										local ctime = 15000+(i-1)*10000
										SendNUIMessage({meta = "text", text = vtext[i]})
										while btime < ctime do
											local tick = GetGameTimer()
											btime = tick-atime
											SendNUIMessage({meta = "updatebar", bar = btime, maxbar = ctime})
											SetVehicleEngineOn(veh, false, false, true)
											if not IsPedInAnyVehicle(ped, true) then
												btime = ctime
												finished = false
											end
											Wait(0)
										end
									end
								end
								SendNUIMessage({meta = "hide"})
								StopAnimTask(ped, animDict, anim, 1.0)
								if finished then
									SetVehicleEngineOn(veh, true, true, false)
								else
									SetVehicleEngineOn(veh, false, false, true)
								end
							end
						end
					else
						SetVehicleEngineOn(veh, false, false, true)
					end
				end
			end
		end
	end
end)--]]
CreateThread(function()
	while true do
		Wait(0)
		DisableControlAction(0, 199, true)
	end
end)
-- CreateThread(function()
	-- while true do
		-- Wait(0)
		-- local ped = PlayerPedId()
		-- if IsPlayerFreeAiming(ped) then
			-- local playerid = PlayerId()
			-- local aiming, target = GetEntityPlayerIsFreeAimingAt(playerid)
			-- if aiming then
				-- if DoesEntityExist(target) and IsEntityAPed(target) and not IsPedAPlayer(target) and not IsPedInAnyVehicle(ped) then
					-- if IsPedArmed(ped, 7) then
						 -- local vehicle = GetVehiclePedIsUsing(target)
						-- TaskLeaveVehicle(target, vehicle, 256)
						-- while IsPedInAnyVehicle(target) do
							-- Wait(0)
						-- end
						-- RequestAnimDict("missfbi5ig_22")
						RequestAnimDict("mp_common")
						-- SetPedDropsWeaponsWhenDead(target, false)
						-- ClearPedTasks(target)
						-- TaskTurnPedToFaceEntity(target, GetPlayerPed(-1), 3.0)
						-- TaskSetBlockingOfNonTemporaryEvents(target, true)
						-- SetPedFleeAttributes(target, 0, 0)
						-- SetPedCombatAttributes(target, 17, 1)
						-- SetPedSeeingRange(target, 0.0)
						-- SetPedHearingRange(target, 0.0)
						-- SetPedAlertness(target, 0)
						-- SetPedKeepTask(target, true)
						-- while not HasAnimDictLoaded("missfbi5ig_22") do
							-- Wait(100)
						-- end
						-- TaskPlayAnim(target, "missfbi5ig_22", "hands_up_anxious_scientist", 8.0, -8, -1, 12, 1, 0, 0, 0)
						-- RemoveAnimDict("missfbi5ig_22")
						-- Wait(3000)
						-- local distance = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), true), GetEntityCoords(vehicle, true), false)
						-- if not IsEntityDead(target) and distance < 12 then
							-- TaskReactAndFleePed(target, GetPlayerPed(-1))
							-- SetPedKeepTask(target, true)
						-- end
					-- end
				-- end
			-- end
		-- end
	-- end
-- end)
CreateThread(function()
	local gtime = 300
	local wtime = gtime
	local hasalarm = false
	while true do
		Wait(wtime)
		local ped = PlayerPedId()
		--if IsPedGettingIntoAVehicle(ped) then
		if GetVehiclePedIsTryingToEnter(ped) ~= 0 then
			local veh = GetVehiclePedIsTryingToEnter(ped)
			if NetworkGetEntityIsNetworked(veh) then
				local nveh = NetworkGetNetworkIdFromEntity(veh)
				if not vehicles[nveh] or not vehicles[nveh].islock then
					local lnum = GetVehicleDoorLockStatus(veh)
					if not IsVehicleSeatFree(veh, -1) and not IsPedAPlayer(GetPedInVehicleSeat(veh, -1)) and lnum ~= 2 then
						print("check lock")
						SetVehicleDoorsLocked(veh, 2)
						TriggerServerEvent("hotwire:event", "islock", nveh)
						local num = 0
						while (not vehicles[nveh] or not vehicles[nveh].islock) and num < 10 do Wait(100) num = num+1 end
						if vehicles[nveh].islock == "false" then
							print("not lock")
							SetVehicleDoorsLocked(veh, lnum)
						end
					end
				end
				if IsVehicleNeedsToBeHotwired(veh) then
					if not vehicles[nveh] or not vehicles[nveh].hotwire then
						TriggerServerEvent("hotwire:event", "hotwirecheck", nveh)
						local num = 0
						while (not vehicles[nveh] or not vehicles[nveh].hotwire) and num < 10 do Wait(100) num = num+1 end
					end
					SetVehicleNeedsToBeHotwired(veh, false)
					SetVehicleAlarm(veh, true)
					SetVehicleEngineOn(veh, false, false, true)
				end
			end
			setTipText("")
		elseif IsPedInAnyVehicle(ped, true) then
			local veh = GetVehiclePedIsUsing(ped)
			if not IsVehicleSeatFree(veh, -1) and GetPedInVehicleSeat(veh, -1) == ped and IsThisModelACar(GetEntityModel(veh)) then
				if IsVehicleAlarmActivated(veh) then
					local pos = GetEntityCoords(ped)
					local plate = GetVehicleNumberPlateText(veh)
					TriggerServerEvent("esx_addons_gcphone:startCall", "police", "Grand Theft Auto in progress. Plates: "..plate, pos)
					SetVehicleAlarm(veh, false)
				end
				if NetworkGetEntityIsNetworked(veh) then
					local nveh = NetworkGetNetworkIdFromEntity(veh)
					if IsVehicleNeedsToBeHotwired(veh) and not vehicles[nveh] then
						SetVehicleNeedsToBeHotwired(veh, false)
						SetVehicleAlarm(veh, true)
						SetVehicleEngineOn(veh, false, false, true)
						if not vehicles[nveh] then
							TriggerServerEvent("hotwire:event", "hotwirecheck", nveh)
							while IsPedInAnyVehicle(ped, true) and (not vehicles[nveh] or not vehicles[nveh].hotwire) do Wait(100) end
						end
					end
					if not vehicles[nveh] or vehicles[nveh].hotwire ~= "hacked" then
						if wtime ~= 0 then wtime = 0 end
						if IsPedInAnyVehicle(ped, true) and vehicles[nveh] then
							if vehicles[nveh] and vehicles[nveh].hotwire ~= "hacked" then
								--print(vehicles[nveh] and vehicles[nveh].hotwire or "fuck it")
								setTipText("החזק/י <img src=\"images/P.png\" style=\"top: 10px;width: 15px;height: 15px;\"/> כדי לחפש מפתחות במכונית<br>לחץ/י <img src=\"images/H.png\" style=\"top: 10px;width: 15px;height: 15px;\"/> כדי להתחיל לבצע Hotwire")
								if IsControlJustPressed(0, 104) or IsDisabledControlJustPressed(0, 199) then
									if IsControlJustPressed(0, 104) then
										setTipText("")
										local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
										local anim = "machinic_loop_mechandplayer"
										RequestAnimDict(animDict)
										while not HasAnimDictLoaded(animDict) do Wait(100) end
										TaskPlayAnim(ped, animDict, anim, 3.0, 1.0, -1, 49, 1, 0, 0, 0)
										RemoveAnimDict(animDict)
										SendNUIMessage({meta = "show"})
										local vtext = {"מסדר מערך כבלים", "מתניע את הרכב..."}
										TriggerEvent('notification', "Hotwiring...", 1)
										local finished = true
										for i = 1, #vtext do
											if IsPedInAnyVehicle(ped, true) then
												local atime = GetGameTimer()
												local btime = 0
												local ctime = 15000+(i-1)*10000
												SendNUIMessage({meta = "text", text = vtext[i]})
												while btime < ctime do
													local tick = GetGameTimer()
													btime = tick-atime
													if btime > ctime then btime = ctime end
													SendNUIMessage({meta = "updatebar", bar = btime, maxbar = ctime})
													--SetVehicleEngineOn(veh, false, false, true)
													if not IsPedInAnyVehicle(ped, true) then
														btime = ctime
														finished = false
													end
													Wait(0)
												end
											end
										end
										SendNUIMessage({meta = "hide"})
										StopAnimTask(ped, animDict, anim, 1.0)
										if finished then
											SetVehicleEngineOn(veh, true, true, false)
											TriggerServerEvent("hotwire:event", "hotwirehacked", nveh)
											TriggerEvent('notification', "Hotwire succeeded!", 1)
										else
											SetVehicleEngineOn(veh, false, false, true)
										end
									end
									if IsDisabledControlJustPressed(0, 199) then
										setTipText("")
										local keys = (vehicles[nveh].hotwire == "key" and vehicles[nveh].searchkey)
										local atime = GetGameTimer()
										local btime = 0
										local ctime = 20000
										local dtime = keys and vehicles[nveh].searchkey or 0
										local found = false
										SendNUIMessage({meta = "show"})
										SendNUIMessage({meta = "text", text = "מחפש מפתחות"})
										while IsDisabledControlPressed(2, 199) and IsPedInAnyVehicle(ped) and btime < ctime and not found do
											local tick = GetGameTimer()
											btime = tick-atime
											if btime > ctime then btime = ctime end
											SendNUIMessage({meta = "updatebar", bar = btime, maxbar = ctime})
											if keys and dtime <= btime then
												found = true
											end
											Wait(0)
										end
										SendNUIMessage({meta = "hide"})
										if found and IsPedInAnyVehicle(ped) then
											SetVehicleEngineOn(veh, false, true, false)
											TriggerServerEvent("hotwire:event", "hotwirehacked", nveh)
											TriggerEvent('notification', "Keys found!", 1)
										else
											TriggerEvent('notification', "No keys found, hotwire is required", 2)
										end
									end
								end
							end
						end
					else
						setTipText("")
						if wtime ~= gtime then wtime = gtime end
					end
				end
			end
		else
			setTipText("")
			if wtime ~= gtime then wtime = gtime end
		end
		--[[else
			local pos = GetEntityCoords(ped)
			if IsVehicleInRadius(pos, 3.0) then
				local text = "לחץ/י <img src=\"images/F.png\" style=\"top: 10px;width: 15px;height: 15px;\"/> כדי לשבור את החלון"
				setTipText(text)
				-- if wtime ~= gtime then wtime = gtime end
				if lockpick then
					if wtime ~= 0 then wtime = 0 end
					if IsDisabledControlJustPressed(0, 199) then
						local veh, dist = GetClosestVehicle2(pos)
						if veh ~= -1 and dist < 3 and dist ~= -1 and DoesEntityExist(veh) and NetworkGetEntityIsNetworked(veh) and IsThisModelACar(GetEntityModel(veh)) then
							setTipText("")
							local boneindex = GetEntityBoneIndexByName(veh, "door_dside_f")
							local pos2 = GetWorldPositionOfEntityBone(veh, boneindex)
							local ang = (GetEntityHeading(veh)+270)%360
							local rang, rang2 = math.rad(ang), math.rad(ang-90)
							local addx, addy = -math.sin(rang)*0.75+math.sin(rang2)*1.08, math.cos(rang)*0.75-math.cos(rang2)*1.08
							TaskGoStraightToCoord(ped, pos2.x-addx, pos2.y-addy, pos2.z, 1.0, 3000, ang, 0.5)
							while GetScriptTaskStatus(ped, 0x7d8f4411) < 2 do Wait(0) end
							local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
							local anim = "machinic_loop_mechandplayer"
							RequestAnimDict(animDict)
							while not HasAnimDictLoaded(animDict) do Wait(100) end
							TaskPlayAnim(ped, animDict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
							RemoveAnimDict(animDict)
							-- SetEntityHeading(ped, GetEntityHeading(veh)-90.0)
							Wait(100)
							setTipText("לחץ/י <img src=\"images/P.png\" style=\"top: 10px;width: 15px;height: 15px;\"/> כדי להפסיק")
							SendNUIMessage({meta = "show"})
							SendNUIMessage({meta = "text", text = "פורץ את המנעול"})
							local atime = GetGameTimer()
							local btime = 0
							local ctime = 15000
							while dist < 3 and not IsDisabledControlJustPressed(0,199)  and IsVehicleSeatFree(veh, -1) and not IsPedInAnyVehicle(ped) and IsEntityPlayingAnim(ped, animDict, anim, 3) and btime < ctime do
								local tick = GetGameTimer()
								btime = tick-atime
								if btime > ctime then btime = ctime end
								SendNUIMessage({meta = "updatebar", bar = btime, maxbar = ctime})
								pos2 = GetWorldPositionOfEntityBone(veh, boneindex)
								dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z, true)
								Wait(0)
							end
							SendNUIMessage({meta = "hide"})
							StopAnimTask(ped, animDict, anim, 1.0)
							setTipText("")
							if btime == ctime and not IsPedInAnyVehicle(ped) then
								SetVehicleDoorsLocked(veh, 1)
								SetVehicleNeedsToBeHotwired(veh, false)
								SetVehicleAlarm(veh, true)
								SetVehicleEngineOn(veh, false, false, true)
								local nveh = NetworkGetNetworkIdFromEntity(veh)
								if not vehicles[nveh] then
									TriggerServerEvent("hotwire:event", "hotwirecheck", nveh)
									while (not vehicles[nveh] or not vehicles[nveh].hotwire) do Wait(100) end
								end
								TriggerEvent('notification', "You succeeded picking the lock", 1)
							else
								SetVehicleDoorsLocked(veh, 7)
								TriggerEvent('notification', "You failed to pick the lock", 2)
							end
						end
					end
				else
					if wtime ~= gtime then wtime = gtime end
				end
			-- else
				setTipText("")
				-- if wtime ~= gtime then wtime = gtime end
			-- end--]]
		local ret, veh = FindFirstVehicle()
		local success = true
		while success do
			if DoesEntityExist(veh) and not IsVehicleNeedsToBeHotwired(veh) then
				if not GetEntityScript(veh) then
					if IsVehicleSeatFree(veh, -1) then
						if GetVehicleDoorLockStatus(veh) == 2 then
							SetVehicleDoorsLocked(veh, 1)
						end
					end
				end
			end
			success, veh = FindNextVehicle(ret)
		end
		EndFindVehicle(ret)
	end
end)

RegisterCommand("engine", function()
	if IsPedInAnyVehicle(PlayerPedId()) then
		local havetodo = true
		local veh = GetVehiclePedIsUsing(PlayerPedId())
		if NetworkGetEntityIsNetworked(veh) then
			if IsThisModelACar(GetEntityModel(veh)) then
				local nveh = NetworkGetNetworkIdFromEntity(veh)
				if vehicles[nveh] and vehicles[nveh].hotwire ~= "hacked" then
					havetodo = false
				end
			end
		end
		if havetodo then
			local engine = GetIsVehicleEngineRunning(veh)
			SetVehicleEngineOn(veh, false, not engine, engine)
		end
    end
end, false)

AddEventHandler("hotwire:event", function(thef, args)
	if thef == "vehinfo" then -- קבלת כל המידע על כל הרכבים
		vehicles = args
	end
	if thef == "openveh" then -- קבלת תשובה לפתוח את הרכב
		if NetworkDoesNetworkIdExist(args) then -- מניעת באגים
			local veh = NetworkGetEntityFromNetworkId(args)
			SetVehicleDoorsLockedForPlayer(veh, PlayerId(), false)
		end
	end
	if thef == "lockpick" then
		--lockpick = args
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		print("check3")
		if IsVehicleInRadius(pos, 3.0) then
			print("check2")
			local veh, dist = GetClosestVehicle2(pos)
			print("check")
			print(veh)
			if veh ~= -1 and dist < 3 and dist ~= -1 and DoesEntityExist(veh) and NetworkGetEntityIsNetworked(veh) and IsThisModelACar(GetEntityModel(veh)) then
				print("checkit now")
				local boneindex = GetEntityBoneIndexByName(veh, "door_dside_f")
				local pos2 = GetWorldPositionOfEntityBone(veh, boneindex)
				local ang = (GetEntityHeading(veh)+270)%360
				local rang, rang2 = math.rad(ang), math.rad(ang-90)
				local addx, addy = -math.sin(rang)*0.75+math.sin(rang2)*1.08, math.cos(rang)*0.75-math.cos(rang2)*1.08
				TaskGoStraightToCoord(ped, pos2.x-addx, pos2.y-addy, pos2.z, 1.0, 3000, ang, 0.5)
				while GetScriptTaskStatus(ped, 0x7d8f4411) < 2 do Wait(0) end
				local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
				local anim = "machinic_loop_mechandplayer"
				RequestAnimDict(animDict)
				while not HasAnimDictLoaded(animDict) do Wait(100) end
				TaskPlayAnim(ped, animDict, anim, 8.0, -8.0, -1, 1, 0, false, false, false)
				RemoveAnimDict(animDict)
				-- SetEntityHeading(ped, GetEntityHeading(veh)-90.0)
				Wait(100)
				setTipText("לחץ/י <img src=\"images/P.png\" style=\"top: 10px;width: 15px;height: 15px;\"/> כדי להפסיק")
				SendNUIMessage({meta = "show"})
				SendNUIMessage({meta = "text", text = "פורץ את המנעול"})
				local atime = GetGameTimer()
				local btime = 0
				local ctime = 15000
				while dist < 3 and not IsDisabledControlJustPressed(0,199)  and IsVehicleSeatFree(veh, -1) and not IsPedInAnyVehicle(ped) and IsEntityPlayingAnim(ped, animDict, anim, 3) and btime < ctime do
					local tick = GetGameTimer()
					btime = tick-atime
					if btime > ctime then btime = ctime end
					SendNUIMessage({meta = "updatebar", bar = btime, maxbar = ctime})
					pos2 = GetWorldPositionOfEntityBone(veh, boneindex)
					dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z, true)
					Wait(0)
				end
				SendNUIMessage({meta = "hide"})
				StopAnimTask(ped, animDict, anim, 1.0)
				setTipText("")
				if btime == ctime and not IsPedInAnyVehicle(ped) then
					SetVehicleDoorsLocked(veh, 1)
					SetVehicleNeedsToBeHotwired(veh, false)
					SetVehicleAlarm(veh, true)
					SetVehicleEngineOn(veh, false, false, true)
					local nveh = NetworkGetNetworkIdFromEntity(veh)
					if not vehicles[nveh] then
						TriggerServerEvent("hotwire:event", "hotwirecheck", nveh)
						while (not vehicles[nveh] or not vehicles[nveh].hotwire) do Wait(100) end
					end
					TriggerEvent('notification', "You succeeded picking the lock", 1)
				else
					SetVehicleDoorsLocked(veh, 7)
					TriggerEvent('notification', "You failed to pick the lock", 2)
				end
			end
		end
	end
end)

function setTipText(text)
	if tiptext ~= text then
		SendNUIMessage({meta = "tiptext", text = text})
		tiptext = text
	end
end

function IsAnyPlayerInVehicle(veh)
	for i = -1, GetVehicleMaxNumberOfPassengers(veh)-1 do
		if not IsVehicleSeatFree(veh, i) then
			if IsPedAPlayer(GetPedInVehicleSeat(veh, i)) then return true end
		end
	end
	return false
end

function IsVehicleInRadius(pos, radius)
	local ret, veh = FindFirstVehicle()
	local success = true
	while success do
		if DoesEntityExist(veh) and IsVehicleNeedsToBeHotwired(veh) and NetworkGetEntityIsNetworked(veh) and IsThisModelACar(GetEntityModel(veh)) then
			local vehPos = GetEntityCoords(veh)
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehPos.x, vehPos.y, vehPos.z, true)
			if distance < radius then
				EndFindVehicle(ret)
				return true
			end
		end
		success, veh = FindNextVehicle(ret)
	end
	EndFindVehicle(ret)
	return false
end

function GetClosestVehicle2(pos)
	local ret, veh = FindFirstVehicle()
	local success = true
	local distance2 = -1
	local rveh = -1
	while success do
		if DoesEntityExist(veh) and IsVehicleNeedsToBeHotwired(veh) and NetworkGetEntityIsNetworked(veh) and IsThisModelACar(GetEntityModel(veh)) then
			local vehPos = GetEntityCoords(veh)
			local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, vehPos.x, vehPos.y, vehPos.z, true)
			if distance2 > distance or distance2 == -1 then
				rveh = veh
				distance2 = distance
			end
		end
		success, veh = FindNextVehicle(ret)
	end
	EndFindVehicle(ret)
	return rveh, distance2
end