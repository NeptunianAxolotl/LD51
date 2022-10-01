
local names = util.GetDefDirList("resources/images/items")
local data = {}

for i = 1, #names do
	data[#data + 1] = {
		name = names[i],
		file = "resources/images/items/" .. names[i] .. ".png",
		form = "image",
		xScale = Global.GRID_SIZE/400,
		yScale = Global.GRID_SIZE/400,
		xOffset = 0.5,
		yOffset = 0.5,
	}
	print("added", names[i])
end

return data
