objectspawner.ShowingMarker = false
objectspawner.SavedObjects = {}

function objectspawner:Awake(...)
    while not ESX do Citizen.Wait(0); end
    while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
    self.PlayerData = ESX.GetPlayerData()
    ESX.TriggerServerCallback('objectspawner:GetStartData', function(retTab) self:Start(retTab); end)
end

function objectspawner:Start(retTab)
  self.SavedObjects = retTab
  self:Update()
end

function objectspawner:Update(...)
  local timer = GetGameTimer()
  while true do
    Citizen.Wait(0)

    if self.ShowingMarker and not self.ControllingObject then
      local fwd,right,up,plyPos = GetEntityMatrix(GetPlayerPed(-1))
      local camPos = GetGameplayCamCoord()
      local offset = plyPos - camPos

      local pos = plyPos + (offset * self.Range) + (right * self.Range) + (up * self.Range)      
      local found,z = GetGroundZFor_3dCoord(pos.x,pos.y,pos.z + 2.0,z,false)
      if found and found >= 1 then if pos.z < z then pos = vector3(pos.x,pos.y,z); end; end

      DrawMarker(0, pos.x,pos.y,pos.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 0.5,0.5,0.5, 15,155,15,115, false,true,2,false,false,false,false)

      DisableControlAction(0,12,true)
      DisableControlAction(0,13,true)
      DisableControlAction(0,14,true)
      DisableControlAction(0,15,true)
      DisableControlAction(0,16,true)

      if IsDisabledControlJustPressed(0,self.Controls["INCREASE_RANGE"])  then self.Range = self.Range + self.RangeAdder; end
      if IsDisabledControlJustPressed(0,self.Controls["DECREASE_RANGE"])  then self.Range = self.Range - self.RangeAdder; end
      if IsControlJustPressed(0,self.Controls["GRAB_OBJECT"])     then self:MoveObject(); end
    elseif self.ControllingObject and self.CurrentObject then
      local offset = vector3(0.0,0.0,0.0)
      local dimsMin,dimsMax = GetModelDimensions(GetEntityModel(self.CurrentObject))
      if dimsMin and dimsMax then 
        if dimsMin.z > dimsMax.z then
          offset = vector3(0.0,0.0,dimsMin.z)
        else
          offset = vector3(0.0,0.0,dimsMax.z)
        end
      end
      local objPos = GetEntityCoords(self.CurrentObject)
      local pos = objPos + offset
      DrawMarker(0, pos.x,pos.y,pos.z, 0.0,0.0,0.0, 0.0,0.0,0.0, 0.5,0.5,0.5, 155,15,15,115, false,true,2,false,false,false,false)

      if IsControlJustPressed(0,self.Controls["GRAB_OBJECT"])   and not self.FurniSpawner   then self:MoveObject(); end
      if IsControlJustPressed(0,self.Controls["DROP_OBJECT"])   and not self.FurniSpawner   then self:DropObject(); end
      if IsControlJustPressed(0,self.Controls["SAVE_OBJECT"])                               then self:SaveObject(); end
    end

    if (GetGameTimer() - timer) > 1000 then
      timer = GetGameTimer()
      local plyPos = GetEntityCoords(GetPlayerPed(-1))
      for k,v in pairs(self.SavedObjects) do
        local dist = Utils.GetVecDist(plyPos,k)
        if (v.obj and dist > self.DespawnDist) or (v.obj and self.Instance and v.instance == "false") or (v.obj and not self.Instance and v.instance ~= "false") then
          DeleteObject(v.obj)
          self.SavedObjects[k].obj = nil
        elseif (not v.obj and dist < self.SpawnDist) and ((self.Instance and self.Instance == v.instance) or (not self.Instance and v.instance == "false")) then
          while not HasModelLoaded(v.model) do RequestModel(v.model); Citizen.Wait(0); end
          local newObj = CreateObject(v.model, v.pos.x,v.pos.y,v.pos.z + 200.0, false,false,false)
          Citizen.Wait(100)
          SetEntityCoordsNoOffset(newObj,v.pos.x,v.pos.y,v.pos.z,false,false,false)
          SetEntityRotation(newObj, v.rot.x,v.rot.y,v.rot.z, 2, true)
          Citizen.Wait(0)
          FreezeEntityPosition(newObj,true)
          SetEntityAsMissionEntity(newObj,true,true)
          self.SavedObjects[k].obj = newObj
          SetModelAsNoLongerNeeded(v.model)
          Citizen.Wait(100)
        end
      end
    end
  end
