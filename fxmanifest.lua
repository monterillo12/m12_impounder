fx_version 'cerulean'
game 'gta5'

Author 'monterillo12'
version '1.2.0'
description 'ESX - Police Impounder'

lua54 'yes' -- optional

client_scripts {
	'@es_extended/locale.lua',
	'locales/*.lua',
	'config.lua',
	'client.lua'
}

dependencies {
	'es_extended'
}