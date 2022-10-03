
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
	--self.menuOpen = not self.menuOpen
	--self.world.SetMenuState(self.menuOpen)
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

function api.GetTimeRemaining()
	return self.gameTime
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.KeyPressed(key, scancode, isRepeat)
	if not self.timeGameOver then
		return false
	end
	if key == "c" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.timeGameOver = false
		self.endless = true
		self.gameTime = Global.GAME_TIME
		self.world.SetPaused(false, false)
	end
end

function api.Update(dt)
	api.UpdateShow("food", dt, (InterfaceUtil.GetRawNumber("food") > 0 or self.orderSize > Global.ORDER_SIZE))
	api.UpdateShow("wood", dt, (InterfaceUtil.GetRawNumber("wood") > 0 or self.speedMult > 1))
	api.UpdateShow("ore", dt, (InterfaceUtil.GetRawNumber("ore") > 0 or self.bonusCarts > 0))
	api.UpdateShow("foodBonus", dt, (self.orderSize > Global.ORDER_SIZE))
	api.UpdateShow("woodBonus", dt, (self.speedMult > 1))
	api.UpdateShow("oreBonus", dt, (self.bonusCarts > 0))
	
	if self.endless then
		self.gameTime = self.gameTime + dt
	else
		if self.gameTime > 0 then
			self.gameTime = self.gameTime - dt
			if self.gameTime < 0 then
				self.world.SetPaused(true, true)
				InterfaceUtil.ForceUpdataAllNumbers()
				self.timeGameOver = true
				self.gameTime = 0
			end
		end
	end
end

function api.DrawInterface()
	local windowX, windowY = love.window.getMode()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()
	if gameOver then
		Font.SetSize(0)
		love.graphics.setColor(0.9, 0, 0, 1)
		love.graphics.printf("Game Over", windowX*0.5 - 750, windowY*0.5 - 20, 1500, "center")
		
		Font.SetSize(2)
		love.graphics.printf("The factory is blocked", windowX*0.5 - 750, windowY*0.5 + 55, 1500, "center")
		love.graphics.printf("Press 'Ctrl+R' to restart", windowX*0.5 - 750, windowY*0.5 + 95, 1500, "center")
		love.graphics.printf("Final Score: " .. InterfaceUtil.Round(InterfaceUtil.GetRawNumber("score")), windowX*0.5 - 750, windowY*0.5 + 135, 1500, "center")
	elseif self.timeGameOver then
		Font.SetSize(0)
		love.graphics.setColor(0.9, 0, 0, 1)
		love.graphics.printf("The Factory Survived", windowX*0.5 - 750, windowY*0.5 - 20, 1500, "center")
		
		Font.SetSize(2)
		love.graphics.printf("Press 'Ctrl+N' for the next level", windowX*0.5 - 750, windowY*0.5 + 55, 1500, "center")
		love.graphics.printf("Press 'Ctrl+C' for endless", windowX*0.5 - 750, windowY*0.5 + 95, 1500, "center")
		love.graphics.printf("Final Score: " .. InterfaceUtil.Round(InterfaceUtil.GetRawNumber("score")), windowX*0.5 - 750, windowY*0.5 + 135, 1500, "center")
		
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
		gameTime = Global.GAME_TIME,
		scoreSource = {
			travelScore = 0,
			deliverScore = 0,
			deliverBonusScore = 0,
			tickTrack = 0,
			deliverTrack = 0,
		}
	}
	InterfaceUtil.RegisterSmoothNumber("score", 0, 2)
	InterfaceUtil.RegisterSmoothNumber("food", 0, 1.4, Global.BONUS_REQ)
	InterfaceUtil.RegisterSmoothNumber("wood", 0, 1.4, Global.BONUS_REQ)
	InterfaceUtil.RegisterSmoothNumber("ore",  0, 1.4, Global.BONUS_REQ)
end

return api
