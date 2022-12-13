ESX = nil
local IsDead = false

pistol = {736523883, 324215364, 453432689, 3219281620, 1593441988, -1716589765, -1076751822, -771403250, 137902532, -598887786, -1045183535, 584646201, 171789620, 1627465347, -619010992, 2024373456, -270015777, -1121678507}
mg = {-1660422300, 2144741730, 3686625920}
ar = {-1074790547, 961495388, -2084633992, 4208062921, -1357824103, -1063057011, 2132975508, 1649403952}
sg = {487013001, 2017895192, -1654528753, -494615257, -1466123874, 984333226, -275439685, 317205821}

supp1 = {-2084633992, -1357824103, 2132975508, -494615257}
supp2 = {-1716589765, 324215364, -270015777, -1074790547, -1063057011, -1654528753, 984333226}
supp3 = {1593441988, -771403250, 584646201, 137902532, 736523883}
supp4 = {487013001}

flash1 = {453432689, 1593441988, 584646201, -1716589765, -771403250, 324215364}
flash2 = {736523883, -270015777, 171789620, -1074790547, -2084633992, -1357824103, -1063057011, 2132975508, 487013001, -494615257, -1654528753, 984333226}

grip1 = {171789620, -1074790547, -2084633992, -1063057011, 2132975508, 2144741730, -494615257, -1654528753, 984333226}


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('playerSpawned', function()
    used = 0
    used2 = 0
    used3 = 0
    used4 = 0
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local used = 0

RegisterNetEvent('nfw_wep:silencieux')
AddEventHandler('nfw_wep:silencieux', function()
    local inventory = ESX.GetPlayerData().inventory
    local silencieux = 0
    local item = 'silencieux'
    
    for i=1, #inventory, 1 do
        if inventory[i].name == 'silencieux' then
            silencieux = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped)

    if WepHash == GetHashKey("WEAPON_PISTOL") then
        GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("component_at_pi_supp_02"))
        TriggerEvent('notification', 'You have equipped a silencer!', 1)
        used = used + 1
    elseif table.includes(supp1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x837445AA)
       TriggerEvent('notification', 'You have equipped a silencer!', 1)
        used = used + 1
    elseif table.includes(supp2, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xA73D4664)
        TriggerEvent('notification', 'You have equipped a silencer!', 1)
        used = used + 1
    elseif table.includes(supp3, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xC304849A)
        TriggerEvent('notification', 'You have equipped a silencer!', 1)
        used = used + 1
    elseif table.includes(supp4, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xE608B35E)
        TriggerEvent('notification', 'You have equipped a silencer!', 1)
        used = used + 1
    else
        TriggerEvent('notification', 'This weapon is not compatible with a silencer', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

local used2 = 0

RegisterNetEvent('nfw_wep:flashlight')
AddEventHandler('nfw_wep:flashlight', function() 
    local inventory = ESX.GetPlayerData().inventory
    local flashlight = 0
    local item = 'flashlight'
    
    for i=1, #inventory, 1 do
		if inventory[i].name == 'flashlight' then
			flashlight = inventory[i].count
		end
	end
    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped)

    if table.includes(flash1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x359B7AAE)
        TriggerEvent('notification',  'You have equipped a flashlight!', 1)
    elseif table.includes(flash2, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0x7BC4CDDC)
        TriggerEvent('notification',  'You have equipped a flashlight!', 1)
    else
        TriggerEvent('notification', 'This weapon is not compatible with a flashlight', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

local used3 = 0

RegisterNetEvent('nfw_wep:grip')
AddEventHandler('nfw_wep:grip', function()
    local inventory = ESX.GetPlayerData().inventory
    local grip = 0
    local item = 'grip'

    for i=1, #inventory, 1 do
        if inventory[i].name == 'grip' then
            grip = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local WepHash = GetSelectedPedWeapon(ped) 

    if table.includes(grip1, WepHash) then
        GiveWeaponComponentToPed(GetPlayerPed(-1), WepHash, 0xC164F53)
        TriggerEvent('notification', 'You have equipped a grip!', 1)
    else
        TriggerEvent('notification', 'This weapon is not compatible with a grip', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

RegisterNetEvent('nfw_wep:yusuf')
AddEventHandler('nfw_wep:yusuf', function()
    local inventory = ESX.GetPlayerData().inventory
    local yusuf = 0
    for i=1, #inventory, 1 do
        if inventory[i].name == 'yusuf' then
            yusuf = inventory[i].count
        end
    end

    local ped = PlayerPedId()
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    if used4 < yusuf then

        if currentWeaponHash == GetHashKey("WEAPON_PISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), GetHashKey("COMPONENT_PISTOL_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1
        
        elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL50") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL50"), GetHashKey("COMPONENT_PISTOL50_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_APPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_APPISTOL"), GetHashKey("COMPONENT_APPISTOL_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_HEAVYPISTOL") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), GetHashKey("COMPONENT_HEAVYPISTOL_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_SMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SMG"), GetHashKey("COMPONENT_SMG_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_MICROSMG") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_MICROSMG"), GetHashKey("COMPONENT_MICROSMG_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_ASSAULTRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ASSAULTRIFLE"), GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_CARBINERIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_CARBINERIFLE"), GetHashKey("COMPONENT_CARBINERIFLE_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1

        elseif currentWeaponHash == GetHashKey("WEAPON_ADVANCEDRIFLE") then
            GiveWeaponComponentToPed(GetPlayerPed(-1), GetHashKey("WEAPON_ADVANCEDRIFLE"), GetHashKey("COMPONENT_ADVANCEDRIFLE_VARMOD_LUXE"))
            TriggerEvent('notification', 'You have applied a Luxury Weapon Skin', 1)
            used4 = used4 + 1
        else
            TriggerEvent('notification', 'You do not have a wepaon in hand that is compatible with a skin', 2)
        end
    else
        TriggerEvent('notification', 'You have used all your weapon skins', 1)
    end
end)

RegisterNetEvent('nfw_wep:pAmmo')
AddEventHandler('nfw_wep:pAmmo', function()
    local ped = GetPlayerPed(-1)
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    local ammo = GetAmmoInPedWeapon(ped, currentWeaponHash)
    local item = "pAmmo"

    if(ammo >= 250 or ammo + 50 > 250) then
        TriggerEvent('notification', 'Your weapon ammo is already maxed!', 1)
        TriggerServerEvent('returnItem', item)
        return
    end

    if table.includes(pistol, currentWeaponHash) then
        TriggerEvent('notification', 'Added 25 more Pistol Ammo', 1)
        AddAmmoToPed(ped, currentWeaponHash, 25)
    else
        TriggerEvent('notification', 'This weapon is not compatible with this ammo', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

RegisterNetEvent('nfw_wep:mgAmmo')
AddEventHandler('nfw_wep:mgAmmo', function()
    local ped = GetPlayerPed(-1)
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    local ammo = GetAmmoInPedWeapon(ped, currentWeaponHash)
    local item = "mgAmmo"

    if(ammo >= 250 or ammo + 50 > 250) then
        TriggerEvent('notification', 'Your weapon ammo is already maxed!', 1)
        TriggerServerEvent('returnItem', item)
        return
    end

    if table.includes(mg, currentWeaponHash) then
        TriggerEvent('notification', 'Added 25 more Machine Gun ammo', 1)
        AddAmmoToPed(ped, currentWeaponHash, 25)
    else
        TriggerEvent('notification', 'This weapon is not compatible with this ammo', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

RegisterNetEvent('nfw_wep:arAmmo')
AddEventHandler('nfw_wep:arAmmo', function()
    local ped = GetPlayerPed(-1)
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    local ammo = GetAmmoInPedWeapon(ped, currentWeaponHash)
    local item = "arAmmo"

    if(ammo >= 250 or ammo + 50 > 250) then
        TriggerEvent('notification', 'Your weapon ammo is already maxed!', 1)
        TriggerServerEvent('returnItem', item)
        return
    end

    if table.includes(ar, currentWeaponHash) then
        TriggerEvent('notification', 'Added 25 more Assault Rifle ammo', 1)
        AddAmmoToPed(ped, currentWeaponHash, 25)
    else
        TriggerEvent('notification', 'This weapon is not compatible with this ammo', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

RegisterNetEvent('nfw_wep:sgAmmo')
AddEventHandler('nfw_wep:sgAmmo', function()
    local ped = GetPlayerPed(-1)
    local currentWeaponHash = GetSelectedPedWeapon(ped)
    local ammo = GetAmmoInPedWeapon(ped, currentWeaponHash)
    local item = "sgAmmo"

    if(ammo >= 250 or ammo + 50 > 250) then
        TriggerEvent('notification', 'Your weapon ammo is already maxed!', 1)
        TriggerServerEvent('returnItem', item)
        return
    end

    if table.includes(sg, currentWeaponHash) then
        TriggerEvent('notification', 'Added 25 more Shotgun ammo', 1)
        AddAmmoToPed(ped, currentWeaponHash, 25)
    else
        TriggerEvent('notification', 'This weapon is not compatible with this ammo', 2)
        TriggerServerEvent('returnItem', item)
    end
end)

function table.includes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end