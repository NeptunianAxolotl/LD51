
local util = require("include/util")
local Font = require("include/font")

local TrackDefs = util.LoadDefDirectory("defs/track")

local function NewTrack(self, terrain)
	self.def = TrackDefs[self.trackType]
	self.inUse = false
	
	self.worldPos = {(self.pos[1] + 0.5) * Global.GRID_SIZE, (self.pos[2] + 0.5) * Global.GRID_SIZE}
	self.worldRot = self.rotation*math.pi/2
	
	function self.Update(dt)
	
	end
	
	function self.GetPathAndNextTrack(entry)
		local trackSpaceEntry = (entry - self.rotation)%4
		for i = 1, #self.def.paths do
			local path = self.def.paths[i]
			if trackSpaceEntry == path.entry then
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
		return self.inUse
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=0; f=function()
			Resources.DrawImage(self.def.image, self.worldPos[1], self.worldPos[2], self.worldRot)
			--love.graphics.push()
			--	love.graphics.translate(self.pos[1], self.pos[2])
			--	love.graphics.rotate(self.rotation*math.pi/2)
			--love.graphics.pop()
		end})
		if DRAW_DEBUG then
			love.graphics.circle('line',self.pos[1], self.pos[2], def.radius)
		end
	end
	
	function self.DrawInterface()
		
	end
	
	return self
end

return NewTrack
