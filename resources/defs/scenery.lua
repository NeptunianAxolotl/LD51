
local names = util.GetDefDirList("resources/images/scenery")
local data = {}


for i = 1, #names do
	data[#data + 1] = {
		name = names[i],
		file = "resources/images/scenery/" .. names[i] .. ".png",
		form = "image",
		xScale = Global.GRID_SIZE/400,
		yScale = Global.GRID_SIZE/400,
		xOffset = 0.5,
		yOffset = 0.8,
	}
	print("added", names[i])
end

return data
