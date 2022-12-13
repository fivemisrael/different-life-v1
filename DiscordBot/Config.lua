DiscordWebhookSystemInfos = 'https://discordapp.com/api/webhooks/682951580563013700/AqJuA8PByEKVMTzRxLDgWYr4kQYdotLDaCWCJVzVWgWdv5e6Ah-8GgPIp8sftvn707_x'
DiscordWebhookKillinglogs = 'https://discordapp.com/api/webhooks/682951975972765704/FbB9o5Y0rsK7BCqUWN9Dy8qNH6dgFx2BPfsgwCIw4CBqrD-87ERWrIUQ7h5a1i3S6V2j'
DiscordWebhookChat = 'https://discordapp.com/api/webhooks/682952102217121817/8DzDVV1NCfCEBDu5KsmMIF1szInuNeJnV3mAi6WVVrpb_VrZhF11qc0mOHrTOiWw6XNk'

SystemAvatar = 'https://cdn.discordapp.com/attachments/682907484813262885/682952392991703057/ezgif.png'

UserAvatar = 'https://cdn.discordapp.com/attachments/682907484813262885/682952392991703057/ezgif.png'

SystemName = 'Different Life Bot'


--[[ Special Commands formatting
		 *YOUR_TEXT*			--> Make Text Italics in Discord
		**YOUR_TEXT**			--> Make Text Bold in Discord
	   ***YOUR_TEXT***			--> Make Text Italics & Bold in Discord
		__YOUR_TEXT__			--> Underline Text in Discord
	   __*YOUR_TEXT*__			--> Underline Text and make it Italics in Discord
	  __**YOUR_TEXT**__			--> Underline Text and make it Bold in Discord
	 __***YOUR_TEXT***__		--> Underline Text and make it Italics & Bold in Discord
		~~YOUR_TEXT~~			--> Strikethrough Text in Discord
]]
-- Use 'USERNAME_NEEDED_HERE' without the quotes if you need a Users Name in a special command
-- Use 'USERID_NEEDED_HERE' without the quotes if you need a Users ID in a special command


-- These special commands will be printed differently in discord, depending on what you set it to
SpecialCommands = {
				   {'/ooc', '**[OOC]:**'},
				   {'/911', '**[911]: (CALLER ID: [ USERNAME_NEEDED_HERE | USERID_NEEDED_HERE ])**'},
				  }

						
-- These blacklisted commands will not be printed in discord
BlacklistedCommands = {
					   '/AnyCommand',
					   '/AnyCommand2',
					  }

-- These Commands will use their own webhook
OwnWebhookCommands = {
					  {'/AnotherCommand', 'WEBHOOK_LINK_HERE'},
					  {'/AnotherCommand2', 'WEBHOOK_LINK_HERE'},
					 }

-- These Commands will be sent as TTS messages
TTSCommands = {
			   '/Whatever',
			   '/Whatever2',
			  }

