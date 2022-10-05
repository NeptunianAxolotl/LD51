
local IterableMap = require("include/IterableMap")
local util = require("include/util")
local Font = require("include/font")

local MapDefs = util.LoadDefDirectory("defs/maps")

local self = {}
local api = {}

function api.Width()
	return self.width
end

function api.Height()
	return self.height
end

function api.TileSize()
	return self.tileSize
end

function api.TileScale()
	return self.tileSize / Global.GRID_SIZE
end

function api.GetVertOffset()
	return self.vertOffset
end

function api.GetBaseCarts()
	return self.baseCarriages
end

function api.GetLevelHumanName()
	return self.humanName
end

function api.IsFinalMap()
	return self.finalLevel
end

function api.TownDrawParams()
	return self.townDrawParams
end

function api.GetOrderMult()
	return self.world.GetOrderMult()
end

function api.GetMapData()
	return self.map
end

function api.LoadLevel(name)
	print("load level")
	local contents = love.filesystem.read("levels/" .. name)
	if not contents then
		EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Level file not found.", velocity = {0, 3}})
		return
	end
	local levelFunc = loadstring("return "..contents)
	if not levelFunc then
		EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Error loading level.", velocity = {0, 3}})
		return
	end
	local success, levelData = pcall(levelFunc)
	if not success then
		EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Level format error.", velocity = {0, 3}})
		return
	end
	
	self.world.LoadLevelByTable(levelData)
	return true
end

function api.SaveLevel(name)
	love.filesystem.createDirectory("levels")
	self.humanName = name
	
	local save = {
		humanName = self.humanName,
		dimensions = {
			width = self.width,
			height = self.height,
			tileSize = self.tileSize,
			vertOffset = self.vertOffset,
		},
		baseCarriages = self.baseCarriages,
	}
	
	EffectsHandler.SpawnEffect("error_popup", {480, 15}, {text = "Level saved to " .. name .. ".", velocity = {0, 3}})
	return true
end

function api.InEditMode()
	return self.editMode
end

function api.IsMenuOpen()
	return self.loadingLevelGetName or self.saveLevelGetName
end

function api.KeyPressed(key, scancode, isRepeat)
	if self.loadingLevelGetName or self.saveLevelGetName then
		if key and string.len(key) == 1 then
			if (love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")) then
				key = string.upper(key)
			end
			self.enteredText = (self.enteredText or "") .. key
		end
		if key == "meta" or key == "space" then
			self.enteredText = (self.enteredText or "") .. " "
		end
		if (key == "delete" or key == "backspace") and self.enteredText and string.len(self.enteredText) > 0 then
			self.enteredText = string.sub(self.enteredText, 0, string.len(self.enteredText) - 1)
		end
		if key == "escape" then
			self.loadingLevelGetName = false
			self.saveLevelGetName = false
		end
		if key == "return" and self.enteredText then
			if self.loadingLevelGetName then
				if api.LoadLevel(self.enteredText) then
					self.loadingLevelGetName = false
				end
			elseif self.saveLevelGetName then
				if api.SaveLevel(self.enteredText) then
					self.saveLevelGetName = false
				end
			end
		end
		return true
	end
	
	if key == "l" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.loadingLevelGetName = true
	end
	if key == "k" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.saveLevelGetName = true
	end
	if key == "j" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.editMode = not self.editMode
	end
end

function api.MousePressed()
	if self.loadingLevelGetName or self.saveLevelGetName then
		return true
	end
end

local function SetupWorld(levelIndex, mapDataOverride)
	if mapDataOverride then
		self.map = mapDataOverride
	else
		self.map = MapDefs[LevelList.levels[levelIndex]]
	end
	
	local map = self.map
	self.mapRules = map.rules
	self.humanName = map.humanName
	self.townDrawParams = map.townDrawParams
	self.width  = map.dimensions.width
	self.height = map.dimensions.height
	self.tileSize = map.dimensions.tileSize
	self.vertOffset = map.dimensions.vertOffset or 0
	self.baseCarriages = map.baseCarriages or 1
	self.finalLevel = map.finalLevel
end

function api.DrawInterface()
	local gameOver, gameWon, gameLost = self.world.GetGameOver()
	local windowX, windowY = love.window.getMode()
	local overX = windowX*0.32
	local overWidth = windowX*0.36
	local overY = windowY*0.3
	local overHeight = windowY*0.4
	
	local drawWindow = self.loadingLevelGetName or self.saveLevelGetName
	if drawWindow then
		love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.8)
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", overX, overY, overWidth, overHeight, 8, 8, 16)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.setLineWidth(10)
		love.graphics.rectangle("line", overX, overY, overWidth, overHeight, 8, 8, 16)
		
	end
	
	if self.loadingLevelGetName then
		Font.SetSize(0)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.printf("Loading Level", overX, overY + overHeight * 0.04, overWidth, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Type level name (Enter accept, ESC cancel)\n" .. (self.enteredText or ""), overX + overWidth*0.05, overY + overHeight * 0.32 , overWidth*0.9, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Loading from " .. (love.filesystem.getSaveDirectory() or "DIR_ERROR") .. "/levels", overX + overWidth*0.05, overY + overHeight * 0.65, overWidth*0.9, "center")

	elseif self.saveLevelGetName then
		Font.SetSize(0)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.printf("Saving Level", overX, overY + overHeight * 0.04, overWidth, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Type level name (Enter accept, ESC cancel)\n" .. (self.enteredText or ""), overX + overWidth*0.05, overY + overHeight * 0.32 , overWidth*0.9, "center")
		
		Font.SetSize(3)
		love.graphics.printf("Saving to " .. (love.filesystem.getSaveDirectory() or "DIR_ERROR") .. "/levels", overX + overWidth*0.05, overY + overHeight * 0.65, overWidth*0.9, "center")
	end
	return drawWindow
end

function api.Initialize(world, levelIndex, mapDataOverride)
	self = {
		world = world,
	}
	
	SetupWorld(levelIndex, mapDataOverride)
end

return api
