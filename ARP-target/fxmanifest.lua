fx_version 'bodacious'

game 'gta5'

dependencies {
    "PolyZone"
}

ui_page 'html/index.html'

client_scripts {
 '@PolyZone/client.lua',
 '@PolyZone/BoxZone.lua',
 '@PolyZone/EntityZone.lua',
 '@PolyZone/CircleZone.lua',
 '@PolyZone/ComboZone.lua',
 'client/*.lua',
}

server_scripts {
    'server/*.lua'
}

files {
 'html/index.html',
 'html/css/style.css',
 'html/js/script.js',
 'html/eye1.png',
 'html/eye2.png',
}
