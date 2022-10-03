
local mapData = {
	humanName = "Level 2",
	dimensions = {
		width = 9,
		height = 5,
		tileSize = 280,
		vertOffset = 65,
	},
	townDrawParams = {
		font = 0,
		pos = {0.05, -1.42}
	},
	baseCarriages = 1,
	rules = {
		hints = {
			{
				text = "- Use Left Click to grab a piece from the shop to complete the track.\n- Rotate selected track with Right Click, 'R' or 'Space'.",
				pos = {0.4, 0.4},
				size = {2.2, 1.55},
				arrow = "right",
				arrowDest = {3.35, 2.35},
			},
			{
				text = "- Left Click a junction to switch its direction.\n- Reroute the train to supply the town.",
				pos = {6.15, 0.4},
				size = {2.2, 1.05},
				arrow = "left",
				arrowDest = {5.65, 2.35},
			},
		}
	},
	track = {
		{pos = {4, 3}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 4},
		}}},
	},
	doodads = {
	},
}

return mapData
