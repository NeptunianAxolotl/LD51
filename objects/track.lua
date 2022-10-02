
local util = require("include/util")
local Font = require("include/font")

local TrackDefs = util.LoadDefDirectory("defs/track")

local function NewTrack(self, terrain)
	self.def = TrackDefs[self.trackType]
	
	if self.def.entryUseIndexMap then
		self.inUse = {}
	else
		self.inUse = false
	end
	self.toDestroy = false
	self.state = 1
	
	self.worldPos = {(self.pos[1] + 0.5) * Global.GRID_SIZE, (self.pos[2] + 0.5) * Global.GRID_SIZE}
	self.worldRot = self.rotation*math.pi/2
	
	function self.GetPathAndNextTrack(entry, isSpawn, ignoreState)
		if self.IsPermanentlyBlocked(entry) then
			return false
		end
		local trackSpaceEntry = (entry - self.rotation)%4
		for i = 1, #self.def.paths do
			local path = self.def.paths[i]
			if (isSpawn and path.isSpawnPath) or (trackSpaceEntry == path.entry and (ignoreState or (not path.requiredState) or (self.state == path.requiredState))) then
				local worldSpaceDest = (path.destination + self.rotation)%4
				return path, worldSpaceDest
			end
		end
		return false
	end
	
	function self.GetPathDraw(path, travel)
		local worldPos = util.Add(self.worldPos, util.Mult(Global.GRID_SIZE, util.RotateVector(path.posFunc(travel), self.worldRot)))
		return worldPos, self.worldRot + path.dirFunc(travel)
	end
	
	function self.SetUsedState(newState, entry)
		if self.def.entryUseIndexMap then
			entry = (entry - self.rotation)%4
			self.inUse[self.def.entryUseIndexMap[entry]] = newState
		else
			self.inUse = newState
		end
	end
	
	function self.GetPos()
		return self.pos
	end
	
	function self.IsInUse(entry)
		if self.toDestroy then
			return true
		end
		if self.def.entryUseIndexMap then
			if entry then
				entry = (entry - self.rotation)%4
				if self.inUse[self.def.entryUseIndexMap[entry]] then
					return true
				end
				if self.permanentlyBlocked and self.permanentlyBlocked[self.def.entryUseIndexMap[entry]] then
					return true
				end
			else
				if self.inUse[1] or self.inUse[2] then
					return true
				end
				if self.permanentlyBlocked and self.permanentlyBlocked[1] and self.permanentlyBlocked[2] then
					return true
				end
			end
		elseif self.inUse or self.permanentlyBlocked then
			return true
		end
		if self.def.offState then
			return (self.state == self.def.offState)
		end
		return false
	end
	
	function self.SetPermanentBlock(entry)
		TerrainHandler.SetUneditable(self.pos[1], self.pos[2])
		if self.def.entryUseIndexMap then
			entry = (entry - self.rotation)%4
			self.permanentlyBlocked = self.permanentlyBlocked or {}
			self.permanentlyBlocked[self.def.entryUseIndexMap[entry]] = true
		else
			self.permanentlyBlocked = true
		end
	end
	
	function self.IsPermanentlyBlocked(entry)
		if self.def.entryUseIndexMap then
			entry = (entry - self.rotation)%4
			if self.permanentlyBlocked then
				return self.permanentlyBlocked[self.def.entryUseIndexMap[entry]]
			end
		else
			return self.permanentlyBlocked
		end
		return false
	end
	
	function self.MousePressed()
		if self.def.toggleStates then
			self.state = self.state%self.def.toggleStates + 1
		end
		if self.def.pickupable and not self.IsInUse() then
			local heldType, heldRotation = ShopHandler.GetHeldTrack()
			if heldType then
				TerrainHandler.AddTrack(self.pos, heldType, heldRotation)
				ShopHandler.UseHeldTrack()
			end
			ShopHandler.SetHeldTrack(self.trackType, self.rotation)
			ShopHandler.UpdateShopIfEmpty()
			if not heldType then
				TerrainHandler.DestroyTrack(self.pos)
			end
		end
	end
	
	function self.Update(dt)
		if self.def.updateFunc then
			self.def.updateFunc(self, dt)
		end
		return self.toDestroy
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=0 + self.pos[2]*0.01; f=function()
			Resources.DrawImage(self.def.stateImage[self.state], self.worldPos[1], self.worldPos[2], self.worldRot)
		end})
		if self.def.topImage then
			drawQueue:push({y=100 + self.pos[2]*0.01; f=function()
				Resources.DrawImage(self.def.topImage, self.worldPos[1], self.worldPos[2], self.worldRot)
				if self.def.extraDrawFunc then
					self.def.extraDrawFunc(self, self.worldPos, self.worldRot)
				end
			end})
		end
		if DRAW_DEBUG then
			love.graphics.circle('line',self.pos[1], self.pos[2], def.radius)
		end
	end
	
	function self.DrawInterface()
		
	end
	
	return self
end

return NewTrack
