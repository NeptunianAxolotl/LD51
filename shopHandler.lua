
local util = require("include/util")
local TrackDefs = util.LoadDefDirectory("defs/track")

local api = {}
local self = {}

function api.GetHeldTrack()
	if not self.heldTrack then
		return false
	end
	return self.heldTrack, self.trackRotation
end

function api.UseHeldTrack()
	self.heldTrack = false
end

function api.SetHeldTrack(newTrack, newRotation)
	self.heldTrack = newTrack
	if newRotation then
		self.trackRotation = newRotation
	end
end

function api.Update(dt)

end

function api.KeyPressed(key, scancode, isRepeat)
	if key == "r" or key == "space" then
		self.trackRotation = (self.trackRotation + 1)%4
	end
end

function api.MousePressed(x, y)

end

function api.Draw(drawQueue)
	if self.heldTrack then
		local def = TrackDefs[self.heldTrack]
		local pos = self.world.GetMousePosition()
		drawQueue:push({y=1000; f=function()
			local gx, gy = math.floor(pos[1] / Global.GRID_SIZE), math.floor(pos[2] / Global.GRID_SIZE)
			if not (gx < 0 or gy < 0 or gx >= Global.WORLD_WIDTH or gy >= Global.WORLD_HEIGHT) then
				love.graphics.setColor(1, 1, 1, 0.2)
				love.graphics.setLineWidth(5)
				love.graphics.rectangle("line", gx*Global.GRID_SIZE, gy*Global.GRID_SIZE, Global.GRID_SIZE, Global.GRID_SIZE, 4, 4, 8)
			end
			Resources.DrawImage(def.stateImage[1], pos[1], pos[2], self.trackRotation * math.pi/2, 0.8)
		end})
	end
end

function api.Initialize(world)
	self = {
		world = world
	}
	
	self.items = {}
	self.heldTrack = false
	self.trackRotation = 0
end

return api
