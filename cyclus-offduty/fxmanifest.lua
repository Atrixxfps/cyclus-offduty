fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Cyclus Scripts | Atrixx#0001'
description 'FiveM: off-duty script'
version '1.0.0'
lua54 'yes'

ui_page "html/index.html"
escrow_ignore {
    'config.lua',
    'client/function.lua'
}

shared_scripts {
    'config.lua'
}
client_scripts {
    'client/*'
}
server_scripts {
    'server/*'
}

files {
    'html/*',
    "html/img/*"
}