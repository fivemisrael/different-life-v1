DrugSales = {}
local DLR = DrugSales

DLR.Version = '1.0.13'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

-- For the door.
DLR.ShowBlip = false
DLR.DrawTextDist = 10.0
DLR.NotificationTime = 5.0
DLR.RefreshPosTimer = 60.0 -- minutes

DLR.PoliceNotifyCountdown = 0.5 -- minutes from reaching dealer until police are notified.
DLR.NotifyPoliceTimer = 10
DLR.PoliceJobName = "police"
DLR.MinPoliceOnline = 1

-- The door.
DLR.HintLocations     =   {
  [1] = vector4(2.82,-1215.09,26.89, 92.08),
}

DLR.SalesLocations    =   {
  [1] = vector4(-1541.21,-33.69,57.79,301.24),
  [2] = vector4(-1078.59,-1677.64,4.58,291.29),
  [3] = vector4(1152.78,-1650.52,36.51,206.53),
  [4] = vector4(-449.53,-51.82,44.52,45.62),
}

DLR.TargetAverageSpeed = 60.0

DLR.DealerPed = 's_m_y_dealer_01'

DLR.DrugItems = {
  ['Meth'] = 'meth1g',
  ['Cocaine'] = 'coke1g',
  ['Joint'] = 'joint2g',
}

DLR.DrugPrices = {
  ['meth1g'] = 100,
  ['coke1g'] = 85,
  ['joint2g'] = 35,
}

DLR.MaxPriceVariance = 10.0 --%