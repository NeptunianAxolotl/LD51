
local IterableMap = require("include/IterableMap")
local util = require("include/util")
local Font = require("include/font")

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
	self.isPreLevel = false
	
	if not def.removable then
		api.SetUneditable(x, y)
		if def.nearbyBlocked then
			for i = 1, #def.nearbyBlocked do
				api.SetUneditable(x + def.nearbyBlocked[i][1], y + def.nearbyBlocked[i][2])
			end
		end
	end
	self.trackPos[x][y] = IterableMap.Add(self.trackList, NewTrack(trackData, api))
end

local function SetupWorld()
	local map = MapDefs[self.world.GetMapName()]
	
	self.mapRules = map.rules
	self.humanName = map.humanName
	self.townDrawParams = map.townDrawParams
	self.width  = map.dimensions.width
	self.height = map.dimensions.height
	self.tileSize = map.dimensions.tileSize
	self.vertOffset = map.dimensions.vertOffset or 0
	
	for i = 1, #map.track do
		local track = map.track[i]
		api.AddTrack(track.pos, track.trackType, track.rot, track.setData)
	end
	self.isPreLevel = not (self.mapRules and self.mapRules.immediateMusic)
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
	if (gx < 0 or gy < 0 or gx >= self.width or gy >= self.height) then
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
	local gx, gy = math.floor(pos[1] / self.tileSize), math.floor(pos[2] / self.tileSize) 
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
	self.isPreLevel = false
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

function api.GetOrderMult()
	return self.world.GetOrderMult()
end

function api.IsPreLevel()
	return self.isPreLevel
end

function api.DrawTownResourceText(pos, count, needed)
	Font.SetSize(self.townDrawParams.font)
	pos = util.Add(pos, util.Mult(self.tileSize, self.townDrawParams.pos))
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.print(count .. "/" .. needed, pos[1], pos[2])
end

function api.NotifyTownMissingGood()
	self.anyTownMissingGood = true
end

function api.Update(dt)
	self.anyTownMissingGood = false
	IterableMap.ApplySelf(self.trackList, "Update", dt)
	if not self.anyTownMissingGood then
		self.world.SetGameOver(true, "delivery")
	end
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.trackList, "Draw", drawQueue)
end

function api.MousePressed(x, y, button)
	if Global.DOODAD_MODE then
		return false
	end
	if button ~= 1 then
		return false
	end
	local gridPos, blocked = api.GetValidPlacement({x, y}, true)
	if not gridPos then
		return false
	end
	local trackType, rotation = ShopHandler.GetHeldTrack()
	if trackType then
		if self.mapRules and self.mapRules.onlyPlaceRot and not self.mapRules.onlyPlaceRot[rotation] then
			return
		end
		if self.mapRules and self.mapRules.onlyPlaceType and self.mapRules.onlyPlaceType ~= trackType then
			return
		end
	end
	local track = api.GetTrackAtPos(gridPos)
	if track then
		track.MousePressed()
		return true
	end
	if not blocked then
		if trackType and not TrackDefs[trackType].notPlaceable then
			api.AddTrack(gridPos, trackType, rotation)
			ShopHandler.UseHeldTrack()
			SoundHandler.PlaySound("put")
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
	
	SetupWorld()
end

return api
