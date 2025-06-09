-- hamed.777 on discord
-- @ham3d777_ on X (twitter)
--[[

you can set data from leaderstats, attributes, dataStore, etc. I used rawData

]]
local rawStats = {
	cash = 10,
	gems = 100,
}

local newPlayersTag = {} -- store players tag

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		if char then
			newPlayersTag[player.UserId] = require(game.ReplicatedStorage.playerTag.playerTag).new(player, rawStats)
			newPlayersTag[player.UserId]:init()
		end
	end)
end)

game.Players.PlayerRemoving:Connect(function(player)
	if player.Character then
		newPlayersTag[player.UserId]:destroyTag()
	end
end)
