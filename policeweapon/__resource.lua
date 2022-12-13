resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'Skin Changer'

version '1.0.3'

client_script('client.lua') --your NUI Lua File

ui_page('html/index.html') --THIS IS IMPORTENT

--[[The following is for the files which are need for you UI (like, pictures, the HTML file, css and so on) ]]--
files({
    'html/index.html',
    'html/style.css'
})