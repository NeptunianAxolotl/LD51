
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local DoodadDefs = util.LoadDefDirectory("defs/doodads")
local MapDefs = util.LoadDefDirectory("defs/maps")
local NewDoodad = require("objects/doodad")

local self = {}
local api = {}

function api.AddDoodad(pos, doodadType)
	local def = DoodadDefs[trackType]
	local doodadData = {}
	doodadData.pos = pos
	doodadData.doodadType = doodadType
	IterableMap.Add(self.doodadList, NewDoodad(doodadData, api))
end

local function SetupWorld(mapName)
	map = MapDefs[mapName]
	
	self.width  = map.dimensions.width
	self.height = map.dimensions.height
	self.tileSize = map.dimensions.tileSize
	self.gridOffset = map.gridOffset or 0
	
	if map.doodads then
		for i = 1, #map.doodads do
			local doodad = map.doodads[i]
			api.AddDoodad(doodad.pos, doodad.doodadType)
		end
	end
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.doodadList, "Draw", drawQueue)
end

function api.Initialize(world)
	self = {
		doodadList = IterableMap.New(),
		world = world,
	}
	
	SetupWorld(self.world.GetMapName())
end

return api
