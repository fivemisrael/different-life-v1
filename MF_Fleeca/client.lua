function fleeca:Start(...)
  while not ESX do Citizen.Wait(0); end
  while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
  self.PlayerData = ESX.GetPlayerData()
  ESX.TriggerServerCallback('fleeca:GetBankData', function(usedActions,cops) 
    self.PoliceOnline = cops or 0
    self.UsedActions = usedActions    
    self:Update()
  end)
end

function fleeca:Update()
  local tick = 0
  local lastPolCheck = GetGameTimer()
  while true do
    local waitTime = 0

    tick = tick + 1
    local plyPed = GetPlayerPed(-1)
    local plyPos = GetEntityCoords(plyPed)
    local closestKey,closestVal,closestDist = self:GetClosestBank(plyPos)
    if closestDist < self.LoadDist then
      if self.PoliceOnline and self.PoliceOnline >= self.MinPoliceOnline then
        if not self.CurBank or self.CurBank.key ~= closestKey then
          self.CurBank = { key = closestKey, val = closestVal }
          ESX.TriggerServerCallback('fleeca:GetPolCount', function(count) self.PoliceOnline = count; end)
        end

        local actKey,actVal,actDist = self:GetClosestAction(plyPos,closestKey)
        if actDist < self.ActionDist then
          if not self.CurAction or self.CurAction.key ~= actKey then
            if actVal ~= "LootVault" or (actVal == "LootVault" and self.SafeOpen) then
              self.CurAction = { key = actKey, val = actVal }
              self.CurText = "Press [ ~r~E~s~ ] to " .. self.TextAddons[actVal]
            end
          end

          if not self.UsedActions[actKey] and not self.Interacting then
            Utils:DrawText3D(actKey.x, actKey.y, actKey.z, self.CurText)
            if Utils:GetKeyPressed(self.InteractKey) then
              self:Interact(self.CurAction)
            end
          end
        end
      else
        waitTime = 1000
      end
    else
      self.CurBank = false
      self.SafeOpen = false
      waitTime = 1000
    end

    if self.MovedDoors then
      for k,v in pairs(self.MovedDoors) do
        local plyPos = GetEntityCoords(GetPlayerPed(-1))
        local dist = Utils:GetVecDist(plyPos, GetEntityCoords(v))
        if dist > 50.0 then
          DeleteObject(v)
          table.remove(self.MovedDoors, k)
        end
      end
    end

    Citizen.Wait(waitTime)
  end
end

function fleeca:GetClosestBank(plyPos)
  local closestKey,closestVal,closestDist
  for k,v in pairs(self.Banks) do
    local dist = Utils:GetVecDist(plyPos, v)
    if not closestDist or dist < closestDist then
      closestKey = k
      closestVal = v
      closestDist = dist
    end
  end
  if not closestDist then return false,false,999999
  else return closestKey,closestVal,closestDist
  end
end

function fleeca:GetClosestAction(plyPos,key)
  local closestKey,closestVal,closestDist
  for k,v in pairs(self.Actions[key]) do
    local dist = Utils:GetVecDist(plyPos, k)
    if not closestDist or dist < closestDist then
      closestKey = k
      closestVal = v
      closestDist = dist
    end
  end
  if not closestDist then return false,false,999999
  else return closestKey,closestVal,closestDist
  end
end

function fleeca:Interact(closest)
  if self.Interacting then return; end
  self.Interacting = closest
  if closest.val == "LockpickDoor" then
   ESX.TriggerServerCallback('fleeca:GetLockpickCount', function(count)
      if count and count > 0 then
        TriggerServerEvent('fleeca:NotifyPolice', closest)
        TriggerEvent('lockpicking:StartMinigame')
      else
        TriggerEvent('notification', 'You dont have any lockpicks.', 2)
        self.Interacting = false
      end
    end)
  elseif closest.val == "LootID" then
    self:LootHandler(closest,true)
  elseif closest.val == "OpenVault" then
    TriggerServerEvent('fleeca:NotifyPolice', closest)
    self:HandleVaultDoor(closest)
  elseif closest.val == "LootVault" then
    ESX.TriggerServerCallback('fleeca:GetOxyCount', function(count)
      if count and count > 0 then
        self:LootHandler(closest,false)
      else
        TriggerEvent('notification', "You need a plasma torch to cut this open.", 2)
        self.Interacting = false
      end
    end)
  end
end

