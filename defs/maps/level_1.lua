
local mapData = {
	dimensions = {
		width = 12,
		height = 7,
		tileSize = 208,
	},
	doodads = {
		{pos = {5.9701326810397, 1.6949454087477}, doodadType = "forest"},
		{pos = {2.7153678307166, 1.2967153695913}, doodadType = "forest"},
		{pos = {1.0458643986629, 2.2846321692834}, doodadType = "field"},
		{pos = {6.8048841036283, 3.2495745145358}, doodadType = "mountain_small"},
		{pos = {8.4973619901217, 3.441031235915}, doodadType = "mountain_small"},
		{pos = {9.5235701340895, 3.0198261554425}, doodadType = "mountain_small"},
		{pos = {9.7916095440204, 2.7058372497559}, doodadType = "mountain_small"},
		{pos = {10.105599036584, 2.2386826735276}, doodadType = "mountain_small"},
		{pos = {7.2950134277344, 1.7026035602276}, doodadType = "mountain_small"},
		{pos = {7.6855856088492, 2.391848050631}, doodadType = "mountain_small"},
		{pos = {5.4034206683819, 3.2112831702599}, doodadType = "mountain_large"},
		{pos = {5.166014451247, 4.0000850970928}, doodadType = "mountain_large"},
		{pos = {2.4090364896334, 4.6663548396184}, doodadType = "mountain_large"},
		{pos = {0.64763435950646, 5.0492682823768}, doodadType = "mountain_large"},
		{pos = {0.90035731975849, 3.8698944678673}, doodadType = "mountain_large"},
		{pos = {3.6037269005409, 1.7638696523813}, doodadType = "mountain_large"},
		{pos = {4.7141764714168, 0.80658604548528}, doodadType = "mountain_large"},
		{pos = {6.0084240253155, 0.46196372692402}, doodadType = "mountain_large"},
		{pos = {9.3550884540264, 3.4793225801908}, doodadType = "mountain_large"},
		{pos = {6.4908951979417, 3.2419160696176}, doodadType = "mountain_large"},
		{pos = {6.9810245220478, 3.7550204350398}, doodadType = "mountain_large"},
		{pos = {4.3006298358624, 5.5470563448392}, doodadType = "field"},
		{pos = {6.7359595665565, 5.3785740778996}, doodadType = "mountain_large"},
		{pos = {9.0947071955754, 4.7199630737305}, doodadType = "mountain_small"},
		{pos = {9.845218365009, 0.8601939861591}, doodadType = "mountain_small"},
		{pos = {7.3945711576022, 0.15563289935772}, doodadType = "mountain_small"},
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
		
		{pos = {20, 4}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 5, bonus = {"speedMult", 0.4}},
		}}},
		{pos = {14, 12}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 5, bonus = {"speedMult", 0.4}},
		}}},
		{pos = {3, 8}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 5, bonus = {"speedMult", 0.4}},
		}}},
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
