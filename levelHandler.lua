
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local MapDefs = util.LoadDefDirectory("defs/maps")

local self = {}
local api = {}


function api.LoadLevel(name)
	print("load level")
	local contents = love.filesystem.read("levels/" .. name)
	if not contents then
		EffectsHandler.SpawnEffect("error_popup", {200, 15}, {text = "Level file not found.", velocity = {0, 3}})
		return
	end
	local levelFunc = loadstring("return "..contents)
	if not levelFunc then
		EffectsHandler.SpawnEffect("error_popup", {200, 15}, {text = "Error loading level.", velocity = {0, 3}})
		return
	end
	local success, levelData = pcall(levelFunc)
	if not success then
		EffectsHandler.SpawnEffect("error_popup", {200, 15}, {text = "Level format error.", velocity = {0, 3}})
		return
	end
	
	self.world.LoadLevelByTable(levelData)
end


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

function api.GetLevelHumanName()
	return self.humanName
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

function api.InEditMode()
	return self.editMode
end

function api.KeyPressed(key, scancode, isRepeat)
	if key == "l" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		api.LoadLevel("testLevel")
	end
	if key == "m" and (love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")) then
		self.editMode = not self.editMode
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
end

function api.Initialize(world, levelIndex, mapDataOverride)
	self = {
		world = world,
	}
	
	SetupWorld(levelIndex, mapDataOverride)
end

return api