function fleeca:LootHandler(closest,idcard)
  ESX.TriggerServerCallback('fleeca:TryLoot',function(isLooted)
    if not isLooted then
      local plyPed = GetPlayerPed(-1)

      TaskTurnPedToFaceCoord(plyPed, closest.key.x, closest.key.y, closest.key.z, -1)
      Wait(2000)

      FreezeEntityPosition(plyPed,true)
      if idcard then
        exports['progressBars']:startUI(self.InteractTimer * 1000, "Searching", 1000)
        TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
      else
        exports['progressBars']:startUI(self.InteractTimer * 1000, "Cutting", 1000)
        TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_WELDING", 0, true)
      end
      Wait(self.InteractTimer * 1000)

      if idcard then
        TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, false)
        Wait(1500)
      end

      self.UsedActions[closest.key] = true
      TriggerServerEvent('fleeca:SyncBankData', closest.key, true)
      TriggerServerEvent('fleeca:RewardPlayer', closest.key,idcard)

      ClearPedTasksImmediately(plyPed)
      FreezeEntityPosition(plyPed,false)
      self.Interacting = false

      Wait(100)
      local obj = ESX.Game.GetClosestObject({},GetEntityCoords(plyPed))
      if GetEntityModel(obj)% 0x100000000 == 3284676632 then
        SetEntityAsMissionEntity(obj,false)
        DeleteObject(obj)
      end
    else
      TriggerEvent('notification', "Somebody else is looting this already.", 2)
      self.Interacting = false
    end
  end,closest)
end

function fleeca:LockpickComplete(result)
  local plyPed = GetPlayerPed(-1)
  FreezeEntityPosition(plyPed,false)
  if result then
    local closest,closestDist
    local allObjs = ESX.Game.GetObjects()
    for k,v in pairs(allObjs) do
      local modelHash = GetEntityModel(v)
      local revHash = modelHash % 0x100000000
      if self.DoorHashes[modelHash] or self.DoorHashes[modelHash] then
        local dist = Utils:GetVecDist(self.Interacting.key,GetEntityCoords(v))
        if not closestDist or dist < closestDist then
          closest = v
          closestDist = dist
        end
      end
    end

    if not closest or closestDist > self.LoadDist then 
      self.Interacting = false
      return 
    end

    local players = ESX.Game.GetPlayersInArea(self.Interacting.key,self.LoadDist)   
    for k,v in pairs(players) do
      local newV = GetPlayerServerId(v)
      TriggerServerEvent('fleeca:SyncDoor', newV, self.Interacting.key)
    end

    TriggerServerEvent('fleeca:SyncBankData', self.Interacting.key, true)
    timer = GetGameTimer()
    Citizen.CreateThread(function()
      while (GetGameTimer() - timer) < 500 do
        Citizen.Wait(0)
        DisableControlAction(0,18,true) -- disable attack
        DisableControlAction(0,24,true) -- disable attack
        DisableControlAction(0,25,true) -- disable aim
        DisableControlAction(0,47,true) -- disable weapon
        DisableControlAction(0,58,true) -- disable weapon
        DisableControlAction(0,69,true) -- disable weapon
        DisableControlAction(0,92,true) -- disable weapon
        DisableControlAction(0,106,true) -- disable weapon
        DisableControlAction(0,122,true) -- disable weapon
        DisableControlAction(0,135,true) -- disable weapon
        DisableControlAction(0,142,true) -- disable weapon
        DisableControlAction(0,144,true) -- disable weapon
        DisableControlAction(0,176,true) -- disable weapon
        DisableControlAction(0,223,true) -- disable melee
        DisableControlAction(0,229,true) -- disable melee
        DisableControlAction(0,237,true) -- disable melee
        DisableControlAction(0,257,true) -- disable melee
        DisableControlAction(0,263,true) -- disable melee
        DisableControlAction(0,264,true) -- disable melee
        DisableControlAction(0,257,true) -- disable melee
        DisableControlAction(0,140,true) -- disable melee
        DisableControlAction(0,141,true) -- disable melee
        DisableControlAction(0,142,true) -- disable melee
        DisableControlAction(0,143,true) -- disable melee
        DisableControlAction(0,329,true) -- disable melee
        DisableControlAction(0,347,true) -- disable melee
      end
    end)
    Citizen.Wait(200)
    self.Interacting = false
  else
    self.Interacting = false
  end
end

