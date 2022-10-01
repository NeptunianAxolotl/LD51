
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local NewTrack = require("objects/track")

local self = {}
local api = {}

local function InitializeTiles(width, height)
	trackMap = IterableMap.New()
	trackData = {
		pos = {0, 0},
		trackType = "straight",
		rotation = 0,
	}
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	trackData = {
		pos = {1, 0},
		trackType = "straight",
		rotation = 0,
	}
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	trackData = {
		pos = {2, 0},
		trackType = "curve",
		rotation = 2,
	}
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	trackData = {
		pos = {2, 1},
		trackType = "straight",
		rotation = 1,
	}
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	trackData = {
		pos = {2, 2},
		trackType = "curve",
		rotation = 0,
	}
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	trackData = {
		pos = {3, 2},
		trackType = "straight",
		rotation = 0,
	}
	IterableMap.Add(trackMap, NewTrack(trackData, api))
	
	return trackMap
end

function api.Update(world)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(trackMap, "Draw", drawQueue)
end

function api.Initialize(world)
	self = {
		trackMap = InitializeTiles(Global.WORLD_WIDTH, Global.WORLD_HEIGHT),
		world = world,
	}
	
	--for name in pairs(FeatureDefs) do
	--	print([[	"]] .. name .. [[",]])
	--end
end

return api
