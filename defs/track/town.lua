
local Font = require("include/font")

local function GetTypeOrder(recieved)
	-- Ties are broken: food, wood, ore
	if recieved.food >= recieved.wood then
		if recieved.wood >= recieved.ore then
			return "food", recieved.food, "wood", recieved.wood, "ore", recieved.ore
		elseif recieved.food >= recieved.ore then
			return "food", recieved.food, "ore", recieved.ore, "wood", recieved.wood
		else
			return "ore", recieved.ore, "food", recieved.food, "wood", recieved.wood
		end
	else
		if recieved.food >= recieved.ore then
			return "wood", recieved.wood, "food", recieved.food, "ore", recieved.ore
		elseif recieved.wood >= recieved.ore then
			return "wood", recieved.wood, "ore", recieved.ore, "food", recieved.food
		else
			return "ore", recieved.ore, "wood", recieved.wood, "food", recieved.food
		end
	end
end

local function DepositGood(self, good)
	self.prices = self.prices or {wood = Global.BASE_DELIVER_SCORE, food = Global.BASE_DELIVER_SCORE, ore = Global.BASE_DELIVER_SCORE}
	self.recieved = self.recieved or {wood = 0, food = 0, ore = 0}
	
	self.recieved[good] = self.recieved[good] + 1
	local scoreOut = self.prices[good]
	if self.recieved.wood + self.recieved.food + self.recieved.ore >= Global.DELIVER_THRESHOLD then
		local hG, hN, mG, mN, lG, lN = GetTypeOrder(self.recieved)
		if hN >= Global.DELIVER_THRESHOLD * 0.6 then
			if self.prices[hG] > Global.DELIVER_MIN then
				self.prices[hG] = self.prices[hG] - Global.DELIVER_INC
				self.prices[lG] = self.prices[lG] + Global.DELIVER_INC
				if self.prices[hG] > Global.DELIVER_MIN then
					self.prices[hG] = self.prices[hG] - Global.DELIVER_INC
					self.prices[mG] = self.prices[mG] + Global.DELIVER_INC
				end
			end
		elseif hN >= Global.DELIVER_THRESHOLD * 0.45 then
			if self.prices[hG] > Global.DELIVER_MIN then
				self.prices[hG] = self.prices[hG] - Global.DELIVER_INC
				self.prices[lG] = self.prices[lG] + Global.DELIVER_INC
			end
		elseif lN <= Global.DELIVER_THRESHOLD * 0.25 then
			if self.prices[lN] < Global.DELIVER_MAX then
				self.prices[hG] = self.prices[hG] - Global.DELIVER_INC
				self.prices[lG] = self.prices[lG] + Global.DELIVER_INC
			end
		elseif lN <= Global.DELIVER_THRESHOLD * 0.1 then
			if self.prices[lN] < Global.DELIVER_MAX then
				self.prices[hG] = self.prices[hG] - Global.DELIVER_INC
				self.prices[lG] = self.prices[lG] + Global.DELIVER_INC
				if self.prices[lN] < Global.DELIVER_MAX then
					self.prices[mG] = self.prices[mG] - Global.DELIVER_INC
					self.prices[lG] = self.prices[lG] + Global.DELIVER_INC
				end
			end
		end
		self.recieved.food = 0
		self.recieved.wood = 0
		self.recieved.ore = 0
	end
	
	return scoreOut
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
		local score = 0
		for i = 1, train.def.cartCount do
			score = score + DepositGood(self, good)
		end
		GameHandler.AddScore(score)
		train.SetCarrying(false)
	end,
	extraDrawFunc = function (self, pos, rotation)
		Font.SetSize(3)
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.print((self.prices and self.prices.food) or Global.BASE_DELIVER_SCORE, pos[1] - 0*Global.GRID_SIZE, pos[2] - 1.32*Global.GRID_SIZE)
		love.graphics.print((self.prices and self.prices.wood) or Global.BASE_DELIVER_SCORE, pos[1] - 0*Global.GRID_SIZE, pos[2] - 1.09*Global.GRID_SIZE)
		love.graphics.print((self.prices and self.prices.ore) or Global.BASE_DELIVER_SCORE, pos[1] - 0*Global.GRID_SIZE, pos[2] - 0.86*Global.GRID_SIZE)
	end,
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