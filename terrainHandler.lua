
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local TrackDefs = util.LoadDefDirectory("defs/track")
local NewTrack = require("objects/track")

local self = {}
local api = {}

local function SetUneditable(x, y)
	self.uneditable[x] = self.uneditable[x] or {}
	self.uneditable[x][y] = true
end

function api.AddTrack(pos, trackType, rotation)
	local x, y = pos[1], pos[2]
	self.trackPos[x] = self.trackPos[x] or {}
	if self.trackPos[x][y] then
		IterableMap.Remove(self.trackList, self.trackPos[x][y])
	end
	local def = TrackDefs[trackType]
	trackData = {
		pos = pos,
		trackType = trackType,
		rotation = rotation,
	}
	if not def.pickupable then
		SetUneditable(x, y)
		if def.nearbyBlocked then
			for i = 1, #def.nearbyBlocked do
				SetUneditable(x + def.nearbyBlocked[i][1], y + def.nearbyBlocked[i][2])
			end
		end
	end
	self.trackPos[x][y] = IterableMap.Add(self.trackList, NewTrack(trackData, api))
end

local function SetupWorld(width, height)
	api.AddTrack({0 + 5, 0 + 7}, "factory", 0)
	api.AddTrack({1 + 5, 0 + 7}, "straight", 0)
	api.AddTrack({2 + 5, 0 + 7}, "split", 2)
	api.AddTrack({2 + 5, 1 + 7}, "straight", 1)
	api.AddTrack({2 + 5, 2 + 7}, "split", 0)
	api.AddTrack({3 + 5, 2 + 7}, "straight", 0)
	api.AddTrack({4 + 5, 2 + 7}, "straight", 0)
	api.AddTrack({4 + 5, 2 + 7}, "branch_left", 1)
	api.AddTrack({4 + 5, 3 + 7}, "curve", 3)
	api.AddTrack({5 + 5, 3 + 7}, "split", 2)
	api.AddTrack({5 + 5, 2 + 7}, "straight", 1)
	api.AddTrack({5 + 5, 1 + 7}, "straight", 1)
	api.AddTrack({5 + 5, 0 + 7}, "curve", 1)
	api.AddTrack({4 + 5, 0 + 7}, "curve", 0)
	api.AddTrack({4 + 5, 1 + 7}, "straight", 1)
	
	api.AddTrack({2 + 5, -1 + 7}, "curve", 0)
	api.AddTrack({3 + 5, -1 + 7}, "straight", 0)
	api.AddTrack({4 + 5, -1 + 7}, "sawmill", 0)
	api.AddTrack({5 + 5, -1 + 7}, "straight", 0)
	api.AddTrack({6 + 5, -1 + 7}, "town", 0)
	api.AddTrack({7 + 5, -1 + 7}, "straight", 0)
	api.AddTrack({8 + 5, -1 + 7}, "farm", 0)
	api.AddTrack({9 + 5, -1 + 7}, "straight", 0)
	api.AddTrack({10+ 5, -1 + 7}, "mine", 0)
	api.AddTrack({11+ 5, -1 + 7}, "straight", 0)
	
	api.AddTrack({5 + 5, 4 + 7}, "signal", 1)
	api.AddTrack({5 + 5, 5 + 7}, "cross", 1)
	api.AddTrack({5 + 5, 6 + 7}, "curve", 3)
	api.AddTrack({6 + 5, 6 + 7}, "curve", 2)
	api.AddTrack({6 + 5, 5 + 7}, "curve", 1)
	api.AddTrack({4 + 5, 5 + 7}, "town", 0)
	api.AddTrack({3 + 5, 5 + 7}, "straight", 0)
	api.AddTrack({2 + 5, 5 + 7}, "curve", 3)
	api.AddTrack({2 + 5, 4 + 7}, "straight", 1)
	api.AddTrack({2 + 5, 3 + 7}, "straight", 1)
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

function api.GetValidPlacement(pos, alwaysReturn)
	local gx, gy = math.floor(pos[1] / Global.GRID_SIZE), math.floor(pos[2] / Global.GRID_SIZE)
	if (gx < 0 or gy < 0 or gx >= Global.WORLD_WIDTH or gy >= Global.WORLD_HEIGHT) then
		return false
	end
	if (self.uneditable[gx] and self.uneditable[gx][gy]) then
		if alwaysReturn then
			return {gx, gy}, true
		end
		return false
	end
	return {gx, gy}
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

function api.MousePressed(x, y, button)
	if button ~= 1 then
		return false
	end
	local gridPos, blocked = api.GetValidPlacement({x, y}, true)
	local track = api.GetTrackAtPos(gridPos)
	if track then
		track.MousePressed()
		return true
	end
	if not blocked then
		local trackType, rotation = ShopHandler.GetHeldTrack()
		if trackType then
			api.AddTrack(gridPos, trackType, rotation)
			ShopHandler.UseHeldTrack()
		end
	end
end

function api.Initialize(world)
	self = {
		trackList = IterableMap.New(),
		trackPos = {},
		uneditable = {},
		world = world,
	}
	
	SetupWorld(Global.WORLD_WIDTH, Global.WORLD_HEIGHT)
	
	--for name in pairs(FeatureDefs) do
	--	print([[	"]] .. name .. [[",]])
	--end
end

return api
