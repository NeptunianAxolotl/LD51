
local util = require("include/util")
local Font = require("include/font")

local TrackDefs = util.LoadDefDirectory("defs/track")

local function NewTrack(self, terrain)
	self.def = TrackDefs[self.trackType]
	self.inUse = false
	self.toDestroy = false
	self.state = 1
	
	self.worldPos = {(self.pos[1] + 0.5) * Global.GRID_SIZE, (self.pos[2] + 0.5) * Global.GRID_SIZE}
	self.worldRot = self.rotation*math.pi/2
	
	function self.GetPathAndNextTrack(entry, isSpawn)
		local trackSpaceEntry = (entry - self.rotation)%4
		for i = 1, #self.def.paths do
			local path = self.def.paths[i]
			if (isSpawn and path.isSpawnPath) or (trackSpaceEntry == path.entry and ((not path.requiredState) or self.state == path.requiredState)) then
				local worldSpaceDest = (path.destination + self.rotation)%4
				return path, worldSpaceDest
			end
		end
	end
	
	function self.GetPathDraw(path, travel)
		local worldPos = util.Add(self.worldPos, util.Mult(Global.GRID_SIZE, util.RotateVector(path.posFunc(travel), self.worldRot)))
		return worldPos, self.worldRot + path.dirFunc(travel)
	end
	
	function self.SetUsedState(newState)
		self.inUse = newState
	end
	
	function self.GetPos()
		return self.pos
	end
	
	function self.IsInUse()
		if self.inUse or self.toDestroy then
			return true
		end
		if self.def.offState then
			return (self.state == self.def.offState)
		end
		return false
	end
	
	function self.MousePressed()
		if self.def.toggleStates then
			self.state = self.state%self.def.toggleStates + 1
		end
		if self.def.pickupable and not self.IsInUse() and not ShopHandler.GetHeldTrack() then
			ShopHandler.SetHeldTrack(self.trackType, self.rotation)
			TerrainHandler.DestroyTrack(self.pos)
		end
	end
	
	function self.Update(dt)
		if self.def.updateFunc then
			self.def.updateFunc(self, dt)
		end
		return self.toDestroy
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=0; f=function()
			Resources.DrawImage(self.def.stateImage[self.state], self.worldPos[1], self.worldPos[2], self.worldRot)
		end})
		if self.def.topImage then
			drawQueue:push({y=100; f=function()
				Resources.DrawImage(self.def.topImage, self.worldPos[1], self.worldPos[2], self.worldRot)
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
