resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'WOZ Locense'

version '1.0.0'

client_scripts {
	'config.lua',
	'client/main.lua'
}
server_scripts {
	'@mysql-async/lib/MySQL.lua',
 'server/main.lua'
 }

dependency 'es_extended'