function fleeca:HandleVaultDoor(closest)
  ESX.TriggerServerCallback('fleeca:GetIDCount', function(count)
    if count and count > 0 then
      local plyPed = GetPlayerPed(-1)

      TaskTurnPedToFaceCoord(plyPed, closest.key.x, closest.key.y, closest.key.z, -1)
      Wait(2000)

      FreezeEntityPosition(plyPed,true)
      exports['progressBars']:startUI(self.InteractTimer * 1000, "Requesting Access", 1000)
      TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_ATM", 0, true)
      Wait(self.InteractTimer * 1000)

      TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_ATM", 0, false)
      Wait(1500)

      self.UsedActions[closest.key] = true
      TriggerServerEvent('fleeca:SyncBankData', closest.key, true)

      ClearPedTasksImmediately(plyPed)
      FreezeEntityPosition(plyPed,false)
      Wait(100)

      fleeca:LockpickComplete(true)
      self.SafeOpen = true
    else
      TriggerEvent('notification', "You do not have a bank ID Card", 2)
      self.Interacting = false
    end
  end)
end

function fleeca:NotifyPolice(data)
  ESX.ShowNotification('Somebody is robbing fleeca bank!')
  Citizen.CreateThread(function(...)
    local blipA = AddBlipForRadius(data.key.x, data.key.y, data.key.z, 50.0)
    SetBlipHighDetail(blipA, true)
    SetBlipColour(blipA, 1)
    SetBlipAlpha (blipA, 128)

    local blipB = AddBlipForCoord(data.key.x, data.key.y, data.key.z)
    SetBlipSprite               (blipB, 458)
    SetBlipDisplay              (blipB, 4)
    SetBlipScale                (blipB, 1.0)
    SetBlipColour               (blipB, 1)
    SetBlipAsShortRange         (blipB, true)
    SetBlipHighDetail           (blipB, true)
    BeginTextCommandSetBlipName ("STRING")
    AddTextComponentString      ("Robbery In Progress")
    EndTextCommandSetBlipName   (blipB)

    local timer = GetGameTimer()
    while GetGameTimer() - timer < 30000 do
      Citizen.Wait(0)
    end

    RemoveBlip(blipA)
    RemoveBlip(blipB)
  end)
end

function fleeca:SyncDoor(location)
  if not location then return; end
  Citizen.CreateThread(function(...)
    local isaVault = false
    self.MovedDoors = self.MovedDoors or {}
    local closest,closestDist
    local allObjs = ESX.Game.GetObjects()
    for k,v in pairs(allObjs) do
      local modelHash = GetEntityModel(v)
      local revHash = modelHash % 0x100000000
      if self.DoorHashes[modelHash] or self.DoorHashes[revHash] then
        local dist = Utils:GetVecDist(location,GetEntityCoords(v))
        if not closestDist or dist < closestDist then
          if modelHash == 2121050683 or revHash == 2121050683 then isaVault = true; else isaVault = false; end
          closest = v
          closestDist = dist
        end
      end
    end
    
    if not closest or closestDist > self.LoadDist then 
      self.Interacting = false
      return 
    end

    SetEntityAsMissionEntity(closest,false)
    local heading = GetEntityHeading(closest)
    local tick = 0
    while ((heading - 100.0) < GetEntityHeading(closest)) and tick < 350 do
      Citizen.Wait(0)
      tick = tick + 1
      local heading = GetEntityHeading(closest)
      SetEntityHeading(closest, heading - 0.3)
    end
    if isaVault then self.SafeOpen = true; end
    table.insert(self.MovedDoors, closest)
  end)
end

function fleeca.SetJob(source,job)
  local self = fleeca
  local lastData = self.PlayerData
  if lastData.job.name == self.PoliceJobName then
    TriggerServerEvent('fleeca:CopLeft')
  elseif lastData.job.name ~= self.PoliceJobName and job.name == self.PoliceJobName then
    TriggerServerEvent('fleeca:CopEnter')
  end
  self.PlayerData = ESX.GetPlayerData()
end

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) fleeca.SetJob(source,job); end)

RegisterNetEvent('fleeca:SyncDoor')
AddEventHandler('fleeca:SyncDoor', function(location) fleeca:SyncDoor(location); end)

RegisterNetEvent('fleeca:NotifyPolice')
AddEventHandler('fleeca:NotifyPolice', function(data) fleeca:NotifyPolice(data); end)

RegisterNetEvent('fleeca:SyncBankData')
AddEventHandler('fleeca:SyncBankData', function(data) fleeca.UsedActions = data; end)

RegisterNetEvent('fleeca:SyncCops')
AddEventHandler('fleeca:SyncCops', function(count) fleeca.PoliceOnline = count; end)

RegisterNetEvent('lockpicking:MinigameComplete')
AddEventHandler('lockpicking:MinigameComplete', function(result) fleeca:LockpickComplete(result); end)

Citizen.CreateThread(function(...) fleeca:Start(...); end)