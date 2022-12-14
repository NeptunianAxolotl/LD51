
local mapData = {
	humanName = "Tutorial Valley",
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
	baseCarriages = 2,
	rules = {
		immediateTrain = true,
		trainDelayOverride = 0,
		shopState = {
			"straight",
			"straight",
			"straight",
			"straight",
		},
		refreshDisabled = true,
		onlyPlaceRot = {[1] = true, [3] = true},
		onlyPlaceType = "straight",
		trainLimit = 1,
		hints = {
			{
				text = "- Use Left Click to grab a piece from the shop to complete the track.\n- Rotate selected track with Right Click, 'r' or spacebar.",
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
		{pos = {2, 4}, rot = 0, trackType = "factory"},
		{pos = {3, 4}, rot = 2, trackType = "curve"},
		{pos = {3, 3}, rot = 3, trackType = "branch_left"},
		{pos = {4, 3}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 3},
		}}},
		{pos = {3, 1}, rot = 0, trackType = "curve"},
		{pos = {5, 1}, rot = 1, trackType = "curve"},
		{pos = {5, 2}, rot = 3, trackType = "branch_left"},
		{pos = {5, 3}, rot = 2, trackType = "branch_left"},
		{pos = {4, 1}, rot = 2, trackType = "straight"},
		{pos = {6, 3}, rot = 2, trackType = "straight"},
		{pos = {7, 3}, rot = 2, trackType = "curve"},
		{pos = {7, 2}, rot = 1, trackType = "curve"},
		{pos = {6, 2}, rot = 0, trackType = "farm"},
		{pos = {0, 4}, rot = 2, trackType = "block"},
		{pos = {0, 3}, rot = 2, trackType = "block"},
		{pos = {1, 4}, rot = 2, trackType = "block"},
		{pos = {0, -1}, rot = 2, trackType = "block"},
		{pos = {0, 0}, rot = 2, trackType = "block"},
		{pos = {0, 1}, rot = 2, trackType = "block"},
		{pos = {1, 0}, rot = 2, trackType = "block"},
		{pos = {1, 2}, rot = 2, trackType = "block"},
		{pos = {0, 2}, rot = 2, trackType = "block"},
		{pos = {2, 0}, rot = 2, trackType = "block"},
		{pos = {6, 0}, rot = 2, trackType = "block"},
		{pos = {7, 1}, rot = 2, trackType = "block"},
		{pos = {7, 0}, rot = 2, trackType = "block"},
		{pos = {8, 2}, rot = 2, trackType = "block"},
		{pos = {8, 1}, rot = 2, trackType = "block"},
		{pos = {8, 0}, rot = 2, trackType = "block"},
		{pos = {8, 3}, rot = 2, trackType = "block"},
		{pos = {8, 4}, rot = 2, trackType = "block"},
		{pos = {7, 4}, rot = 2, trackType = "block"},
		{pos = {6, 4}, rot = 2, trackType = "block"},
		{pos = {5, 4}, rot = 2, trackType = "block"},
		{pos = {4, 4}, rot = 0, trackType = "block"},
		{pos = {1, 3}, rot = 0, trackType = "block"},
		{pos = {2, 3}, rot = 0, trackType = "block"},
		{pos = {2, 2}, rot = 0, trackType = "block"},
		{pos = {1, 1}, rot = 0, trackType = "block"},
		{pos = {2, 1}, rot = 0, trackType = "block"},
		{pos = {3, 0}, rot = 0, trackType = "block"},
		{pos = {4, 0}, rot = 0, trackType = "block"},
		{pos = {5, 0}, rot = 0, trackType = "block"},
		{pos = {6, 1}, rot = 0, trackType = "block"},
	},
	doodads = {
		{pos = {5.9920846121652, 1.1420319693429}, doodadType = "field"},
		{pos = {5.8998665945871, 0.35463202340262}, doodadType = "field"},
		{pos = {0.96974999564035, -0.19867597307478}, doodadType = "mountain_small"},
		{pos = {0.24619325910296, -0.26251929146903}, doodadType = "mountain_large"},
		{pos = {-0.42770756312779, 0.70931668962751}, doodadType = "mountain_large"},
		{pos = {-0.56958138602121, -0.63139125279018}, doodadType = "mountain_large"},
		{pos = {0.88462557111468, -1.1137623378209}, doodadType = "mountain_large"},
		{pos = {-0.32839584350586, -1.2911046709333}, doodadType = "mountain_large"},
		{pos = {-0.78948582240513, 1.319374193464}, doodadType = "mountain_large"},
		{pos = {0.59378433227539, 0.48231844220843}, doodadType = "mountain_large"},
		{pos = {-0.76111112322126, 2.3195848737444}, doodadType = "mountain_small"},
		{pos = {0.90590678623744, 2.9438297816685}, doodadType = "forest"},
		{pos = {-0.20780301775251, 3.6106366838728}, doodadType = "forest"},
		{pos = {0.94846878051758, 4.0078835623605}, doodadType = "forest"},
		{pos = {-0.31420843941825, 4.7527212960379}, doodadType = "forest"},
		{pos = {1.0264993940081, 5.0435629708426}, doodadType = "forest"},
		{pos = {4.8358123779297, 5.220904976981}, doodadType = "forest"},
		{pos = {5.9637093680246, 5.0932185581752}, doodadType = "forest"},
		{pos = {3.7150089808873, 5.0293753487723}, doodadType = "forest"},
		{pos = {2.4097695486886, 5.0222817557199}, doodadType = "forest"},
		{pos = {1.9132110595703, -0.25542558942522}, doodadType = "mountain_small"},
		{pos = {3.2539188929967, -1.1634182521275}, doodadType = "mountain_large"},
		{pos = {2.0267098563058, -1.1421371459961}, doodadType = "mountain_large"},
		{pos = {4.4172842843192, -1.2485425676618}, doodadType = "mountain_large"},
		{pos = {5.8573041643415, -1.2130740574428}, doodadType = "mountain_large"},
		{pos = {3.8781638009208, -0.54626693725586}, doodadType = "mountain_small"},
		{pos = {5.8927725655692, -0.60301655360631}, doodadType = "mountain_small"},
		{pos = {7.1554495675223, 0.93631471906389}, doodadType = "field"},
		{pos = {6.9993887765067, 4.9655321393694}, doodadType = "forest"},
		{pos = {8.0563485281808, 4.8591269356864}, doodadType = "forest"},
		{pos = {8.4748770577567, 3.7737919398717}, doodadType = "forest"},
		{pos = {9.2126203264509, 4.8945953369141}, doodadType = "forest"},
		{pos = {9.6311488560268, 3.6461055210658}, doodadType = "forest"},
		{pos = {10.127707345145, 5.0364689418248}, doodadType = "forest"},
		{pos = {8.4819702148438, 2.5962389264788}, doodadType = "forest"},
		{pos = {10.042582484654, 2.6742693219866}, doodadType = "forest"},
		{pos = {8.4110334123884, 1.3264680044992}, doodadType = "forest"},
		{pos = {9.7730224609375, 1.4541543143136}, doodadType = "forest"},
		{pos = {8.3188153948103, 0.077977970668248}, doodadType = "forest"},
		{pos = {7.084512765067, -0.021333748953683}, doodadType = "forest"},
		{pos = {7.396635219029, -0.97188851492746}, doodadType = "forest"},
		{pos = {8.5883754185268, -1.0073569706508}, doodadType = "forest"},
		{pos = {9.7517412458147, -0.90804530552455}, doodadType = "forest"},
		{pos = {9.7091788155692, 0.27660140991211}, doodadType = "forest"},
		{pos = {0.79240755353655, 1.936525617327}, doodadType = "grass"},
		{pos = {7.2547616141183, 4.0291647774833}, doodadType = "grass"},
		{pos = {5.4458696637835, 4.5540980747768}, doodadType = "grass"},
		{pos = {8.1627546037946, 2.1422424316406}, doodadType = "grass"},
		{pos = {2.0763658796038, 1.0710949489049}, doodadType = "forest"},
		{pos = {2.9843584333147, 0.10635277884347}, doodadType = "forest"},
		{pos = {0.68605172293527, -0.47533002580915}, doodadType = "mountain_small"},
		{pos = {-0.81781114850725, 0.070884268624442}, doodadType = "mountain_small"},
		{pos = {-1.0022471836635, 1.9436192103795}, doodadType = "mountain_small"},
		{pos = {1.4237958635603, -0.45404891967773}, doodadType = "mountain_large"},
		{pos = {4.2470855712891, -0.80873358590262}, doodadType = "mountain_small"},
		{pos = {5.0202981131417, -1.3336668287005}, doodadType = "mountain_small"},
		{pos = {3.6370278494699, -1.4329786028181}, doodadType = "mountain_small"},
		{pos = {1.2606408255441, -1.518102809361}, doodadType = "mountain_small"},
		{pos = {2.4878496442522, -1.4400721958705}, doodadType = "mountain_small"},
		{pos = {5.8360722133092, -0.85838944571359}, doodadType = "mountain_large"},
	},
}

return mapData
