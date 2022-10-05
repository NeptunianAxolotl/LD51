
local levels = {
	"level_1",
	"level_2",
	"level_3",
	"level_4",
	"level_5",
	"level_6",
	"level_11",
	"trainsaction",
	"level_8",
	"level_7",
	"level_12",
	"level_9",
	"level_10",
}


local levelOrderMults = {}

for i = 1, #levels do
	levelOrderMults[i] = 1
end

local baseLevelCount = #levels
for i = 4, baseLevelCount do
	levels[#levels + 1] = levels[i]
	levelOrderMults[#levelOrderMults + 1] = 1.5
end

return {
	levels = levels,
	orderMult = levelOrderMults,
}
