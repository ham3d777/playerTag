local meta = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

meta.__index = meta

function meta.new(player: Player, stats: {})
	local data = {
		Player = player,
		PlayerTag = nil,
		Stats = stats or {cash = 0, gems = 0},
	}
	local self = setmetatable(data, meta)
	return self
end

function meta:createTag()
	local PlayerTag = ReplicatedStorage.playerTag.PlayerTag:Clone()
	if self.Player.Character then
		self.PlayerTag = PlayerTag
		PlayerTag.Parent = self.Player.Character.Head
	end
end

function meta:updateTag()
	if self.PlayerTag then
		local playerTagFrame = self.PlayerTag.Frame
		playerTagFrame.playerName.Text = self.Player.Name -- for me text will be "fzgamesalt"
		playerTagFrame.cash.Text = string.format("$%d", self.Stats.cash) -- "$0" or $(your data amount)
		playerTagFrame.gems.Text = string.format("$%d", self.Stats.gems) -- "$0" or $(your data amount)
	end
end

function meta:destroyTag()
	if self.PlayerTag then
		self.PlayerTag:Destroy()
	end
end

function meta:init()
	self:createTag()
	self:updateTag()
end

return meta