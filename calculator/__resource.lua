resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

client_scripts {
    "client.lua"
}

server_scripts {
    "server.lua"
}

files {
    "html/index.html",
    "html/script.js",
    "html/jquery.js",
    "html/style.css",
    'calculator_props.ytyp',
}

ui_page "html/index.html"

data_file 'DLC_ITYP_REQUEST' 'calculator_props.ytyp'