resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
	-- Base
	'JAM_Main.lua',
	'JAM_Client.lua',
	'JAM_Utilities.lua',
	
	-- Notify
	'JAM_Notify/JAM_Notify_Client.lua',
	
	'JAM_VehicleShop/JAM_VehicleShop_Config.lua',
	'JAM_VehicleShop/JAM_VehicleShop_Client.lua',
	'JAM_VehicleShop/JAM_VehicleShop_Utils.lua',
	
	--'JAM_VehicleFinance/JAM_VehicleFinance_Config.lua',
	--'JAM_VehicleFinance/JAM_VehicleFinance_Client.lua',
	-- Garage
	--'JAM_Garage/JAM_Garage_Config.lua',
	--'JAM_Garage/JAM_Garage_Client.lua',	

	-- Commands
	--'JAM_Commands/JAM_Commands.lua',

	-- SafeCracker
	--'JAM_SafeCracker/JAM_SafeCracker_Config.lua',
	--'JAM_SafeCracker/JAM_SafeCracker_Client.lua',

	-- Drugs
	--'JAM_Drugs/JAM_Drugs_Config.lua',
	--'JAM_Drugs/JAM_Drugs_Client.lua',
	--'JAM_Drugs/iplList.lua',	

	-- Stuff
	--'JAM_Stuff/JAM_Stuff_Client.lua',
	--'JAM_Stuff/JAM_HudHider_Client.lua',

	-- Items
	--'JAM_Items/JAM_SecurityCamera_Client.lua',

	--'JAM_Items/JAM_vehicleTracker_Config.lua',
	--'JAM_Items/JAM_VehicleTracker_Client.lua',

	--'JAM_Items/JAM_NightVision_Client.lua',

	-- Teleport
	--'JAM_Teleport/JAM_Teleport_Config.lua',
	--'JAM_Teleport/JAM_Teleport_Client.lua',	
}

server_scripts {	
	-- Base
	'JAM_Main.lua',
	'JAM_Server.lua',
	'JAM_Utilities.lua',

	-- MySQL
	'@mysql-async/lib/MySQL.lua',
	
	'JAM_VehicleShop/JAM_VehicleShop_Config.lua',
	'JAM_VehicleShop/JAM_VehicleShop_Server.lua',
	
	--'JAM_VehicleFinance/JAM_VehicleFinance_Config.lua',
	--'JAM_VehicleFinance/JAM_VehicleFinance_Server.lua',
	-- Garage
	--'JAM_Garage/JAM_Garage_Config.lua',
	--'JAM_Garage/JAM_Garage_Server.lua',

	-- SafeCracker
	--'JAM_SafeCracker/JAM_SafeCracker_Config.lua',
	--'JAM_SafeCracker/JAM_SafeCracker_Server.lua',

	-- Drugs
	--'JAM_Drugs/JAM_Drugs_Config.lua',
	--'JAM_Drugs/JAM_Drugs_Server.lua',	

	-- Race Mod

	-- Items
	--'JAM_Items/JAM_SecurityCamera_Server.lua',
	
	--'JAM_Items/JAM_vehicleTracker_Config.lua',
	--'JAM_Items/JAM_VehicleTracker_Server.lua',	
}

files {	
	-- Safecracker
	--'JAM_SafeCracker/LockPart1.png',
	--'JAM_SafeCracker/LockPart2.png',
}