end

function objectspawner:SaveObject()
  if not self.CurrentObject then return; end
  SetEntityAsMissionEntity(self.CurrentObject,true,true)
  local pos = GetEntityCoords(self.CurrentObject)
  pos = vector3(math.round(pos.x,3.0),math.round(pos.y,3.0),math.round(pos.z,3.0))
  local rot = GetEntityRotation(self.CurrentObject,2)
  rot = vector3(math.round(rot.x,3.0),math.round(rot.y,3.0),math.round(rot.z,3.0))
  local model = GetEntityModel(self.CurrentObject)
  self.SavedObjects[pos] = {pos = pos, rot = rot, model = model, instance = (self.Instance or 'false')}
  self:MoveObject(true)
  TriggerServerEvent('objectspawner:SaveObject',self.SavedObjects[pos])
end

function objectspawner:DoSpawn(obj)
  if not self.ShowingMarker then ESX.ShowNotification("You need to use /build first."); return; end
  if not obj then return; end

  local hash = GetHashKey(obj)
  while not HasModelLoaded(hash) do RequestModel(hash); Citizen.Wait(0); end

  local fwd,right,up,plyPos = GetEntityMatrix(GetPlayerPed(-1))
  local camPos = GetGameplayCamCoord()
  local offset = plyPos - camPos

  local pos = plyPos + (offset * self.Range) + (right * self.Range) + (up * self.Range)
  local newObj = CreateObject(hash, pos.x,pos.y,pos.z, false,false,false)

  FreezeEntityPosition(newObj,true)
  SetEntityAsMissionEntity(newObj,true,true)

  SetModelAsNoLongerNeeded(hash)
  return newObj
end

function objectspawner:DropObject(...)
  if not self.ControllingObject or not self.CurrentObject then return; end
  ESX.ShowNotification("Dropped Object : "..self.CurrentObject)
  self.ControllingObject = false
  self.CurrentObject = false
  self.ObjectFrozen = false
end

