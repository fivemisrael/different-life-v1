Citizen.CreateThread( function()

	local resetcounter = 0
	local jumpDisabled = false
  	
  	while true do 
    Citizen.Wait(1)

  --  if IsRecording() then
  --      StopRecordingAndDiscardClip()
  --  end     

		if jumpDisabled and resetcounter > 0 and IsPedJumping(GetPlayerPed(-1)) then
			
			SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 3, 0, 0, 0)

			resetcounter = 0
		end

		if not jumpDisabled and IsPedJumping(GetPlayerPed(-1)) then

			jumpDisabled = true
			resetcounter = 100
			Citizen.Wait(1200)
		end

		if resetcounter > 0 then
			resetcounter = resetcounter - 1
		else
			if jumpDisabled then
				resetcounter = 0
				jumpDisabled = false
			end
		end
	end
end)