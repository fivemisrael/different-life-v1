local weaponblacklist = {
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_MINIGUN",
	"WEAPON_PASSENGER_ROCKET",
	"WEAPON_AIRSTRIKE_ROCKET",
	"WEAPON_STINGER",
	"WEAPON_DIGISCANNER",
	"WEAPON_BRIEFCASE",
	"WEAPON_BRIEFCASE_02",
	"WEAPON_VEHICLE_ROCKET",
	"WEAPON_BARBED_WIRE",
	"WEAPON_DROWNING",
	"WEAPON_DROWNING_IN_VEHICLE",
	"WEAPON_BLEEDING",
	"WEAPON_ELECTRIC_FENCE",
	"WEAPON_FIRE",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_PROXMINE",
	"WEAPON_RAILGUN",
	"WEAPON_AIR_DEFENCE_GUN",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_PIPEBOMB",
	"VEHICLE_WEAPON_ROTORS",
	"VEHICLE_WEAPON_TANK",
	"VEHICLE_WEAPON_SPACE_ROCKET",
	"VEHICLE_WEAPON_PLANE_ROCKET",
	"VEHICLE_WEAPON_PLAYER_LAZER",
	"VEHICLE_WEAPON_PLAYER_LASER",
	"VEHICLE_WEAPON_PLAYER_BULLET",
	"VEHICLE_WEAPON_PLAYER_BUZZARD",
	"VEHICLE_WEAPON_PLAYER_HUNTER",
	"VEHICLE_WEAPON_ENEMY_LASER",
	"VEHICLE_WEAPON_SEARCHLIGHT",
	"VEHICLE_WEAPON_RADAR",
	"VEHICLE_WEAPON_TURRET_INSURGENT",
	"VEHICLE_WEAPON_TURRET_TECHNICAL",
	"VEHICLE_WEAPON_NOSE_TURRET_VALKYRIE",
	"VEHICLE_WEAPON_PLAYER_SAVAGE",
	"VEHICLE_WEAPON_TURRET_LIMO",
	"VEHICLE_WEAPON_CANNON_BLAZER",
	"VEHICLE_WEAPON_TURRET_BOXVILLE",
	"VEHICLE_WEAPON_RUINER_BULLET",
	"PICKUP_WEAPON_ASSAULTSMG",
	"PICKUP_VEHICLE_WEAPON_ASSAULTSMG",
	"PICKUP_WEAPON_PISTOL50",
	"PICKUP_VEHICLE_WEAPON_PISTOL50",
	"PICKUP_AMMO_BULLET_MP",
	"PICKUP_AMMO_MISSILE_MP",
	"PICKUP_AMMO_GRENADELAUNCHER_MP",
	"PICKUP_WEAPON_ASSAULTRIFLE",
	"PICKUP_WEAPON_ADVANCEDRIFLE",
	"PICKUP_WEAPON_MG",
	"PICKUP_WEAPON_COMBATMG",
	"PICKUP_WEAPON_HEAVYSNIPER",
	"PICKUP_WEAPON_MICROSMG",
	"PICKUP_WEAPON_SMG",
	"PICKUP_ARMOUR_STANDARD",
	"PICKUP_WEAPON_RPG",
	"PICKUP_WEAPON_MINIGUN",
	"PICKUP_HEALTH_STANDARD",
	"PICKUP_WEAPON_GRENADE",
	"PICKUP_WEAPON_MOLOTOV",
	"PICKUP_WEAPON_SMOKEGRENADE",
	"PICKUP_WEAPON_PISTOL",
	"PICKUP_WEAPON_COMBATPISTOL",
	"PICKUP_WEAPON_APPISTOL",
	"PICKUP_WEAPON_GRENADELAUNCHER",
	"PICKUP_MONEY_VARIABLE",
	"PICKUP_WEAPON_STUNGUN",
	"PICKUP_WEAPON_FIREEXTINGUISHER",
	"PICKUP_WEAPON_PETROLCAN",
	"PICKUP_WEAPON_KNIFE",
	"PICKUP_WEAPON_NIGHTSTICK",
	"PICKUP_WEAPON_HAMMER",
	"PICKUP_WEAPON_BAT",
	"PICKUP_WEAPON_GolfClub",
	"PICKUP_WEAPON_CROWBAR",
	"PICKUP_HANDCUFF_KEY",
	"PICKUP_CUSTOM_SCRIPT",
	"PICKUP_CAMERA",
	"PICKUP_PORTABLE_PACKAGE",
	"PICKUP_PORTABLE_CRATE_UNFIXED",
	"PICKUP_PORTABLE_CRATE_UNFIXED_INCAR",
	"PICKUP_MONEY_CASE",
	"PICKUP_MONEY_WALLET",
	"PICKUP_MONEY_PURSE",
	"PICKUP_MONEY_DEP_BAG",
	"PICKUP_MONEY_MED_BAG",
	"PICKUP_MONEY_PAPER_BAG",
	"PICKUP_MONEY_SECURITY_CASE",
	"PICKUP_VEHICLE_WEAPON_COMBATPISTOL",
	"PICKUP_VEHICLE_WEAPON_APPISTOL",
	"PICKUP_VEHICLE_WEAPON_PISTOL",
	"PICKUP_VEHICLE_WEAPON_GRENADE",
	"PICKUP_VEHICLE_WEAPON_MOLOTOV",
	"PICKUP_VEHICLE_WEAPON_SMOKEGRENADE",
	"PICKUP_VEHICLE_HEALTH_STANDARD",
	"PICKUP_VEHICLE_ARMOUR_STANDARD",
	"PICKUP_VEHICLE_WEAPON_MICROSMG",
	"PICKUP_VEHICLE_WEAPON_SMG",
	"PICKUP_VEHICLE_WEAPON_SAWNOFF",
	"PICKUP_VEHICLE_CUSTOM_SCRIPT",
	"PICKUP_VEHICLE_MONEY_VARIABLE",
	"PICKUP_SUBMARINE",
	"PICKUP_HEALTH_SNACK",
	"PICKUP_PARACHUTE",
	"PICKUP_AMMO_PISTOL",
	"PICKUP_AMMO_SMG",
	"PICKUP_AMMO_RIFLE",
	"PICKUP_AMMO_MG",
	"PICKUP_AMMO_SNIPER",
	"PICKUP_AMMO_GRENADELAUNCHER",
	"PICKUP_AMMO_RPG",
	"PICKUP_AMMO_MINIGUN",
	"PICKUP_WEAPON_BULLPUPRIFLE",
	"PICKUP_WEAPON_BOTTLE",
	"PICKUP_WEAPON_SNSPISTOL",
	"PICKUP_WEAPON_GUSENBERG",
	"PICKUP_WEAPON_HEAVYPISTOL",
	"PICKUP_WEAPON_DAGGER",
	"PICKUP_WEAPON_VINTAGEPISTOL",
	"PICKUP_WEAPON_FIREWORK",
	"PICKUP_WEAPON_MUSKET",
	"PICKUP_AMMO_FIREWORK",
	"PICKUP_AMMO_FIREWORK_MP",
	"PICKUP_PORTABLE_DLC_VEHICLE_PACKAGE",
	"PICKUP_WEAPON_MARKSMANRIFLE",
	"PICKUP_GANG_ATTACK_MONEY",
	"PICKUP_WEAPON_PROXMINE",
	"PICKUP_WEAPON_HOMINGLAUNCHER",
	"PICKUP_AMMO_HOMINGLAUNCHER",
	"PICKUP_WEAPON_FLAREGUN",
	"PICKUP_AMMO_FLAREGUN",
	"PICKUP_WEAPON_COMBATPDW",
	"PICKUP_WEAPON_KNUCKLE",
	"PICKUP_WEAPON_MARKSMANPISTOL",
	"WEAPON_MINIGUN",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_RAILGUN",
	"WEAPON_RPG",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADE",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_STINGER",
	"WEAPON_MARKSMANRIFLE_MK2",
	"WEAPON_PUMPSHOTGUN_MK2",
	"WEAPON_BULLPUPRIFLE_MK2",
	"WEAPON_SPECIALCARBINE_MK2",
--	"WEAPON_DOUBLEACTION",
	"WEAPON_REVOLVER_MK2",
	"WEAPON_SNSPISTOL_MK2",
--	"WEAPON_HEAVYSNIPER",
	"WEAPON_HEAVYSNIPER_MK2",
	"PICKUP_WEAPON_MINIGUN",
	"WEAPON_COMBATMG",
	"WEAPON_MG",
	"WEAPON_COMBATMG_MK2",
	"WEAPON_PIPEBOMBS",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_BZGAS"
}
local carblacklist = {
	"annihilator",
	"cargobob",
	"cargobob2",
	"cargobob3",
	"cargobob4",
	"buzzard",
	"maverick",
	"maverick",
	"savage",
	"skylift",
	"supervolito",
	"supervolito2",
	"seasparrow",
	"valkrie",
	"valkrie2",
	"volatus",
	"apc",				
	"barracks",
	"barracks2",
	"barracks3",
	"crusader",
	"halftrack",
	"trailersmall2",
	"opressor",
	"shotaro",
	"besra",
	"blimp",
	"blimp2",
	"cargoplane",
	"duster",
	"jet",
	"luxor",
	"luxor2",
	"mammatus",
	"miljet",
	"nimbus",
	"shamai",
	"stunt",
	"titan",
	"velum",
	"velum2",
	"vestra",
	"shamal",
	"nokota",
	"avenger",
	"microlight",
	"howard"
}

CreateThread(function()
	while true do
		Wait(1000)
		local playerPed = PlayerPedId()
		local success, weaponhash = GetCurrentPedWeapon(playerPed, true)
		for a, b in next, weaponblacklist do
			if GetHashKey(b) == weaponhash then
				RemoveWeaponFromPed(playerPed, weaponhash)
				sendForbiddenMessage("This weapon is forbidden!")
				break
			end
		end
		if IsPedInAnyVehicle(playerPed) then
			local veh = GetVehiclePedIsUsing(playerPed)
			
			for a, b in next, carblacklist do
				if GetEntityModel(veh) == GetHashKey(b) then
					
					DeleteEntity(veh)
					sendForbiddenMessage("This vehicle is forbidden!")
					break
				end
			end
		end
	end
end)


function sendForbiddenMessage(message)
	TriggerEvent("chatMessage", "", {0, 0, 0}, "^1" .. message)
end