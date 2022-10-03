
local util = require("include/util")
local Font = require("include/font")

local EffectsHandler = require("effectsHandler")
local Resources = require("resourceHandler")
local MapDefs = util.LoadDefDirectory("defs/maps")
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

function api.AddBonus(pos, name)
	if name == "wood" then
		local magnitude = 0.25
		self.speedMult = self.speedMult + magnitude
		EffectsHandler.SpawnEffect("mult_popup", util.Add(pos, {0, -20}), {text = "+Train Speed", inFront = 700, velocity = {0, -1}})
	end
	if name == "ore" then
		self.bonusCarts = self.bonusCarts + 1
		EffectsHandler.SpawnEffect("mult_popup", util.Add(pos, {0, -20}), {text = "+Carriage", inFront = 700, velocity = {0, -1}})
	
	end
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.KeyPressed(key, scancode, isRepeat)
end

function api.Update(dt)
	if self.world.GetGameOver() or self.world.GetPaused() then
		self.levelAlpha = math.min(1, self.levelAlpha + dt*1.9)
	else
		self.levelAlpha = 0
	end
end

function api.DrawInterface()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()
	local windowX, windowY = love.window.getMode()
	local overX = windowX*0.32
	local overWidth = windowX*0.36
	local overY = windowY*0.3
	local overHeight = windowY*0.4
	if gameLost then
		love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.8*self.levelAlpha)
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", overX, overY, overWidth, overHeight, 8, 8, 16)
		love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("line", overX, overY, overWidth, overHeight, 8, 8, 16)
		
		Font.SetSize(0)
		love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
		love.graphics.printf("Blockage!", overX, overY + overHeight * 0.04, overWidth, "center")
		
		Font.SetSize(2)
		love.graphics.printf("A blocked portal caused all the trains to explode.", overX + overWidth*0.12, overY + overHeight * 0.3 , overWidth*0.76, "left")
		love.graphics.printf("Press 'ctrl+r' to retry the level", overX, overY + overHeight * 0.72, overWidth, "center")
	elseif gameWon then
		love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.8*self.levelAlpha)
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", overX, overY, overWidth, overHeight, 8, 8, 16)
		love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("line", overX, overY, overWidth, overHeight, 8, 8, 16)
		
		if map.finalLevel then
			Font.SetSize(0)
			love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
			love.graphics.printf("Success!", overX, overY + overHeight * 0.04, overWidth, "center")
			
			Font.SetSize(2)
			love.graphics.printf("All deliveries were fulfilled, and this is the final level.", overX + overWidth*0.12, overY + overHeight * 0.3 , overWidth*0.76, "center")
			love.graphics.printf("Press 'ctrl+p' for the previous level.\nThanks for playing!", overX, overY + overHeight * 0.68, overWidth, "center")
		else
			Font.SetSize(0)
			love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
			love.graphics.printf("Success!", overX, overY + overHeight * 0.04, overWidth, "center")
			
			Font.SetSize(2)
			love.graphics.printf("All deliveries were fulfilled.", overX + overWidth*0.12, overY + overHeight * 0.3 , overWidth*0.76, "center")
			love.graphics.printf("Press 'ctrl+r' for the next level.", overX, overY + overHeight * 0.68, overWidth, "center")
		end
	elseif self.world.GetPaused() then
		love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.8*self.levelAlpha)
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", overX, overY, overWidth, overHeight, 8, 8, 16)
		love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("line", overX, overY, overWidth, overHeight, 8, 8, 16)
		
		Font.SetSize(0)
		love.graphics.setColor(0, 0, 0, 0.8*self.levelAlpha)
		love.graphics.printf("Paused", overX, overY + overHeight * 0.04, overWidth, "center")
		
		Font.SetSize(2)
		love.graphics.printf("'p' to unpause\n'ctrl+m' to toggle music.\n'ctrl+r' to restart\n'ctrl+n' for next level.\n'ctrl+p.' for last level.", overX + overWidth*0.12, overY + overHeight * 0.3 , overWidth*0.76, "center")
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
		levelAlpha = 0,
		gameTime = Global.GAME_TIME,
		map = MapDefs[world.GetMapName()],
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
