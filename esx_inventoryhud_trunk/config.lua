local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = 'en'

Config.OpenKey = Keys["G"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 25000

-- If you are using esx_avanced_inventory SqlBased weight for your items
Config.WeightSqlBased = false

-- Default weight for an item:
-- weight == 0 : The item do not affect character inventory weight
-- weight > 0 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.DefaultWeight = 10

Config.localWeight = {
    pAmmo = 50,
    mgAmmo = 50,
    sgAmmo = 80,
    arAmmo = 100,
    advancedlockpick = 2000,
    lockpick = 1000,
    tunerchip = 2500,
    silencieux = 100,
    grip = 100,
    yusuf = 10,
    flashlight = 100,
    radio = 200,
    phone = 800,
    weedburn = 1,
    cokeburn = 1,
    methburn = 1,
    drugbags = 5,
    rolpaper = 1,
    oxycutter = 5000,
    rccar = 200,
    handcuffs = 500,
    binoculars = 1000,
    HeavyArmor = 2000,
    hqscale = 1000,
    coke1g = 1,
    meth1g = 1,
    joint2g = 2,
    weed4g = 4,
    coke10g = 10,
    meth10g = 10,
    weed20g = 20,
    cokebrick = 100,
    weedbrick = 200,
    methbrick = 100,
    repairkit = 3000,
    WEAPON_SMG = 2500,
    WEAPON_SNIPERRIFLE = 15000,
    WEAPON_NIGHTSTICK = 1000,
    WEAPON_STUNGUN = 800,
    WEAPON_HAMMER = 100,
    WEAPON_MACHETE = 2000,
    WEAPON_DAGGER = 200,
    WEAPON_FLASHLIGHT = 150,
    WEAPON_BAT = 500,
    WEAPON_WRENCH = 5000,
    WEAPON_GOLFCLUB = 500,
    WEAPON_FLAREGUN = 800,
    WEAPON_HATCHET = 2500,
    WEAPON_CROWBAR = 2000,
    WEAPON_BOTTLE = 50,
    WEAPON_BALL = 25,
    WEAPON_POOLCUE = 100,
    WEAPON_KNIFE = 100,
    WEAPON_GUSENBERG = 5000,
    WEAPON_STICKYBOMB = 1500,
    WEAPON_SPECIALCARBINE = 10000,
    WEAPON_ASSAULTRIFLE = 10000,
    WEAPON_COMPACTRIFLE = 5000,
    WEAPON_COMBATPDW = 2500,
    WEAPON_SAWNOFFSHOTGUN = 6000,
    WEAPON_STICKYBOMB = 1500,
    WEAPON_MICROSMG = 2500,
    WEAPON_MINISMG = 2000,
    WEAPON_MACHINEPISTOL = 2500,
    WEAPON_HEAVYPISTOL = 2000,
    WEAPON_APPISTOL = 1250,
    WEAPON_CARBINERIFLE = 9500,
    WEAPON_FLASHLIGHT = 250,
    WEAPON_PISTOL = 1000,
    WEAPON_SNSPISTOL = 800,
    WEAPON_COMBATPISTOL = 1000
}

Config.VehicleLimit = {
    [0] = 100000, --Compact
    [1] = 100000, --Sedan
    [2] = 145000, --SUV
    [3] = 80000, --Coupes
    [4] = 70000, --Muscle
    [5] = 70000, --Sports Classics
    [6] = 70000, --Sports
    [7] = 50000, --Super
    [8] = 5000, --Motorcycles
    [9] = 180000, --Off-road
    [10] = 300000, --Industrial
    [11] = 70000, --Utility
    [12] = 100000, --Vans
    [13] = 0, --Cycles
    [14] = 50000, --Boats
    [15] = 20000, --Helicopters
    [16] = 0, --Planes
    [17] = 40000, --Service
    [18] = 40000, --Emergency
    [19] = 0, --Military
    [20] = 300000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
