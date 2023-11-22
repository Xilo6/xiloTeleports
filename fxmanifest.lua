fx_version "adamant"
game "gta5"
lua54 "yes"
author "Xilo"
discord_server "discord.gg/xilo"

client_scripts {
    "client/main.lua"
}

server_scripts {
    "server/main.lua"
}

shared_scripts {
    "configuration.lua",
    "@ox_lib/init.lua",
    "@es_extended/imports.lua"
}