
local names = util.GetDefDirList("resources/images/scenery")
local data = {}

local manualOffset = {
	forest = 0.035,
	forest2 = 0.025,
	farm = 0.1,
	mountain_small = 0.01,
	mountain_large = 0.01,
}

for i = 1, #names do
	data[#data + 1] = {
		name = names[i],
		file = "resources/images/scenery/" .. names[i] .. ".png",
		form = "image",
		xScale = Global.GRID_SIZE/400,
		yScale = Global.GRID_SIZE/400,
		xOffset = 0.5,
		yOffset = 0.4 + (manualOffset[names[i]] or 0),
	}
	print("added", names[i])
end

return data
