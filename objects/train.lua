
local util = require("include/util")
local Font = require("include/font")

local TrainDefs = util.LoadDefDirectory("defs/trains")

local function NewTrain(self, trainHandler, new_gridPos, new_entry)
	self.def = TrainDefs[self.trainType]
	
	self.travel = 0
	self.speed = 0
	local function EnterTrack(nextTrack, entry, isSpawn)
		local newPath, newDestination = nextTrack.GetPathAndNextTrack(entry, isSpawn)
		if not newPath then
			return
		end
		if self.currentTrack then
			self.currentTrack.SetUsedState(false)
		end
		
		self.currentTrack = nextTrack
		self.currentPath = newPath
		self.destination = newDestination
		self.currentTrack.SetUsedState(true)
		self.nextTrack = false
	end
	EnterTrack(TerrainHandler.GetTrackAtPos(new_gridPos), new_entry, true)
	
	function self.Update(dt)
		if not self.nextTrack then
			local nextTrack = TerrainHandler.GetTrackAtPos(self.currentTrack.GetPos(), self.destination)
			if nextTrack and not nextTrack.IsInUse() then
				self.nextTrack = nextTrack
				self.nextTrack.SetUsedState(true)
			end
		end
		if self.nextTrack then
			self.speed = math.min(self.def.maxSpeed, self.speed + dt*self.def.accel)
			self.travel = self.travel + dt*self.speed*(self.currentPath.speedMult or 1)
		else
			if self.speed > -0.05 then
				self.speed = self.speed - dt*self.def.deccel
			end
			if self.travel < 0.5 and self.speed < 0 then
				self.speed = 0
			end
			self.travel = self.travel + dt*self.speed*(self.currentPath.speedMult or 1)
			if self.travel >= 0.92 then
				self.speed = -0.2
				if self.travel >= 0.99 then
					self.travel = 0.99
				end
			end
		end
		if self.travel >= 1 then
			self.travel = self.travel - 1
			EnterTrack(self.nextTrack, (self.destination + 2)%4)
		end
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=10; f=function()
			local drawPos, drawRotation = self.currentTrack.GetPathDraw(self.currentPath, self.travel)
			Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRotation)
		end})
		if DRAW_DEBUG then
			love.graphics.circle('line',self.pos[1], self.pos[2], def.radius)
		end
	end
	
	function self.DrawInterface()
		
	end
	
	return self
end

return NewTrain
