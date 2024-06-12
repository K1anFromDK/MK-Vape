fx_version('cerulean')
games({ 'gta5' })
lua54 'yes'

author 'K1an - MK-Development https://discord.gg/vbAGU7B74t'

dependencies {
    'ox_lib',
    'es_extended'
}

shared_scripts {
    '@ox_lib/init.lua',
}

server_scripts({
    'server.lua',
});

client_scripts({
    'client.lua',
});