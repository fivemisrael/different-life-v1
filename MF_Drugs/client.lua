local DLR = DrugSales

function DLR:Awake(...)
    while not ESX do Citizen.Wait(0); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
    self.PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('DrugSales:GetStartData', function(hintLoc) self.HintLocation = hintLoc; self:Start(); end)
end

function DLR:Start(...)
  if self.ShowBlip then self:DoBlips(); end
  self:Update()
end

function DLR:DoBlips()
  if self.Blip then RemoveBlip(self.Blip); end
  local blip = AddBlipForCoord(self.HintLocation.x, self.HintLocation.y, self.HintLocation.z)
  SetBlipSprite               (blip, 514)
  SetBlipDisplay              (blip, 3)
  SetBlipScale                (blip, 0.8)
  SetBlipColour               (blip, 1)
  SetBlipAsShortRange         (blip, false)
  SetBlipHighDetail           (blip, true)
  BeginTextCommandSetBlipName ("STRING")
  AddTextComponentString      ("Shady Deal")
  EndTextCommandSetBlipName   (blip)
  self.Blip = blip
end

function DLR:Update(...)
  local noteTemplate = Utils.DrawTextTemplate()
  noteTemplate.x = 0.5
  noteTemplate.y = 0.5
  local timer = 0
  while true do
    Citizen.Wait(0)
    local plyPed = GetPlayerPed(-1)
    local plyPos = GetEntityCoords(plyPed)
    if not self.MissionStarted then
      local dist = Utils.GetVecDist(plyPos, self.HintLocation)
      if dist < self.DrawTextDist then
        local p = self.HintLocation
        Utils.DrawText3D(p.x,p.y,p.z, "Press [~r~E~s~] to knock on the door.")
        if IsControlJustPressed(0, Keys["E"]) and GetGameTimer() - timer > 150 then    
          ESX.TriggerServerCallback('DrugSales:GetCops',function(count)
            if count and count >= self.MinPoliceOnline then
              timer = GetGameTimer()
              TaskGoStraightToCoord(plyPed, p.x, p.y, p.z, 10.0, 10, p.w, 0.5)
              Wait(3000)
              ClearPedTasksImmediately(plyPed)

              while not HasAnimDictLoaded("timetable@jimmy@doorknock@") do RequestAnimDict("timetable@jimmy@doorknock@"); Citizen.Wait(0); end
              TaskPlayAnim( plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 8.0, -1, 4, 0, 0, 0, 0 )     
              Citizen.Wait(0)
              while IsEntityPlayingAnim(plyPed, "timetable@jimmy@doorknock@", "knockdoor_idle", 3) do Citizen.Wait(0); end          

              Citizen.Wait(1000)

              TriggerEvent('chat:addMessage', {color = { 255, 0, 0}, multiline = true, args = {"Me", "You notice a small piece of paper slide under the door."}})
              ClearPedTasksImmediately(plyPed)

              local randNum = math.random(1,#self.SalesLocations)
              local spawnLoc = self.SalesLocations[randNum]
              local nearStreet = GetStreetNameFromHashKey(GetStreetNameAtCoord(spawnLoc.x,spawnLoc.y,spawnLoc.z))
              noteTemplate.text = "Find the buyer near "..nearStreet..".\nDon't be late."

              self.MissionStarted = spawnLoc

              SetNewWaypoint(spawnLoc.x,spawnLoc.y)

              local timer = GetGameTimer()
              while (GetGameTimer() - timer) < (self.NotificationTime * 1000) do
                Citizen.Wait(0)
                DrawSprite("commonmenu","", 0.5,0.53, 0.2,0.1,0.0, 125,125,125,200)
                Utils.DrawText(noteTemplate)
              end
              self:MissionStart()
            else
              ESX.ShowNotification("There aren't enough police online.")
            end
          end)
        end
      end
    end
  end
end

function DLR:MissionStart()
  local plyPed = GetPlayerPed(-1)
  local pPos = GetEntityCoords(plyPed)
  local tPos = self.MissionStarted
  local distToDropoff = CalculateTravelDistanceBetweenPoints(tPos.x,tPos.y,tPos.z, pPos.x,pPos.y,pPos.z)
  while not distToDropoff or (distToDropoff >= 10000 or distToDropoff <= 1000) do distToDropoff = CalculateTravelDistanceBetweenPoints(tPos.x,tPos.y,tPos.z, pPos.x,pPos.y,pPos.z); pPos = GetEntityCoords(GetPlayerPed(-1)); Citizen.Wait(10); end
  local textTemplate = Utils.DrawTextTemplate()
  local prices = {}
  for k,v in pairs(self.DrugItems) do 
    prices[v] = math.floor(self.DrugPrices[v]*(math.random(100.0-self.MaxPriceVariance,100.0+self.MaxPriceVariance)/100.0))
  end
  textTemplate.x = 0.8
  textTemplate.y = 0.8
  local startTime = GetGameTimer()
  local startDist = distToDropoff
  local timer = ((startDist / 1000) * 60) * 1000
  while ((GetGameTimer() - startTime) < math.floor(timer) and not self.MissionCompleted) or (self.MissionCompleted and distToDropoff < (self.DrawTextDist*2.0)) do
    Citizen.Wait(0)   
    plyPed = GetPlayerPed(-1)
    pPos = GetEntityCoords(plyPed)
    distToDropoff = Utils.GetVecDist(tPos,pPos)
    if not self.MissionCompleted then
      textTemplate.text = 'Time Remaining : '..math.floor((((startDist / 1000) * 60) * 1000 - (GetGameTimer() - startTime))/1000)..' seconds.'
      Utils.DrawText(textTemplate)
    end
    if distToDropoff < 50.0 then
      if not self.PedSpawned then
        local hash = GetHashKey(self.DealerPed)
        while not HasModelLoaded(hash) do RequestModel(hash); Citizen.Wait(0); end
        self.PedSpawned = CreatePed(4, hash, tPos.x,tPos.y,tPos.z,tPos.w, true,true)
        SetEntityAsMissionEntity(self.PedSpawned,true,true)
        SetModelAsNoLongerNeeded(hash)
      end
      if distToDropoff < self.DrawTextDist then
        if not self.MissionCompleted then 
          startTime = 0
          self.MissionCompleted = true
          ESX.ShowNotification("You found the buyer!")
        end
        Utils.DrawText3D(tPos.x,tPos.y,tPos.z, "Press [~r~E~s~] to speak to the dealer.")
        if IsControlJustPressed(0,38) then
          self:PoliceNotifyTimer(tPos)
          ESX.TriggerServerCallback('DrugSales:GetDrugCount', function(counts)
            ESX.UI.Menu.CloseAll()
            local elements = {}
            for k,v in pairs(self.DrugItems) do 
              drugPrice = prices[v]
              table.insert(elements, {label = k..' : $'..drugPrice, val = v, price = drugPrice})
            end
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Drug_Dealer',{ title = "Drug Buyer", align = 'left', elements = elements },
              function(data,menu) 
                local count = false 
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'How_Much', {title = "How much do you want to sell? [Max : "..counts[data.current.val].."]"}, 
                  function(data2, menu2)
                    local quantity = tonumber(data2.value)

                    if quantity == nil then
                      ESX.ShowNotification("Invalid amount.")
                    else
                      count = quantity
                      menu2.close()
                    end
                  end, 
                  function(data2, menu2)
                    menu2.close()
                  end
                )
                while not count do Citizen.Wait(0); end
                if tonumber(count) > tonumber(counts[data.current.val]) then 
                  ESX.ShowNotification("You don't have that much "..data.current.val..".")
                else 
                  ESX.ShowNotification("You sold "..tonumber(count).." "..data.current.val.." for $"..tonumber(count)*tonumber(data.current.price)..".")
                  TriggerServerEvent('DrugSales:Sold',data.current.val,data.current.price,count)
                  menu.close()
                  Citizen.Wait(1500)
                end
              end,
              function(data,menu)
                menu.close()
              end
            )
          end)
        end
      end
    end
  end

  if not self.MissionCompleted then
    ESX.ShowNotification("You ran out of time and the buyer left.")
    if self.PedSpawned then 
      DeletePed(self.PedSpawned)
    end
    self.MissionCompleted = false 
    self.MissionStarted = false
    self.PedSpawned = false
  else
    ESX.ShowNotification("The dealer has left the spot.")
    if self.PedSpawned then 
      DeletePed(self.PedSpawned)
    end
    self.MissionCompleted = false 
    self.MissionStarted = false
    self.PedSpawned = false
  end
