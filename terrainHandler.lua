
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local TrackDefs = util.LoadDefDirectory("defs/track")
local MapDefs = util.LoadDefDirectory("defs/maps")
local NewTrack = require("objects/track")

local self = {}
local api = {}

function api.SetUneditable(x, y)
	self.uneditable[x] = self.uneditable[x] or {}
	self.uneditable[x][y] = true
end

function api.AddTrack(pos, trackType, rotation, setData)
	local x, y = pos[1], pos[2]
	self.trackPos[x] = self.trackPos[x] or {}
	if self.trackPos[x][y] then
		IterableMap.Remove(self.trackList, self.trackPos[x][y])
	end
	local def = TrackDefs[trackType]
	local trackData = (setData and util.CopyTable(setData)) or {}
	trackData.pos = pos
	trackData.trackType = trackType
	trackData.rotation = rotation
	
	if not def.pickupable then
		api.SetUneditable(x, y)
		if def.nearbyBlocked then
			for i = 1, #def.nearbyBlocked do
				api.SetUneditable(x + def.nearbyBlocked[i][1], y + def.nearbyBlocked[i][2])
			end
		end
	end
	self.trackPos[x][y] = IterableMap.Add(self.trackList, NewTrack(trackData, api))
end

local function SetupWorld(mapName, width, height)
	map = MapDefs[mapName]
	for i = 1, #map.track do
		local track = map.track[i]
		api.AddTrack(track.pos, track.trackType, track.rot, track.setData)
	end
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

function api.GetValidGridPlacement(gridPos, alwaysReturn, addDirection)
	local gx, gy = gridPos[1], gridPos[2]
	if addDirection == 0 then
		gx = gx + 1
	elseif addDirection == 1 then
		gy = gy + 1
	elseif addDirection == 2 then
		gx = gx - 1
	elseif addDirection == 3 then
		gy = gy - 1
	end
	if (gx < 0 or gy < 0 or gx >= Global.WORLD_WIDTH or gy >= Global.WORLD_HEIGHT) then
		if alwaysReturn then
			return {gx, gy}, true
		end
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

function api.GetValidPlacement(pos, alwaysReturn, addDirection)
	local gx, gy = math.floor(pos[1] / Global.GRID_SIZE), math.floor(pos[2] / Global.GRID_SIZE)
	return api.GetValidGridPlacement({gx, gy}, alwaysReturn, addDirection)
end

function api.IsExitPermanentlyBlocked(pos, destination)
	local gridPos, blocked = api.GetValidGridPlacement(pos, true, destination)
	if not blocked then
		return false -- Facing into a tile that can be edited.
	end
	local track = api.GetTrackAtPos(gridPos)
	if not track then
		return true -- Facing into an uneditable non-track piece.
	end
	local entry = (destination + 2)%4
	if track.GetPathAndNextTrack(entry, false, true) then
		return false -- Uneditable track has an entry for this destination
	end
	return true
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
	if not gridPos then
		return false
	end
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
	
	SetupWorld("map2", Global.WORLD_WIDTH, Global.WORLD_HEIGHT)
end

return api
