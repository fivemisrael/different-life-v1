Citizen.CreateThread(function()
	while true do
        --This is the Application ID (Replace this with you own)
		SetDiscordAppId(573340048058089495)

        --Here you will have to put the image name for the "large" icon.
		SetDiscordRichPresenceAsset('512x512')
        
        --(11-11-2018) New Natives:

        --Here you can add hover text for the "large" icon.
        SetDiscordRichPresenceAssetText('Different Life Roleplay WL')
       
        --Here you will have to put the image name for the "small" icon.
        SetDiscordRichPresenceAssetSmall('512x512')

        --Here you can add hover text for the "small" icon.
        SetDiscordRichPresenceAssetSmallText('Different Life Roleplay WL')

        --It updates every one minute just in case.
		Citizen.Wait(60000)
	end
end)