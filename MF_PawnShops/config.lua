-- ModFreakz
-- For support, previews and showcases, head to https://discord.gg/ukgQa5K

MF_PawnShop = {}
local MFP = MF_PawnShop

MFP.Version = '1.0.10'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
Citizen.CreateThread(function(...)
  while not ESX do 
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end) 
    Citizen.Wait(0)
  end
end)

function MFP:GetShops()
  return {
    [1] = {
      title = 'Pawn Shop and Tool Shop',
      text  = 'Press [~r~E~s~] to interact with the Shop.',
      loc   = {x=182.8, y = -1319.31, z = 29.32},
      blip  = true,

      buy = {},
        -- [1] = {
          -- label       = 'Calculator',
          -- item        = 'calculator',
          -- price       = 25,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },

        -- [2] = {
          -- label       = 'Head Bag',
          -- item        = 'headbag',
          -- price       = 20,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },

        -- [3] = {
          -- label       = 'Repair Kit',
          -- item        = 'repairkit',
          -- price       = 50,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },

        -- [4] = {
          -- label       = 'RC Car',
          -- item        = 'rccar',
          -- price       = 150,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },
        -- [5] = {
          -- label       = 'Binoculars',
          -- item        = 'binoculars',
          -- price       = 50,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },
        -- [6] = {
          -- label       = 'Handcuffs',
          -- item        = 'handcuffs',
          -- price       = 50,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },
        -- [7] = {
          -- label       = 'Walkie Talkie',
          -- item        = 'radio',
          -- price       = 50,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },  
		    -- [8] = {
          -- label       = 'Plasma Cutter',
          -- item        = 'oxycutter',
          -- price       = 100,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },

        -- [9] = {
          -- label       = 'Mobile Phone',
          -- item        = 'phone',
          -- price       = 100,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },
        
        -- [10] = {
          -- label       = 'Lockpick',
          -- item        = 'lockpick',
          -- price       = 500,
          -- max         = 100000,
          -- startcount  = 99999,
        -- },

		-- [11] = {
          -- label       = 'Advanced Lockpick',
          -- item        = 'advancedlockpick',
          -- price       = 1000,
          -- max         = 100000,
          -- startcount  = 100000,
        -- }, 

      -- [12] = {
        -- label       = 'Pacific Bank ID Card',
        -- item        = 'pacificidcard',
        -- price       = 1500,
        -- max         = 100000,
        -- startcount  = 100000,
      -- }, 
    -- },
      sell = {
		[1] = {
          label   = 'Walkie Talkie',
          item    = 'radio',
          price   = 25,
          max     = 10000,
      },
        [2] = {
          label   = 'Nokia Phone',
          item    = 'nokia_phone',
          price   = 50,
          max     = 10000,
        },
        [3] = {
          label   = 'Cannon Camera',
          item    = 'camera',
          price   = 200,
          max     = 10000,
        },
    [4] = {
          label  = 'Gameboy',
          item   = 'gameboy',
          price  = 50,
          max     = 10000,
      },
    [5] = {
          label  = 'PSP',
          item   = 'psp',
          price  = 50,
          max     = 10000,
      },
    [6] = {
          label  = '2CT Gold Chain',
          item   = '2ct_gold_chain',
          price  = 75,
          max     = 10000,
      },
    [7] = {
          label  = 'Jewelry',
          item   = 'jewels',
          price  = 80,
          max     = 10000,
      },
    [8] = {
          label  = 'Casio Watch',
          item   = 'casio_watch',
          price  = 80,
          max     = 10000,
      }, 
    [9] = {
          label  = 'White Pearl',
          item   = 'white_pearl',
          price  = 80,
          max     = 10000,
      },
    [10] = {
      
          label  = 'Gold Chain',
          item   = 'goldNecklace',
          price  = 75,
          max     = 10000,
      },
    [11] = {
          label  = 'Cellphone',
          item   = 'phone',
          price  = 100,
          max     = 10000,
      },
    [12] = {
          label  = 'Samsung S8',
          item   = 'samsung_s8',
          price  = 100,
          max     = 10000,
      },
    [13] = {
          label  = 'Apple iPhone',
          item   = 'apple_iphone',
          price  = 100,
          max     = 10000,
      },
    [14] = {
          label  = 'Rolex',
          item   = 'rolex',
          price  = 80,
          max     = 10000,
      },
    [15] = {
          label  = 'Samsung S10',
          item   = 'samsungS10',
          price  = 200,
          max     = 10000,
      },
    [16] = {
          label  = 'Laptop',
          item   = 'laptop',
          price  = 250,
          max     = 10000,
      },
    [17] = {
          label  = '5CT Gold Chain',
          item   = '5ct_gold_chain',
          price  = 125,
          max     = 10000,
      },
    [18] = {
          label  = 'Ring',
          item   = 'ring',
          price  = 190,
          max     = 10000,
      },
    [19] = {
          label  = 'Diamond',
          item   = 'diamond',
          price  = 200,
          max     = 10000,
        },
    [20] = {
          label  = '8CT Gold Chain',
          item   = '8ct_gold_chain',
          price  = 180,
          max     = 10000,
        },
    [21] = {
          label  = 'Gold Bar',
          item   = 'gold',
          price  = 300,
          max     = 10000,
      },
    [22] = {
          label  = 'Oakley Sunglasses',
          item   = 'sunglasses',
          price  = 200,
          max     = 10000,
      },
    [23] = {
          label  = 'BOSS 10CT Gold Chain',
          item   = '10ct_gold_chain',
          price  = 300,
          max     = 10000,
        },
      },
    },
  }
end