function objectspawner:MoveObject(saved,furniture)
  if not self.ShowingMarker then return; end
  if self.ControllingObject then 
    local pos = GetEntityCoords(self.CurrentObject)
    if not self.SavedObjects[pos] then
      if not saved then
        ESX.ShowNotification("Delete Unsaved Object : "..self.CurrentObject)
      else
        ESX.ShowNotification("Saved Object : "..self.CurrentObject)
      end
    end
    SetEntityAsMissionEntity(self.CurrentObject,true,true)
    DeleteObject(self.CurrentObject)
    self:DoSavedDelete(self.CurrentObject)
    self.ControllingObject = false
    self.CurrentObject = false
    self.ObjectFrozen = false
    return
  end

  local fwd,right,up,plyPos = GetEntityMatrix(GetPlayerPed(-1))
  local camPos = GetGameplayCamCoord()
  local offset = plyPos - camPos

  local pos = plyPos + (offset * self.Range) + (right * self.Range)
  local obj = furniture or ESX.Game.GetClosestObject({},pos)

  FreezeEntityPosition(obj,false)
  SetEntityCollision(obj,false,false)

  self.ControllingObject = true
  self.ObjectFrozen = false
  self.CurrentObject = obj

  for k,v in pairs(self.SavedObjects) do
    if v.obj and self.CurrentObject == v.obj then
      ESX.ShowNotification("Delete Saved Object : "..self.CurrentObject)
      TriggerServerEvent('objectspawner:DeleteObject',v)
    end
  end

  if furniture then
    self.FurniSpawner = true
    ESX.ShowNotification("Press [~r~H~s~] to place and save the object.")
  end

  local instructions = CreateInstuctionScaleform("instructional_buttons",furniture)
  DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)

  Citizen.CreateThread(function(...)
    while self.ControllingObject do
      Citizen.Wait(0)

      DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)

      local fwd,right,up,pos = GetEntityMatrix(self.CurrentObject)
      local rot = GetEntityRotation(self.CurrentObject,2)

      local moveSpeed = self.MoveSpeed
      local rotSpeed  = self.RotSpeed

      if IsControlJustPressed(0,self.Controls["INCREASE_SPEED"]) or IsControlPressed(0,self.Controls["INCREASE_SPEED"]) then moveSpeed = moveSpeed * self.SpeedIncreaser; rotSpeed = rotSpeed * self.SpeedIncreaser; end
      if IsControlJustPressed(0,self.Controls["DECREASE_SPEED"]) or IsControlPressed(0,self.Controls["DECREASE_SPEED"]) then moveSpeed = moveSpeed * self.SpeedDecreaser; rotSpeed = rotSpeed * self.SpeedDecreaser; end
      
      if IsControlJustPressed(0,self.Controls["RIGHT"])   or IsControlPressed(0,self.Controls["RIGHT"])   then pos = pos + (right *moveSpeed); end
      if IsControlJustPressed(0,self.Controls["LEFT"])    or IsControlPressed(0,self.Controls["LEFT"])    then pos = pos - (right *moveSpeed); end
      if IsControlJustPressed(0,self.Controls["FORWARD"]) or IsControlPressed(0,self.Controls["FORWARD"]) then pos = pos + (fwd   *moveSpeed); end 
      if IsControlJustPressed(0,self.Controls["BACK"])    or IsControlPressed(0,self.Controls["BACK"])    then pos = pos - (fwd   *moveSpeed); end 
      if IsControlJustPressed(0,self.Controls["UP"])      or IsControlPressed(0,self.Controls["UP"])      then pos = pos + (up    *moveSpeed); end
      if IsControlJustPressed(0,self.Controls["DOWN"])    or IsControlPressed(0,self.Controls["DOWN"])    then pos = pos - (up    *moveSpeed); end 

      if IsControlJustPressed(0,self.Controls["ROTX+"])   or IsControlPressed(0,self.Controls["ROTX+"])   then rot = rot + vector3(rotSpeed,0.0,0.0); end
      if IsControlJustPressed(0,self.Controls["ROTX-"])   or IsControlPressed(0,self.Controls["ROTX-"])   then rot = rot - vector3(rotSpeed,0.0,0.0); end
      if IsControlJustPressed(0,self.Controls["ROTY+"])   or IsControlPressed(0,self.Controls["ROTY+"])   then rot = rot + vector3(0.0,rotSpeed,0.0); end 
      if IsControlJustPressed(0,self.Controls["ROTY-"])   or IsControlPressed(0,self.Controls["ROTY-"])   then rot = rot - vector3(0.0,rotSpeed,0.0); end 
      if IsControlJustPressed(0,self.Controls["ROTZ+"])   or IsControlPressed(0,self.Controls["ROTZ+"])   then rot = rot + vector3(0.0,0.0,rotSpeed); end
      if IsControlJustPressed(0,self.Controls["ROTZ-"])   or IsControlPressed(0,self.Controls["ROTZ-"])   then rot = rot - vector3(0.0,0.0,rotSpeed); end 

      SetEntityRotation(self.CurrentObject, rot.x,rot.y,rot.z, 2, true)
      SetEntityCoords(self.CurrentObject, pos.x,pos.y,pos.z)
    end

    FreezeEntityPosition(self.CurrentObject,true)
    Citizen.Wait(0)
    SetEntityCollision(self.CurrentObject,true,true)
    Citizen.Wait(0)

    self.ObjectFrozen = false
    self.CurrentObject = false

    if furniture then 
      self:ShowMarker()
      self.FurniSpawner = false
    end
  end)  
end

function objectspawner:SyncObject(obj)
  self.SavedObjects[obj.pos] = obj
end

function objectspawner:DeleteObject(pos)
  if self.SavedObjects[pos] then 
    if self.SavedObjects[pos].obj and (not self.CurrentObject or (self.CurrentObject and self.CurrentObject ~= self.SavedObjects[pos].obj)) then 
      DeleteObject(self.SavedObjects[pos].obj) 
    end
    self.SavedObjects[pos] = nil
  end
end

function objectspawner:DoSavedDelete(obj)
  for k,v in pairs(self.SavedObjects) do
    if v.obj and obj == v.obj then
      ESX.ShowNotification("Delete Saved Object : "..obj)
      TriggerServerEvent('objectspawner:DeleteObject',v)
    end
  end
end

function objectspawner:ShowMarker()
  self.ShowingMarker = not self.ShowingMarker
end

function objectspawner:TotalControl(model)
  self.Range = 2.0
  self:ShowMarker()
  local obj = self:DoSpawn(model)
  self:MoveObject(false,obj)
end

function objectspawner:EnterInstance(instance)
  ESX.TriggerServerCallback('objectspawner:GetInstanceOwner', function(identifier)
    if identifier then 
      self.Instance = identifier
    else 
      print("Couldnt find identifier.")
    end
  end, instance.host)
