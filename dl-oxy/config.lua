-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

MF_MobileMeth = {}
local MFM = MF_MobileMeth
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

MFM.Version = '1.0.11'

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

-- For the door.
MFM.ShowBlip = false

-- Police count and name
MFM.PoliceJobName = "police"
MFM.MinPolCount   = 1

-- Minutes.
MFM.CookTimerA = 0.5 -- prepare ingredients
MFM.CookTimerB = 0.5 -- Oxy Prepare
MFM.CookTimerC = 0.5 -- Oxy Prepare
MFM.CookTimerD = 0.5 -- Oxy Prepare

-- The door.
MFM.HintLocation      =   vector4(278.77,-1997.91,20.23, 141.78)

-- Possible spawns.
MFM.TruckLocations    =   {
  [1] = vector4(1060.25,-2409.26,29.96,82.70),
}

-- Possible dropoffs.
MFM.DropoffLocations  =   {
  [1] = vector3(1372.69,3617.62,34.89),
}

-- Models.
MFM.TruckModels = {
  [1] = 'boxville',
  [2] = 'boxville2',
  [3] = 'boxville3',
  [4] = 'boxville4',
}

-- Draw text at this distance.
MFM.DrawTextDist          =   5.0

-- How long the note hangs around for (when knocking on door).
MFM.NotificationTime      =   10

-- How long police have to track a notification (seconds).
MFM.TrackableNotifyTimer  =   15

-- Spawn truck at x meters.
MFM.TruckSpawnDist        =   50.0

-- Veh speed (KPH I think?).
MFM.MinSpeedForCook       =   10.0

-- Vehicle can stop for x amount of seconds before police get notified.
MFM.MaxVehicleStopTime    =   30
