resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/main.lua",
}

client_scripts {
    "client/main.lua",
}

ui_page {
    'html/ui.html',
}
files {
    'html/ui.html',
    'html/css/new.css',
    'html/css/all.css',
    'html/css/bootstrap.min.css',
    'html/css/ollie.css',
    'html/js/ollie.js',
    'html/js/popper.min.js',
    'html/js/jquery-3.3.1.min.js',
    'html/js/bootstrap.min.js',
}
