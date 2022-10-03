
local Font = require("include/font")
local util = require("include/util")

local function GetWantedGood(self)
	if not self.wantIndex then
		self.wantIndex = 1
	end
	if not (self.progression and self.progression[self.wantIndex]) then
		return false
	end
	local prog = self.progression[self.wantIndex]
	return prog.good, prog.count, prog.bonus
end

local function DeliverGoods(self, count)
	self.delivered = (self.delivered or 0) + count
	local _, required, bonus = GetWantedGood(self)
	if self.delivered >= required then
		if bonus then
			GameHandler.AddBonus(self.worldPos, bonus[1], bonus[2])
		end
		self.wantIndex = self.wantIndex + 1
		self.delivered = 0
	end
end

return {
	stateImage = {"track_town"},
	topImage = "town_over",
	trainMidFunc = function (self, train)
		if not train.GetCarrying() then
			return
		end
		local wanted, remaining = GetWantedGood(self)
		if wanted ~= train.GetCarrying() then
			return
		end
		DeliverGoods(self, train.cartCount)
		train.SetCarrying(false)
	end,
	trainSlowFunc = function (self, train)
		local wanted = GetWantedGood(self)
		if not wanted then
			return false
		end
		return train.GetCarrying() == wanted
	end,
	extraDrawFunc = function (self, pos, rotation)
		Font.SetSize(3)
		love.graphics.setColor(0, 0, 0, 1)
		local wanted, remaining = GetWantedGood(self)
		if wanted then
			love.graphics.print(wanted, pos[1] - 0.3*Global.GRID_SIZE, pos[2] - 1.18*Global.GRID_SIZE)
			love.graphics.print(remaining - (self.delivered or 0), pos[1] - 0.3*Global.GRID_SIZE, pos[2] - 0.9*Global.GRID_SIZE)
		end
	end,
	nearbyBlocked = {
		{0, -1},
	},
	paths = {
		{
			posFunc = function (t)
				return {0.5 - t, 0}
			end,
			dirFunc = function (t)
				return math.pi
			end,
			entry = 0,
			destination = 2,
		},
		{
			posFunc = function (t)
				return {t - 0.5, 0}
			end,
			dirFunc = function (t)
				return 0
			end,
			entry = 2,
			destination = 0,
		},
	},
}