
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
	AddTrack({0 + 5, 0 + 7}, "factory", 0)
	AddTrack({1 + 5, 0 + 7}, "straight", 0)
	AddTrack({2 + 5, 0 + 7}, "curve", 1)
	AddTrack({2 + 5, 1 + 7}, "straight", 1)
	AddTrack({2 + 5, 2 + 7}, "split", 0)
	AddTrack({3 + 5, 2 + 7}, "straight", 0)
	AddTrack({4 + 5, 2 + 7}, "straight", 0)
	AddTrack({4 + 5, 2 + 7}, "branch_left", 1)
	AddTrack({4 + 5, 3 + 7}, "curve", 3)
	AddTrack({5 + 5, 3 + 7}, "split", 2)
	AddTrack({5 + 5, 2 + 7}, "straight", 1)
	AddTrack({5 + 5, 1 + 7}, "straight", 1)
	AddTrack({5 + 5, 0 + 7}, "curve", 1)
	AddTrack({4 + 5, 0 + 7}, "curve", 0)
	AddTrack({4 + 5, 1 + 7}, "straight", 1)
	
	AddTrack({5 + 5, 4 + 7}, "signal", 1)
	AddTrack({5 + 5, 5 + 7}, "cross", 1)
	AddTrack({5 + 5, 6 + 7}, "curve", 3)
	AddTrack({6 + 5, 6 + 7}, "curve", 2)
	AddTrack({6 + 5, 5 + 7}, "curve", 1)
	AddTrack({4 + 5, 5 + 7}, "straight", 0)
	AddTrack({3 + 5, 5 + 7}, "straight", 0)
	AddTrack({2 + 5, 5 + 7}, "curve", 3)
	AddTrack({2 + 5, 4 + 7}, "straight", 1)
	AddTrack({2 + 5, 3 + 7}, "straight", 1)
end

function api.GetTrackAtPos(gridPos, addDirection)
	local x, y = gridPos[1], gridPos[2]
	if addDirection == 0 then
		x = x + 1
	elseif addDirection == 1 then
		y = y + 1
	elseif addDirection == 2 then
		x = x - 1
	elseif addDirection == 3 then
		y = y - 1
	end
	if not (self.trackPos[x] and self.trackPos[x][y]) then
		return false
	end
	return IterableMap.Get(self.trackList, self.trackPos[x][y])
end

function api.DestroyTrack(gridPos)
	local track = api.GetTrackAtPos(gridPos)
	track.toDestroy = true -- Only terrainHandler should set this, as it has to remove from the map.
	self.trackPos[gridPos[1]][gridPos[2]] = nil
end

function api.Update(dt)
	IterableMap.ApplySelf(self.trackList, "Update", dt)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.trackList, "Draw", drawQueue)
end

function api.MousePressed(x, y)
	local gx, gy = math.floor(x / Global.GRID_SIZE), math.floor(y / Global.GRID_SIZE)
	if gx < 0 or gy < 0 or gx >= Global.WORLD_WIDTH or gy >= Global.WORLD_HEIGHT then
		return false
	end
	local gridPos = {gx, gy}
	local track = api.GetTrackAtPos(gridPos)
	if track then
		track.MousePressed()
		return true
	end
	local trackType, rotation = ShopHandler.GetHeldTrack()
	if trackType then
		AddTrack(gridPos, trackType, rotation)
		ShopHandler.UseHeldTrack()
	end
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
