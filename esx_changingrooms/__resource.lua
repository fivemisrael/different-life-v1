resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Changing Rooms'

version '0.0.1'

client_scripts {
    'config.lua',
    'main_c.lua'
}

server_scripts {
    'main_s.lua'
}

dependencies {
	'es_extended',
	'esx_datastore'
}