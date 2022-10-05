
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
	local wantedCount = math.ceil(prog.count * LevelHandler.GetOrderMult())
	return prog.good, wantedCount, prog.bonus
end

local function DeliverGoods(self, count)
	self.delivered = (self.delivered or 0) + count
	local good, required, bonus = GetWantedGood(self)
	if self.delivered >= required then
		GameHandler.AddBonus(self.worldPos, good)
		self.wantIndex = self.wantIndex + 1
		self.delivered = 0
	end
end

--local goodOffsets = {
--	{-0.3, -1.3},
--	{-0.34, -0.75},
--	{0.08, -0.85},
--	{0.38, -0.77},
--	{0.35, -0.49},
--	{0.06, -0.28},
--	{-0.34, -0.24},
--}

local goodOffsets = {
	{-0.3, -1.3},
	{0, -1.6},
	{0.2, -1.6},
	{0.4, -1.6},
	{0.6, -1.6},
	{0.8, -1.6},
	{1, -1.6},
	{1.2, -1.6},
}

local goodScales = {
	1.6,
	0.78,
	0.78,
	0.78,
	0.78,
	0.78,
	0.78,
	0.78,
	0.78,
	0.78,
}

return {
	stateImage = {"track_town"},
	topImage = "town_over",
	editorWantGoods = true,
	trainMidFunc = function (self, train)
		if not train.GetCarrying() then
			return
		end
		local wanted, totalWanted = GetWantedGood(self)
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
	updateFunc = function (self, dt)
		if GetWantedGood(self) then
			TerrainHandler.NotifyTownMissingGood()
			if self.permanentlyBlocked then
				GameHandler.SetGameOver(false, "town_block")
			end
		end
		if self.permanentlyBlocked then
			self.fireSpawnTimer = (self.fireSpawnTimer or 0) - dt
			if self.fireSpawnTimer <= 0 then
				self.fireSpawnTimer = 0.02 + 0.12 * math.random()
				for i = 1, math.floor(math.random()*3.5) do
					EffectsHandler.SpawnEffect("fire", util.RandomPointInRectangle(
						util.Add(self.worldPos, {0, -0.35* LevelHandler.TileSize()}), LevelHandler.TileSize(), LevelHandler.TileSize()*1.32), 
						{
							scale = (0.7 + 0.3*math.random()) * LevelHandler.TileScale(),
							inFront = 800
						}
					)
				end
			end
		
		end
	end,
	extraDrawFunc = function (self, pos, rotation)
		local wantedGood, totalWanted = GetWantedGood(self)
		if wantedGood then
			TerrainHandler.DrawTownResourceText(pos, (self.delivered or 0), totalWanted)
			local spotIndex = 1
			for i = self.wantIndex, #self.progression do
				if goodOffsets[spotIndex] then
					local scale = (first and 1.5) or 0.65
					local gPos = util.Add(pos, util.Mult(LevelHandler.TileSize(), goodOffsets[spotIndex]))
					Resources.DrawImage(self.progression[i].good .. "_icon", gPos[1], gPos[2], 0, false, goodScales[spotIndex]*LevelHandler.TileScale())
					spotIndex = spotIndex + 1
				end
			end
		else
			Resources.DrawImage("tick_icon", pos[1], pos[2] - 1.1*LevelHandler.TileSize(), 0, false, LevelHandler.TileScale()*0.9)
			
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