end

function objectspawner:LeaveInstance(instance)
  self.Instance = nil
end

function CreateInstuctionScaleform(scaleform,furni)
    local self = objectspawner
    local scaleform = RequestScaleformMovie(scaleform)
    while not HasScaleformMovieLoaded(scaleform) do
        Citizen.Wait(0)
    end
    PushScaleformMovieFunction(scaleform, "CLEAR_ALL")
    PopScaleformMovieFunctionVoid()
    
    PushScaleformMovieFunction(scaleform, "SET_CLEAR_SPACE")
    PushScaleformMovieFunctionParameterInt(200)
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(0)
    InstructionButton(GetControlInstructionalButton(1, self.Controls["UP"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["DOWN"], true))
    InstructionButtonMessage("Height")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(1)
    InstructionButton(GetControlInstructionalButton(1, self.Controls["RIGHT"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["FORWARD"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["BACK"], true))
    InstructionButtonMessage("Move")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(2)
    InstructionButton(GetControlInstructionalButton(1, self.Controls["ROTY+"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["ROTY-"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["ROTX+"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["ROTX-"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["ROTZ+"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["ROTZ-"], true))
    InstructionButtonMessage("Rotate")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(3)
    InstructionButton(GetControlInstructionalButton(1, self.Controls["INCREASE_RANGE"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["DECREASE_RANGE"], true))
    InstructionButtonMessage("Range")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(4)
    InstructionButton(GetControlInstructionalButton(1, self.Controls["INCREASE_SPEED"], true))
    InstructionButton(GetControlInstructionalButton(1, self.Controls["DECREASE_SPEED"], true))
    InstructionButtonMessage("Speed")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
    PushScaleformMovieFunctionParameterInt(5)
    InstructionButton(GetControlInstructionalButton(1, self.Controls["SAVE_OBJECT"], true))
    InstructionButtonMessage("Save")
    PopScaleformMovieFunctionVoid()

    if not furni then
      PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
      PushScaleformMovieFunctionParameterInt(6)
      InstructionButton(GetControlInstructionalButton(1, self.Controls["GRAB_OBJECT"], true))
      InstructionButtonMessage("Grab")
      PopScaleformMovieFunctionVoid()

      PushScaleformMovieFunction(scaleform, "SET_DATA_SLOT")
      PushScaleformMovieFunctionParameterInt(7)
      InstructionButton(GetControlInstructionalButton(1, self.Controls["DROP_OBJECT"], true))
      InstructionButtonMessage("Drop")
      PopScaleformMovieFunctionVoid()
    end

    PushScaleformMovieFunction(scaleform, "DRAW_INSTRUCTIONAL_BUTTONS")
    PopScaleformMovieFunctionVoid()

    PushScaleformMovieFunction(scaleform, "SET_BACKGROUND_COLOUR")
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(0)
    PushScaleformMovieFunctionParameterInt(80)
    PopScaleformMovieFunctionVoid()

    return scaleform
end

function InstructionButton(ControlButton)
    N_0xe83a3e3557a56640(ControlButton)
end

function InstructionButtonMessage(text)
    BeginTextCommandScaleformString("STRING")
    AddTextComponentScaleform(text)
    EndTextCommandScaleformString()
end

RegisterNetEvent('objectspawner:DoPlace')
AddEventHandler('objectspawner:DoPlace', function(...) objectspawner:TotalControl(...); end)

RegisterNetEvent('objectspawner:DoBuild')
AddEventHandler('objectspawner:DoBuild', function(...) objectspawner:ShowMarker(...); end)

RegisterNetEvent('objectspawner:DoSpawn')
AddEventHandler('objectspawner:DoSpawn', function(...) objectspawner:DoSpawn(...); end)

RegisterNetEvent('objectspawner:SyncObject')
AddEventHandler('objectspawner:SyncObject', function(...) objectspawner:SyncObject(...); end)

RegisterNetEvent('objectspawner:DeleteObject')
AddEventHandler('objectspawner:DeleteObject', function(...) objectspawner:DeleteObject(...); end)

RegisterNetEvent('instance:onEnter')
AddEventHandler('instance:onEnter', function(...) objectspawner:EnterInstance(...); end)

RegisterNetEvent('instance:onLeave')
AddEventHandler('instance:onLeave', function(...) objectspawner:LeaveInstance(...); end)

Citizen.CreateThread(function(...) objectspawner:Awake(...); end)