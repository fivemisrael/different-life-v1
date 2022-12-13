objectspawner = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

objectspawner.Version = '1.0.11'

Citizen.CreateThread(function(...)
  while not ESX do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end) Citizen.Wait(0); end
end)

objectspawner.Controls = {
  ["UP"]              = 314,  -- NUMPAD +
  ["DOWN"]            = 315,  -- NUMPAD -
  ["LEFT"]            = 108,  -- NUMPAD 4
  ["RIGHT"]           = 107,  -- NUMPAD 6
  ["FORWARD"]         = 111,  -- NUMPAD 8
  ["BACK"]            = 110,  -- NUMPAD 5

  ["ROTY+"]           = 189,  -- ARROW LEFT
  ["ROTY-"]           = 190,  -- ARROW RIGHT
  ["ROTX+"]           = 188,  -- ARROW UP
  ["ROTX-"]           = 187,  -- ARROW DOWN
  ["ROTZ+"]           = 117,  -- NUMPAD 7
  ["ROTZ-"]           = 118,  -- NUMPAD 9

  ["INCREASE_SPEED"]  = 209,  -- LEFT SHIFT
  ["DECREASE_SPEED"]  = 20,   -- Z

  ["INCREASE_RANGE"]  = 15,   -- SCROLL UP
  ["DECREASE_RANGE"]  = 14,   -- SCROLL DOWN

  ["GRAB_OBJECT"]     = 47,   -- G
  ["SAVE_OBJECT"]     = 74,   -- H
  ["DROP_OBJECT"]     = 29,   -- B
}

objectspawner.MoveSpeed       = 0.05 -- base obj move speed
objectspawner.RotSpeed        = 0.50 -- base rot speed

objectspawner.SpeedIncreaser  = 5.0 -- when pressing INCREASE_SPEED
objectspawner.SpeedDecreaser  = 0.1 -- when pressing DECREASE_SPEED

objectspawner.Range           = 0.5
objectspawner.RangeAdder      = 0.5

objectspawner.DespawnDist     = 200.0
objectspawner.SpawnDist       = 100.0