
local util = require("include/util")
local Font = require("include/font")

local TrackDefs = util.LoadDefDirectory("defs/track")

local function NewTrack(self, terrain)
	self.def = TrackDefs[self.trackType]
	
	function self.Update(dt)
	
	end
	
	function self.Draw(drawQueue)
		drawQueue:push({y=0; f=function()
			Resources.DrawImage(self.def.image, (self.pos[1] + 0.5) * Global.GRID_SIZE, (self.pos[2] + 0.5) * Global.GRID_SIZE, self.rotation*math.pi/2)
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
