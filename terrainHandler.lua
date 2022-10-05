
local IterableMap = require("include/IterableMap")
local util = require("include/util")
local Font = require("include/font")

local TrackDefs = util.LoadDefDirectory("defs/track")
local NewTrack = require("objects/track")

local self = {}
local api = {}

function api.SetUneditable(x, y)
	self.uneditable[x] = self.uneditable[x] or {}
	self.uneditable[x][y] = true
end

function api.RemoveUneditable(x, y)
	if self.uneditable[x] then
		self.uneditable[x][y] = nil
	end
end

function api.AddTrack(pos, trackType, rotation, setData)
	local x, y = pos[1], pos[2]
	self.trackPos[x] = self.trackPos[x] or {}
	if self.trackPos[x][y] then
		local oldTrack = IterableMap.Get(self.trackList, self.trackPos[x][y])
		-- For editor
		api.RemoveUneditable(x, y)
		if oldTrack and oldTrack.def.nearbyBlocked then
			for i = 1, #oldTrack.def.nearbyBlocked do
				local otherTrack = api.GetTrackAtPos(pos)
				if (not otherTrack) or (otherTrack.def.removable) then
					api.RemoveUneditable(x + oldTrack.def.nearbyBlocked[i][1], y + oldTrack.def.nearbyBlocked[i][2])
				end
			end
		end
		IterableMap.Remove(self.trackList, self.trackPos[x][y])
	end
	local def = TrackDefs[trackType]
	if def.isCrowbar then
		return
	end
	local trackData = (setData and util.CopyTable(setData)) or {}
	trackData.pos = pos
	trackData.trackType = trackType
	trackData.rotation = rotation
	if self.isPreLevel and not LevelHandler.InEditMode() then
		self.isPreLevel = false
	end
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
	local map = LevelHandler.GetMapData()
	
	for i = 1, #map.track do
		local track = map.track[i]
		api.AddTrack(track.pos, track.trackType, track.rot, track.setData)
	end
	self.isPreLevel = not (map.rules and map.rules.immediateTrain)
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
	if (gx < 0 or gy < 0 or gx >= LevelHandler.Width() or gy >= LevelHandler.Height()) then
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
	local gx, gy = math.floor(pos[1] / LevelHandler.TileSize()), math.floor(pos[2] / LevelHandler.TileSize()) 
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
	if self.isPreLevel and not LevelHandler.InEditMode() then
		self.isPreLevel = false
	end
end

function api.IsPreLevel()
	return self.isPreLevel
end

function api.DrawTownResourceText(pos, count, needed)
	Font.SetSize(LevelHandler.TownDrawParams().font)
	pos = util.Add(pos, util.Mult(LevelHandler.TileSize(), LevelHandler.TownDrawParams().pos))
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.print(count .. "/" .. needed, pos[1], pos[2])
end

function api.NotifyTownMissingGood()
	self.anyTownMissingGood = true
end

function api.ExportObjects()
	local objList = {}
	IterableMap.ApplySelf(self.trackList, "Export", objList)
	return objList
end

function api.UpdateTileSize()
	IterableMap.ApplySelf(self.trackList, "UpdateWorldPos")
end

function api.Update(dt)
	self.anyTownMissingGood = false
	IterableMap.ApplySelf(self.trackList, "Update", dt)
	if not self.anyTownMissingGood then
		self.world.SetGameOver(true, "delivery")
	end
	if LevelHandler.InEditMode() then
		self.mapRules = false -- Remove hints etc
	end
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.trackList, "Draw", drawQueue)
	if LevelHandler.InEditMode() then
		drawQueue:push({y=-100; f=function()
			for x = 0, LevelHandler.Width() - 1 do
				for y = 0, LevelHandler.Height() - 1 do
					love.graphics.setColor(0.5, 0.5, 0.5, 0.3)
					love.graphics.setLineWidth(5)
					love.graphics.rectangle("line", x*LevelHandler.TileSize(), y*LevelHandler.TileSize(), LevelHandler.TileSize(), LevelHandler.TileSize(), 4, 4, 8)
				end
			end
		end})
	end
end

function api.MousePressed(x, y, button)
	if LevelHandler.InEditMode() then
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
