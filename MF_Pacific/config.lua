pacificstandard = {}

pacificstandard.Version = '1.0.13'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

pacificstandard.CooldownTimer = 240 -- minutes
pacificstandard.BankLocation = vector3(246.78,218.70,106.30)
pacificstandard.LoadDist = 50.0
pacificstandard.InteractDist = 2.0
pacificstandard.AudioBankName = "MF_Pacific"
pacificstandard.InteractTimer = 10 -- seconds
pacificstandard.MinPoliceCount = 6
pacificstandard.PoliceJobName = "police"

pacificstandard.Actions = {
  ["LockpickA"]  = vector3(256.79,220.01,106.50),
  ["Hack"]       = vector3(261.97,223.16,106.50),
  ["Identify"]   = vector3(253.21,228.43,101.80),
  ["LockpickB"]  = vector3(252.47,221.02,101.80),
  ["LockpickC"]  = vector3(261.12,215.22,101.80),
  ["Safe"]       = vector3(263.84,207.93,110.29),

  ["LootA"]      = vector3(259.63,218.06,102.10),
  ["LootB"]      = vector3(258.32,214.19,102.10),

  ["LootC"]      = vector3(262.32,212.65,102.10),
  ["LootD"]      = vector3(264.17,211.98,102.10),

  ["LootE"]      = vector3(265.75,212.79,102.10),
  ["LootF"]      = vector3(266.36,214.27,102.10),

  ["LootG"]      = vector3(265.77,215.83,102.10),
  ["LootH"]      = vector3(263.92,216.48,102.10),

  ["LootCash"]   = vector3(264.24,213.72,102.50),

}

pacificstandard.ActionText = {
  ["LockpickA"] = "Press [ ~r~E~s~ ] to lockpick the door.",
  ["LockpickB"] = "Press [ ~r~E~s~ ] to lockpick the door.",
  ["LockpickC"] = "Press [ ~r~E~s~ ] to lockpick the door.",
  ["Hack"] = "Press [ ~r~E~s~ ] to hack the security panel.",
  ["Identify"] = "Press [ ~r~E~s~ ] to attempt to gain access.",
  ["Safe"] = "Press [ ~r~E~s~ ] to attempt to crack the safe.",
  ["LootA"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootB"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootC"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootD"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootE"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootF"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootG"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootH"] = "Press [ ~r~E~s~ ] to cut open the lock.",
  ["LootCash"] = "Press [ ~r~E~s~ ] to loot the cash.",
}

pacificstandard.SafeRewards = { 
  CashAmount    = math.random(500,1000),
  ItemsAmount   = 1, -- math.random(0,itemsamount) = reward
  Items = { 'pacificidcard' }, -- ^ for all
}

pacificstandard.LootTable = {
  ["LootA"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootB"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootC"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootD"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootE"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootF"] = {
    ["rolex"] = 3,
    ["gold"] = 3,
    ["diamond"] = 3,
    ["money"] = 5000,
  },
  
  ["LootG"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootH"] = {
    ["rolex"] = 6,
    ["gold"] = 6,
    ["diamond"] = 6,
    ["money"] = 5000,
  },

  ["LootCash"] = {
    ["money"] = 50000,
  }
}