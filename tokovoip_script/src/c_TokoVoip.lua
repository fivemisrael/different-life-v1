------------------------------------------------------------
------------------------------------------------------------
---- Author: Dylan 'Itokoyamato' Thuillier              ----
----                                                    ----
---- Email: itokoyamato@hotmail.fr                      ----
----                                                    ----
---- Resource: tokovoip_script                          ----
----                                                    ----
---- File: c_TokoVoip.lua                               ----\
------------------------------------------------------------
------------------------------------------------------------

--------------------------------------------------------------------------------
--	Client: TokoVoip functions
--------------------------------------------------------------------------------
ESX = nil
CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Wait(250)
	end
end)

local hasRadio = false
CreateThread(function()
	while true do
		Wait(6000)
		if (ESX == nil) then hasRadio = false return end
		ESX.TriggerServerCallback('tokovoip_getradio', function(qtty)
			if qtty > 0 then hasRadio = true else hasRadio = false end
		end, 'radio')
	end
	
end)

-- RegisterNetEvent("tokovoip:radio")
-- AddEventHandler("tokovoip:radio", function(haveradio)
  -- hasRadio = haveradio
-- end)

TokoVoip = {};
TokoVoip.__index = TokoVoip;
local lastTalkState = false

function TokoVoip.init(self, config)
	local self = setmetatable(config, TokoVoip);
	self.config = json.decode(json.encode(config));
	self.lastNetworkUpdate = 0;
	self.lastPlayerListUpdate = self.playerListRefreshRate;
	self.playerList = {};
	return (self);
end

function TokoVoip.loop(self)
	Citizen.CreateThread(function()
		while not self.plugin_data.localNamePrefix do Wait(100) end
		while (true) do
			Citizen.Wait(self.refreshRate);
			self:processFunction();
			self:sendDataToTS3();

			self.lastNetworkUpdate = self.lastNetworkUpdate + self.refreshRate;
			self.lastPlayerListUpdate = self.lastPlayerListUpdate + self.refreshRate;
			if (self.lastNetworkUpdate >= self.networkRefreshRate) then
				self.lastNetworkUpdate = 0;
				self:updateTokoVoipInfo();
			end
			if (self.lastPlayerListUpdate >= self.playerListRefreshRate) then
				self.playerList = GetActivePlayers();
				self.lastPlayerListUpdate = 0;
			end
		end
	end);
end

function TokoVoip.sendDataToTS3(self) -- Send usersdata to the Javascript Websocket
	self:updatePlugin("updateTokoVoip", self.plugin_data);
end

function TokoVoip.updateTokoVoipInfo(self, forceUpdate) -- Update the top-left info
	local info = "";
	if (self.mode == 1) then
		info = "Normal";
	elseif (self.mode == 2) then
		info = "Whispering";
	elseif (self.mode == 3) then
		info = "Shouting";
	end

	if (self.plugin_data.radioTalking) then
		info = info .. " on radio ";
	end
	if (self.talking == 1 or self.plugin_data.radioTalking) then
		info = "<font class='talking'>" .. info .. "</font>";
	end
	if (self.plugin_data.radioChannel ~= -1 and self.myChannels[self.plugin_data.radioChannel]) then
		if (string.match(self.myChannels[self.plugin_data.radioChannel].name, "Call")) then
			info = info  .. "<br> [Phone] " .. self.myChannels[self.plugin_data.radioChannel].name;
		else
			info = info  .. "<br> " .. self.myChannels[self.plugin_data.radioChannel].name;
		end
	end
	if (info == self.screenInfo and not forceUpdate) then return end
	self.screenInfo = info;
	self:updatePlugin("updateTokovoipInfo", "" .. info);
end

function TokoVoip.updatePlugin(self, event, payload)
	exports.tokovoip_script:doSendNuiMessage(event, payload);
end

function TokoVoip.updateConfig(self)
	local data = self.config;
	data.plugin_data = self.plugin_data;
	data.pluginVersion = self.pluginVersion;
	data.pluginStatus = self.pluginStatus;
	data.pluginUUID = self.pluginUUID;
	self:updatePlugin("updateConfig", data);