end

function DLR:PoliceNotifyTimer(pos)
  Citizen.CreateThread(function(...)
    Citizen.Wait(self.PoliceNotifyCountdown * 60 * 1000)
    TriggerServerEvent('DrugSales:NotifyPolice',pos)
    local nearStreet = GetStreetNameFromHashKey(GetStreetNameAtCoord(pos.x,pos.y,pos.z))
    ESX.ShowNotification("Police have been alerted of a drug deal nearby "..nearStreet..".")
  end)
end

function DLR:DoNotifyPolice(pos)
  Citizen.CreateThread(function(...)
    local timer = GetGameTimer()
    local street = GetStreetNameAtCoord(pos.x,pos.y,pos.z)
    if street then
      local nearStreet = GetStreetNameFromHashKey(street)
      ESX.ShowNotification("Somebody reported suspicious activity at "..nearStreet..". [~g~LEFTALT~s~]")
    else
      ESX.ShowNotification("Somebody reported suspicious activity. [~g~LEFTALT~s~]")
    end
    local blip = AddBlipForRadius(pos.x,pos.y,pos.z, 100.0)
    SetBlipHighDetail(blip, true)
    SetBlipColour(blip, 1)
    SetBlipAlpha (blip, 128)
    while GetGameTimer() - timer < self.NotifyPoliceTimer * 1000 do
      if IsControlJustPressed(0, 19) then SetNewWaypoint(pos.x,pos.y); end
      Citizen.Wait(0)
    end
    RemoveBlip(blip)
  end)
end

function DLR:SetJob(job)
  local lastJob = self.PlayerData.job
  if lastJob.name == self.PoliceJobName and job.name ~= self.PoliceJobName then
    TriggerServerEvent('DrugSales:RemoveCop')
    self.PlayerData.job = job
  elseif lastJob.name ~= self.PoliceJobName and job.name == self.PoliceJobName then
    TriggerServerEvent('DrugSales:SetCop')
    self.PlayerData.job = job
  end
end

RegisterNetEvent('DrugSales:DoNotify')
AddEventHandler('DrugSales:DoNotify', function(pos) DLR:DoNotifyPolice(pos); end)

RegisterNetEvent('DrugSales:SetHint')
AddEventHandler('DrugSales:SetHint', function(hint)
  DLR.HintLocation = hint;
  if DLR.ShowBlip then DLR:DoBlips(); end
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job) DLR:SetJob(job); end)

Citizen.CreateThread(function(...) DLR:Awake(...); end)