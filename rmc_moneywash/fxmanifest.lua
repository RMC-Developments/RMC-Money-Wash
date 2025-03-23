fx_version 'cerulean'
game 'gta5'

author 'RMC Development'
description 'Money Laundering Script'
version '1.3.0'

shared_scripts {
    'config.lua' -- This ensures config.lua is shared between client & server
}

client_scripts {
    'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Only if using a database
    'server.lua'
}

dependencies {
    'qb-core',
    'ox_inventory',
    'ox_target'
}
