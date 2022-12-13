Config = {}

Config.admin_groups = {"admin","superadmin"} -- groups that can use admin commands
Config.admin_level = 3 -- min admin level that can use admin commands
Config.banformat = "הורחקת מהשרת!\nסיבה: %s\nעד: %s\nהורחקת על ידי: %s (מספר הרחקה: #%s)" -- message shown when banned (1st %s = reason, 2nd %s = expire, 3rd %s = banner, 4th %s = ban id)
Config.popassistformat = "השחקן %s מבקש עזרה\nלחץ <span class='text-success'>[↑] %s</span> כדי לאשר | לחץ <span class='text-danger'>[↓]</span> כדי לסרב" -- popup assist message format
Config.chatassistformat = "^2Different Life Roleplay: ^4!שחקן מבקש עזרה" -- chat assist message format
Config.assist_keys = {accept=208,decline=207} -- keys for accepting/declining assist messages (default = page up, page down) - https://docs.fivem.net/game-references/controls/
-- Config.assist_keys = nil -- coment the line above and uncomment this one to disable assist keys
Config.warning_screentime = 7.5 * 2000 -- warning display length (in ms)