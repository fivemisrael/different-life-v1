
	local blips = {
  {title="Courthouse", colour=5, id=89, x=242.45, y=-399.15, z=47.92},
  {title="Comedy Club", colour=5, id=102, x=-430.02, y=261.28, z=82.10}, 
  {title="Graveyard", colour=4, id=84, x=-813.78, y=61.54, z=50.34},
  {title="Casino", colour=5, id=490, x=921.78, y=48.53, z=80.89},
  {title="Crips", colour=3, id=84, x=113.23, y=-1947.66, z=20.63},
  {title="Bloods", colour=1, id=84, x=-128.52, y=-1586.14, z=32.28},
  {title="Coffee Shop", colour=21, id=89, x=-628.55, y=248.41, z=81.59}
}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.8)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)