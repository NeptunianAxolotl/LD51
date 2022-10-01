
local util = require("include/util")

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

end

function api.MousePressed(x, y)

end

function api.Draw(drwQueue)
	
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
