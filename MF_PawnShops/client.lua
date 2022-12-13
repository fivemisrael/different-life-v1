-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

local MFP = MF_PawnShop
local TSC = ESX.TriggerServerCallback
local TSE = TriggerServerEvent
local CT = Citizen.CreateThread

function MFP:Awake(...)
    while not ESX do Citizen.Wait(0); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
    self.PlayerData = ESX.GetPlayerData()
    TSC('MF_PawnShop:GetShopData', function(retVal,retTab) self.dS = true; self.cS = retVal; self:Start(retTab); end)
end

function MFP:Start(tab)
  self.ShopData = tab
  self:DoBlips()
  if self.dS and self.cS then self:Update(); end
end

function MFP:DoBlips(...)
  for k,v in pairs(self.ShopData) do
    local v = v.shopdata
    if v.blip then
      pos = v.loc      
      local blip = AddBlipForCoord(pos.x,pos.y,pos.z)
      SetBlipSprite               (blip, 207)
      SetBlipDisplay              (blip, 3)
      SetBlipScale                (blip, 0.8)
      SetBlipColour               (blip, 71)
      SetBlipAsShortRange         (blip, false)
      SetBlipHighDetail           (blip, true)
      BeginTextCommandSetBlipName ("STRING")
      AddTextComponentString      (v.title)
      EndTextCommandSetBlipName   (blip)
    end
  end
end

MFP.DrawTextDist = 10.0
MFP.InteractDist = 2.0
function MFP:Update(...)
  local closest,closestDist
  while self.dS and self.cS do    
    Citizen.Wait(0)
    tick = (tick or 0) + 1
    if tick % 10 == 1 then
      closest,closestDist = self:GetClosestShop()
    end

    if closestDist and closestDist < self.DrawTextDist then
      Utils.DrawText3D(closest.shopdata.loc, closest.shopdata.text)
      if closestDist < self.InteractDist and IsControlJustPressed(0,38) then
        self:AttemptInteract(closest)
      end
    end
  end
end

function MFP:AttemptInteract(closest)
  self.Interacting = true
  TSC('MF_PawnShop:TryUse',function(canUse)
    if canUse then
      self:OpenMenu(closest)
    else
      TriggerEvent('notification', 'Somebody else is already trading with the shopkeeper.', 2)
      self.Interacting = false
    end
  end,closest)
  while self.Interacting do Citizen.Wait(0); end
end

function MFP:OpenMenu(closest)
  local elements = {
   -- [1] = {label = 'Buy', val = 'Buy'},
    [1] = {label = 'Sell', val = 'Sell'},
  }
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Shop_Menu',{ title = closest.shopdata.title, align = 'right', elements = elements },
    function(data,menu) 
      menu.close()
      self:OpenSubMenu(closest,data.current.val)
    end,
    function(data,menu)
      menu.close()
      self.Interacting = false
      TSE('MF_PawnShop:StopUsing',closest)
    end
  )
end

function MFP:OpenSubMenu(closest,action)
  local elements = {}
  if action == "Buy" then
    for k,v in pairs(closest.shopdata.buy) do
      table.insert(elements,{label = '['..v.count..'] '..v.label..' [ $'..v.price..' ]',data = v})
    end
  else
    for k,v in pairs(closest.shopdata.sell) do
      table.insert(elements,{label = '['..v.count..'] '..v.label..' [ Max: '..v.max..' ] [ $'..v.price..' ]',data = v})
    end
  end
  ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'Action_Menu',{ title = action, align = 'right', elements = elements },
    function(data,menu)
      if action == 'Buy' and data.current.data.count > 0 then 
        menu.close()
        self:OpenDialogue(data.current.data,action,closest)
      elseif action == 'Buy' and data.current.data.count <= 0 then
        TriggerEvent('notification', "The shopkeeper doesn't have enough of this to sell.", 2)
      elseif action == 'Sell' and data.current.data.count < data.current.data.max then
        menu.close()
        self:OpenDialogue(data.current.data,action,closest)
      else
        TriggerEvent('notification', "The shopkeeper has too much of this to buy more.", 1)    
      end
    end,
    function(data,menu)
      menu.close()
      self:OpenMenu(closest)
    end
  )
end

function MFP:OpenDialogue(data,val,closest)
  if val == "Buy" then
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'How_Much', {title = "How much do you want to buy? [Max : "..data.count.."] [ $"..data.price.." ]"}, 
      function(data2, menu)
        local quantity = tonumber(data2.value)

        if quantity == nil or quantity < 1 then
          TriggerEvent('notification', "Invalid amount.", 2) 
        else
          TriggerServerEvent('MF_PawnShop:Buy',closest,data,quantity)
          menu.close()
          Citizen.Wait(100)
          TSE('MF_PawnShop:StopUsing',closest)
          self.Interacting = false
        end
      end, 
      function(data, menu)
        menu.close()
        self:OpenSubMenu(closest,action)
      end
    )
  elseif val == "Sell" then
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'How_Much', {title = "How much do you want to sell? [Max : "..data.max - data.count.."]"}, 
      function(data2, menu)
        local quantity = tonumber(data2.value)

        if quantity == nil or quantity < 1 then
          TriggerEvent('notification', "Invalid amount.", 2) 
        else
          TriggerServerEvent('MF_PawnShop:Sell',closest,data,quantity)
          menu.close()
          Citizen.Wait(100)
          TSE('MF_PawnShop:StopUsing',closest)
          self.Interacting = false
        end
      end, 
      function(data, menu)
        menu.close()
        self:OpenSubMenu(closest,action)
      end
    )
  end
end

function MFP:GetClosestShop(...)
  local plyPos = GetEntityCoords(GetPlayerPed(-1))
  local closest,closestDist
  for k,v in pairs(self.ShopData) do
    local pos = v.shopdata.loc
    local dist = Utils.GetVecDist(plyPos,self:ToVector(pos))
    if not closestDist or dist < closestDist then
      closest = v
      closestDist = dist
    end
  end
  if closestDist then return closest,closestDist else return false,999999; end
end

function MFP:ToVector(tab)
  if not tab.w or not tab.heading then
    return vector3(tab.x,tab.y,tab.z)
  else
    return vector3(tab.x,tab.y.tab.z,tab.w or tab.heading)
  end
end

function MFP.Notify(source,msg)
  local self = MFP
  if not source then return; end
  if not msg then msg = source; end
  ESX.ShowNotification(msg)
end

function MFP.DoSync(source,data)
  local self = MFP
  if not source then return; end
  if not data then data = source; end
  if type(data) == "table" then self.ShopData = data; end
end

CT(function(...) MFP:Awake(...); end)
NewEvent(true,MFP.Notify,'MF_PawnShop:NotifyClient')
NewEvent(true,MFP.DoSync,'MF_PawnShop:SyncData')