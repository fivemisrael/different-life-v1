resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'


server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/sv.lua',
	'config.lua',
	'server/afkkick-server.lua',
	'server/discordbot_server.lua',
	'server/commands-server.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/sv.lua',
	'config.lua',
	'client/afkkick-client.lua',
	'client/aicops.lua',
	'client/ko.lua',
	'client/coords.lua',
	'client/crouch.lua',
	'client/fixtraffic-client.lua',
	'client/novehreward.lua',
	'client/npc_drop-client.lua',
	'client/pointfinger-client.lua',
	'client/PvP.lua',
	'client/pwhip.lua',
	'client/rwd.lua',
	'client/shuffle.lua',
	'client/stun.lua',
	'client/vehcommands.lua'
}