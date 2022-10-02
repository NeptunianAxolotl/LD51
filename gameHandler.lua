
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
end

function api.AddScore(value)
	if self.world.GetGameOver() then
		return false
	end
	local oldScore = InterfaceUtil.GetRawNumber("score", value)
	InterfaceUtil.AddNumber("score", value)
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
	if name == "score" then
		if math.floor(oldRecord/Global.SCORE_CREDIT_REQ) ~= math.floor(newRecord/Global.SCORE_CREDIT_REQ) then
			ShopHandler.AddTrackCredits(math.floor(newRecord/Global.SCORE_CREDIT_REQ) - math.floor(oldRecord/Global.SCORE_CREDIT_REQ))
		end
	end
end

function api.ReportOnWrap(name, prevWrap)
	if name == "food" then
		self.deliverMult = self.deliverMult + 0.1
	elseif name == "wood" then
		self.speedMult = self.speedMult + 0.1
	elseif name == "ore" then
		self.bonusCarts = self.bonusCarts + 1
	end
	return prevWrap + Global.BONUS_REQ_INC
end

function api.GetDeliverMult()
	return self.deliverMult
end

function api.GetSpeedMult()
	return self.speedMult
end

function api.GetCartBonus()
	return self.bonusCarts
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.Update(dt)
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
		deliverMult = 1,
		speedMult = 1,
		bonusCarts = 0,
	}
	InterfaceUtil.RegisterSmoothNumber("score", 0, 3)
	InterfaceUtil.RegisterSmoothNumber("food", 0, 1.4, Global.BONUS_REQ)
	InterfaceUtil.RegisterSmoothNumber("wood", 0, 1.4, Global.BONUS_REQ)
	InterfaceUtil.RegisterSmoothNumber("ore",  0, 1.4, Global.BONUS_REQ)
end

return api
