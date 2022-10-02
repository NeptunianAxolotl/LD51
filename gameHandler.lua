
local util = require("include/util")
local Font = require("include/font")

local EffectsHandler = require("effectsHandler")
local Resources = require("resourceHandler")
MusicHandler = require("musicHandler")

local self = {}
local api = {}

local smoothNumberList = {
	{
		name = "score",
	},
}

--------------------------------------------------
-- Updating
--------------------------------------------------

--------------------------------------------------
-- API
--------------------------------------------------

function api.DepositGoods(good, number)
	InterfaceUtil.AddNumber(good, number)
	self.deliveries = self.deliveries + 1
	if self.deliveries >= Global.DELIVERY_PER_TRACK then
		ShopHandler.AddTrackCredits(1, "deliverTrack")
		self.deliveries = 0
	end
end

function api.AddScore(value, source)
	if self.world.GetGameOver() then
		return false
	end
	local oldScore = InterfaceUtil.GetRawNumber("score", value)
	InterfaceUtil.AddNumber("score", value)
	self.scoreSource[source] = self.scoreSource[source] + value
end

function api.AddSourceScore(value, source)
	self.scoreSource[source] = self.scoreSource[source] + value
end

function api.GetScore()
	return InterfaceUtil.GetNumber("score")
end

function api.SetGameOver(hasWon, overType)
	self.world.SetGameOver(hasWon, overType)
end

function api.GetGameOver()
	return self.world.GetGameOver()
end

function api.ToggleMenu()
	self.menuOpen = not self.menuOpen
	world.SetMenuState(self.menuOpen)
end

function api.MousePressed(x, y)
	local windowX, windowY = love.window.getMode()
	local drawPos = world.ScreenToInterface({windowX, 0})
end

function api.GetViewRestriction()
	local pointsToView = {{0, 0}, {800, 800}}
	return pointsToView
end

function api.ReportOnRecord(name, newRecord, oldRecord)
	--if name == "score" then
	--	if math.floor(oldRecord/Global.SCORE_CREDIT_REQ) ~= math.floor(newRecord/Global.SCORE_CREDIT_REQ) then
	--		ShopHandler.AddTrackCredits(math.floor(newRecord/Global.SCORE_CREDIT_REQ) - math.floor(oldRecord/Global.SCORE_CREDIT_REQ))
	--	end
	--end
end

function api.ReportOnWrap(name, prevWrap)
	if name == "food" then
		self.orderSize = self.orderSize + Global.ORDER_SIZE_INC
	elseif name == "wood" then
		self.speedMult = self.speedMult + 0.1
	elseif name == "ore" then
		self.bonusCarts = self.bonusCarts + 1
	end
	return prevWrap + Global.BONUS_REQ_INC
end

function api.GetOrderSize()
	return self.orderSize
end

function api.GetSpeedMult()
	return self.speedMult
end

function api.GetCartBonus()
	return self.bonusCarts
end

function api.GetShowOffset(name)
	local xOffset = -200 * (1 - self[name .. "BonusShow"])
	local yOffset = 200 * (1 - self[name .. "Show"])
	return (self[name .. "BonusShow"] > 0) and xOffset, (self[name .. "Show"] > 0) and yOffset
end

function api.UpdateShow(name, dt, condition)
	if condition and self[name .. "Show"] < 1 then
		self[name .. "Show"] = util.SmoothZeroToOne(self[name .. "Show"] + dt, 1)
		if self[name .. "Show"] > 1 then
			self[name .. "Show"] = 1
		end
	end
end

function api.DrawScoreSource(source, offset)
	Font.SetSize(2)
	love.graphics.setColor(0, 0, 0, 0.8)
	love.graphics.print(source .. ": " .. self.scoreSource[source], 12, offset)
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.Update(dt)
	api.UpdateShow("food", dt, (InterfaceUtil.GetRawNumber("food") > 0 or self.orderSize > Global.ORDER_SIZE))
	api.UpdateShow("wood", dt, (InterfaceUtil.GetRawNumber("wood") > 0 or self.speedMult > 1))
	api.UpdateShow("ore", dt, (InterfaceUtil.GetRawNumber("ore") > 0 or self.bonusCarts > 0))
	api.UpdateShow("foodBonus", dt, (self.orderSize > Global.ORDER_SIZE))
	api.UpdateShow("woodBonus", dt, (self.speedMult > 1))
	api.UpdateShow("oreBonus", dt, (self.bonusCarts > 0))
end

function api.DrawInterface()
	local windowX, windowY = love.window.getMode()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()
	if gameLost then
		Font.SetSize(0)
		love.graphics.setColor(0.9, 0, 0, 1)
		love.graphics.print("Game Over", windowX*0.5 - 120, windowY*0.5 - 20)
		
		Font.SetSize(2)
		love.graphics.print("The factory is blocked", windowX*0.5 - 120, windowY*0.5 + 45)
	end
end

function api.Initialize(world)
	self = {
		world = world,
		score = 0,
		orderSize = Global.ORDER_SIZE,
		speedMult = 1,
		bonusCarts = 0,
		foodShow = 0,
		woodShow = 0,
		oreShow = 0,
		foodBonusShow = 0,
		woodBonusShow = 0,
		oreBonusShow = 0,
		deliveries = 0,
		scoreSource = {
			travelScore = 0,
			deliverScore = 0,
			deliverBonusScore = 0,
			tickTrack = 0,
			deliverTrack = 0,
		}
	}
	InterfaceUtil.RegisterSmoothNumber("score", 0, 3)
	InterfaceUtil.RegisterSmoothNumber("food", 0, 1.4, Global.BONUS_REQ)
	InterfaceUtil.RegisterSmoothNumber("wood", 0, 1.4, Global.BONUS_REQ)
	InterfaceUtil.RegisterSmoothNumber("ore",  0, 1.4, Global.BONUS_REQ)
end

return api
