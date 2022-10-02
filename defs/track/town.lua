
local Font = require("include/font")
local util = require("include/util")

local function GetNextPriority(self)
	self.priorityGoodIndex = (self.priorityGoodIndex or 0) + 1
	if self.priorityGoodIndex > #self.wantedGoodList then
		util.Permute(self.wantedGoodList)
		self.priorityGoodIndex = 1
		while #self.wantedGoodList > 1 and self.priorityGood == self.wantedGoodList[1] do
			util.Permute(self.wantedGoodList)
		end
	end
	self.priorityGood = self.wantedGoodList[self.priorityGoodIndex]
	self.priorityRemaining = GameHandler.GetOrderSize()
end

local function CheckPriorityGoodInit(self)
	if not self.wantedGoodList then
		self.wantedGoodList = {"food", "wood", "ore"}
	end
	if not self.priorityGood then
		self.priorityGoodIndex = #self.wantedGoodList
		GetNextPriority(self)
	end
	self.priorityRemaining = (self.priorityRemaining or GameHandler.GetOrderSize())
end

local function DepositGoods(self, good, count)
	CheckPriorityGoodInit(self)
	
	local scoreOut = count * ((good == self.priorityGood and Global.PRIORITY_DELIVER_SCORE) or Global.BASE_DELIVER_SCORE)
	local isPriority = (good == self.priorityGood)
	if good == self.priorityGood then
		self.priorityRemaining = self.priorityRemaining - count
	end
	if self.priorityRemaining <= 0 then
		GetNextPriority(self)
	end
	return scoreOut, isPriority
end

return {
	stateImage = {"track_town"},
	topImage = "town_over",
	shopSlot = false,
	trainMidFunc = function (self, train)
		if not train.GetCarrying() then
			return
		end
		local good = train.GetCarrying()
		local score, isPriority = DepositGoods(self, good, train.cartCount)
		if not GameHandler.GetGameOver() then
			GameHandler.DepositGoods(good, train.cartCount)
			GameHandler.AddScore(score, (isPriority and "deliverBonusScore") or "deliverScore")
		end
		train.SetCarrying(false)
	end,
	extraDrawFunc = function (self, pos, rotation)
		CheckPriorityGoodInit(self)
		Font.SetSize(3)
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.print(self.priorityGood, pos[1] - 0.3*Global.GRID_SIZE, pos[2] - 1.18*Global.GRID_SIZE)
		love.graphics.print(self.priorityRemaining, pos[1] - 0.3*Global.GRID_SIZE, pos[2] - 0.9*Global.GRID_SIZE)
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