end

function TokoVoip.initialize(self)
	self:updateConfig();
	self:updatePlugin("initializeSocket", nil);
	Citizen.CreateThread(function()
		while (true) do
			Citizen.Wait(5);
			
			if ((self.keySwitchChannelsSecondary and IsControlPressed(0, self.keySwitchChannelsSecondary)) or not self.keySwitchChannelsSecondary) then -- Switch radio channels
				if (IsControlJustPressed(0, self.keySwitchChannels) and tablelength(self.myChannels) > 0) then
					local myChannels = {};
					local currentChannel = 0;
					local currentChannelID = 0;

					for channel, _ in pairs(self.myChannels) do
						if (channel == self.plugin_data.radioChannel) then
							currentChannel = #myChannels + 1;
							currentChannelID = channel;
						end
						myChannels[#myChannels + 1] = {channelID = channel};
					end
					if (currentChannel == #myChannels) then
						currentChannelID = myChannels[1].channelID;
					else
						currentChannelID = myChannels[currentChannel + 1].channelID;
					end
					self.plugin_data.radioChannel = currentChannelID;
					setPlayerData(self.serverId, "radio:channel", currentChannelID, true);
					self:updateTokoVoipInfo();
				end
			elseif (IsControlJustPressed(0, self.keyProximity)) then -- Switch proximity modes (normal / whisper / shout)
				if (not self.mode) then
					self.mode = 1;
				end
				self.mode = self.mode + 1;
				if (self.mode > 3) then
					self.mode = 1;
				end
				setPlayerData(self.serverId, "voip:mode", self.mode, true);
				self:updateTokoVoipInfo();
			end
			local playerPed = PlayerPedId()
			local rname = self.myChannels[self.plugin_data.radioChannel] and self.myChannels[self.plugin_data.radioChannel].name
			if rname and string.match(rname, "Call") then
				if (not getPlayerData(self.serverId, "radio:talking")) then
					setPlayerData(self.serverId, "radio:talking", true, true);
				end
				self:updateTokoVoipInfo();
			end
			if (IsControlPressed(0, self.radioKey) and self.plugin_data.radioChannel ~= -1 and self.config.radioEnabled and hasRadio) then -- Talk on radio
				self.plugin_data.radioTalking = true;
				self.plugin_data.localRadioClicks = true;
				if (self.plugin_data.radioChannel > self.config.radioClickMaxChannel) then
					self.plugin_data.localRadioClicks = false;
				end
				if (not getPlayerData(self.serverId, "radio:talking")) then
					setPlayerData(self.serverId, "radio:talking", true, true);
				end
				self:updateTokoVoipInfo();
				if (lastTalkState == false and self.myChannels[self.plugin_data.radioChannel] and self.config.radioAnim) then
					if (not string.match(self.myChannels[self.plugin_data.radioChannel].name, "Call") and not IsPedSittingInAnyVehicle(playerPed)) then
						RequestAnimDict("random@arrests");
						while not HasAnimDictLoaded("random@arrests") do
							Wait(5);
						end
						if not IsEntityPlayingAnim(playerPed, "move_crawl", "onfront_fwd", 3) then TaskPlayAnim(playerPed,"random@arrests","generic_radio_chatter", 8.0, 0.0, -1, 49, 0, 0, 0, 0) end
					end
					lastTalkState = true
				end
			elseif not rname or (rname and not string.match(rname, "Call")) then
				self.plugin_data.radioTalking = false;
				if (getPlayerData(self.serverId, "radio:talking")) then
					setPlayerData(self.serverId, "radio:talking", false, true);
				end
				self:updateTokoVoipInfo();
				
				if lastTalkState == true and self.config.radioAnim then
					lastTalkState = false
					StopAnimTask(playerPed, "random@arrests","generic_radio_chatter", -4.0);
				end
			end
		end
	end);
end

function TokoVoip.disconnect(self)
	self:updatePlugin("disconnect");
end
