
local names = util.GetDefDirList("resources/images/track")
local data = {}

local largeTracks = {
	["track_town"] = true,
	["track_mine"] = true,
	["town_over"] = true,
}

for i = 1, #names do
	if largeTracks[names[i]] then
		data[#data + 1] = {
			name = names[i],
			file = "resources/images/track/" .. names[i] .. ".png",
			form = "image",
			xScale = Global.GRID_SIZE/400,
			yScale = Global.GRID_SIZE/400,
			xOffset = 0.5,
			yOffset = 0.8,
		}
	else
		data[#data + 1] = {
			name = names[i],
			file = "resources/images/track/" .. names[i] .. ".png",
			form = "image",
			xScale = Global.GRID_SIZE/400,
			yScale = Global.GRID_SIZE/400,
			xOffset = 0.5,
			yOffset = 0.5,
		}
	end
	print("added", names[i])
end

return data
