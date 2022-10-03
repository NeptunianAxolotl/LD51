
local util = require("include/util")
local Font = require("include/font")

local DoodadDefs = util.LoadDefDirectory("defs/doodads")

local function NewTrack(self, terrain)
	self.def = DoodadDefs[self.doodadType]
	self.worldPos = {(self.pos[1] + 0.5)* TerrainHandler.TileSize(), (self.pos[2] + 0.5) * TerrainHandler.TileSize()}
	
	function self.Draw(drawQueue)
		drawQueue:push({y=0 + self.pos[2]*0.01 - 0.001; f=function()
			Resources.DrawImage(self.def.image, self.worldPos[1], self.worldPos[2], 0, false, TerrainHandler.TileScale())
		end})
		if self.def.topImage then
			drawQueue:push({y=100 + self.pos[2]*0.01 - 0.001; f=function()
				Resources.DrawImage(self.def.topImage, self.worldPos[1], self.worldPos[2], 0, false, TerrainHandler.TileScale())
				if self.def.extraDrawFunc then
					self.def.extraDrawFunc(self, self.worldPos, self.worldRot)
				end
			end})
		end
	end
	
	return self
end

return NewTrack