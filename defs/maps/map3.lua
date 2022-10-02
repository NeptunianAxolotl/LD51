
local mapData = {
	dimensions = {
		width = 20,
		height = 12,
		tileSize = 125,
	},
	track = {
		{pos = {3, 3}, rot = 0, trackType = "factory"},
		{pos = {4, 3}, rot = 1, trackType = "curve"},
		{pos = {4, 4}, rot = 1, trackType = "straight"},
		{pos = {4, 5}, rot = 3, trackType = "curve"},
		{pos = {5, 5}, rot = 0, trackType = "straight"},
		{pos = {6, 5}, rot = 0, trackType = "straight"},
		{pos = {7, 5}, rot = 0, trackType = "straight"},
		{pos = {8, 5}, rot = 1, trackType = "curve"},
		{pos = {8, 6}, rot = 3, trackType = "curve"},
		{pos = {9, 6}, rot = 0, trackType = "straight"},
		{pos = {9, 6}, rot = 0, trackType = "straight"},
		{pos = {10, 6}, rot = 0, trackType = "straight"},
		{pos = {14, 5}, rot = 0, trackType = "straight"},
		{pos = {15, 5}, rot = 0, trackType = "straight"},
		{pos = {16, 4}, rot = 0, trackType = "curve"},
		
		{pos = {11, 5}, rot = 0, trackType = "field"},
		{pos = {11, 6}, rot = 0, trackType = "farm"},
		{pos = {12, 6}, rot = 1, trackType = "straight"},
		
		{pos = {21, 12}, rot = 0, trackType = "field"},
		{pos = {22, 12}, rot = 0, trackType = "field"},
		{pos = {22, 13}, rot = 0, trackType = "farm"},
		
		{pos = {13, -1}, rot = 0, trackType = "mountain_large"},
		{pos = {14, -1}, rot = 0, trackType = "mountain_large"},
		{pos = {15, -1}, rot = 0, trackType = "mountain_large"},
		{pos = {16, -1}, rot = 0, trackType = "mountain_large"},
		{pos = {17, -1}, rot = 0, trackType = "mountain_large"},
		{pos = {13, 0}, rot = 0, trackType = "mountain_small"},
		{pos = {14, 0}, rot = 0, trackType = "mountain_large"},
		{pos = {15, 0}, rot = 0, trackType = "mountain_large"},
		{pos = {16, 0}, rot = 0, trackType = "mountain_large"},
		{pos = {17, 0}, rot = 0, trackType = "mountain_small"},
		{pos = {14, 1}, rot = 0, trackType = "mine"},
		
		{pos = {21, 8}, rot = 0, trackType = "mountain_large"},
		{pos = {22, 7}, rot = 0, trackType = "mountain_small"},
		{pos = {22, 8}, rot = 0, trackType = "mountain_large"},
		{pos = {21, 7}, rot = 0, trackType = "mountain_small"},
		{pos = {23, 8}, rot = 0, trackType = "mountain_small"},
		{pos = {20, 8}, rot = 0, trackType = "mountain_small"},
		{pos = {21, 9}, rot = 0, trackType = "mine"},
		
		
		{pos = {7, 11}, rot = 0, trackType = "forest"},
		{pos = {8, 11}, rot = 0, trackType = "forest"},
		{pos = {5, 12}, rot = 0, trackType = "forest"},
		{pos = {6, 12}, rot = 0, trackType = "forest"},
		{pos = {7, 12}, rot = 0, trackType = "forest"},
		{pos = {8, 12}, rot = 0, trackType = "forest"},
		{pos = {9, 12}, rot = 0, trackType = "forest"},
		{pos = {9, 13}, rot = 0, trackType = "forest"},
		{pos = {10, 13}, rot = 0, trackType = "forest"},
		{pos = {6, 13}, rot = 0, trackType = "sawmill"},
		
		{pos = {9, 1}, rot = 0, trackType = "forest"},
		{pos = {9, 2}, rot = 0, trackType = "sawmill"},
		
		{pos = {20, 4}, rot = 0, trackType = "town", setData = {wantedGoodList = {"food", "wood"}, priorityGood = "food"}},
		{pos = {14, 12}, rot = 0, trackType = "town", setData = {wantedGoodList = {"wood", "ore"}, priorityGood = "wood"}},
		{pos = {3, 8}, rot = 0, trackType = "town", setData = {wantedGoodList = {"food", "ore"}, priorityGood = "ore"}},
	}
}

for i = -1, mapData.dimensions.width do
	mapData.track[#mapData.track + 1] = {pos = {i, -1}, rot = 0, trackType = "mountain_large"}
	mapData.track[#mapData.track + 1] = {pos = {i, mapData.dimensions.height}, rot = 0, trackType = "forest"}
end

for i = -1, mapData.dimensions.height do
	mapData.track[#mapData.track + 1] = {pos = {-1, i}, rot = 0, trackType = "forest"}
	mapData.track[#mapData.track + 1] = {pos = {mapData.dimensions.width, i}, rot = 0, trackType = "forest"}
end

return mapData
