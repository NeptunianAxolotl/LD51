
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local NewTrack = require("objects/track")

local self = {}
local api = {}

local function AddTrack(pos, trackType, rotation)
	local x, y = pos[1], pos[2]
	self.trackPos[x] = self.trackPos[x] or {}
	if self.trackPos[x][y] then
		IterableMap.Remove(self.trackList, self.trackPos[x][y])
	end
	trackData = {
		pos = pos,
		trackType = trackType,
		rotation = rotation,
	}
	self.trackPos[x][y] = IterableMap.Add(self.trackList, NewTrack(trackData, api))
end

local function SetupWorld(width, height)
	AddTrack({0, 0}, "straight", 0)
	AddTrack({1, 0}, "straight", 0)
	AddTrack({2, 0}, "curve", 1)
	AddTrack({2, 1}, "straight", 1)
	AddTrack({2, 2}, "curve", 3)
	AddTrack({3, 2}, "straight", 0)
	AddTrack({4, 2}, "straight", 0)
	AddTrack({4, 2}, "curve", 1)
end

function api.Update(world)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.trackList, "Draw", drawQueue)
end

function api.Initialize(world)
	self = {
		trackList = IterableMap.New(),
		trackPos = {},
		world = world,
	}
	
	SetupWorld(Global.WORLD_WIDTH, Global.WORLD_HEIGHT)
	
	--for name in pairs(FeatureDefs) do
	--	print([[	"]] .. name .. [[",]])
	--end
end

return api
