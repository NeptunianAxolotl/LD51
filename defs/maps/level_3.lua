
local mapData = {
	rules = {
		hints = {
			{
				text = "Additional hotkeys:\n- Numbers 1, 2, 3, 4 select item\n- 'e' to refresh the shop\n- 'p' to pause.\n- 'ctrl+r' to reset the level\n- 'ctrl+n' for next level\n- 'ctrl+p' for previous level\n- 'ctrl+m' to toggle music",
				pos = {0.2, 6.08},
				size = {5, 3.56},
			},
		}
	},
	track = {
		[1] = {
			pos = {
				[2] = 8,
				[1] = 6,
			},
			rot = 0,
			trackType = "block",
		},
		[2] = {
			pos = {
				[2] = 0,
				[1] = 4,
			},
			rot = 0,
			trackType = "mine",
		},
		[3] = {
			setData = {
				progression = {
					[1] = {
						good = "food",
						count = 10,
					},
				},
			},
			pos = {
				[2] = 3,
				[1] = 3,
			},
			rot = 0,
			trackType = "town",
		},
		[4] = {
			setData = {
				progression = {
					[1] = {
						good = "ore",
						count = 5,
					},
				},
			},
			pos = {
				[2] = 3,
				[1] = 12,
			},
			rot = 0,
			trackType = "town",
		},
		[5] = {
			pos = {
				[2] = 5,
				[1] = 9,
			},
			rot = 1,
			trackType = "straight",
		},
		[6] = {
			pos = {
				[2] = 4,
				[1] = 8,
			},
			rot = 2,
			trackType = "straight",
		},
		[7] = {
			pos = {
				[2] = 6,
				[1] = 9,
			},
			rot = 3,
			trackType = "factory",
		},
		[8] = {
			pos = {
				[2] = 4,
				[1] = 9,
			},
			rot = 1,
			trackType = "curve",
		},
		[9] = {
			pos = {
				[2] = 9,
				[1] = 6,
			},
			rot = 0,
			trackType = "block",
		},
		[10] = {
			pos = {
				[2] = 6,
				[1] = 4,
			},
			rot = 0,
			trackType = "block",
		},
		[11] = {
			pos = {
				[2] = 6,
				[1] = 5,
			},
			rot = 0,
			trackType = "block",
		},
		[12] = {
			pos = {
				[2] = 7,
				[1] = 5,
			},
			rot = 0,
			trackType = "block",
		},
		[13] = {
			pos = {
				[2] = 8,
				[1] = 5,
			},
			rot = 0,
			trackType = "block",
		},
		[14] = {
			pos = {
				[2] = 9,
				[1] = 5,
			},
			rot = 0,
			trackType = "block",
		},
		[15] = {
			pos = {
				[2] = 9,
				[1] = 4,
			},
			rot = 0,
			trackType = "block",
		},
		[16] = {
			pos = {
				[2] = 9,
				[1] = 3,
			},
			rot = 0,
			trackType = "block",
		},
		[17] = {
			pos = {
				[2] = 9,
				[1] = 2,
			},
			rot = 0,
			trackType = "block",
		},
		[18] = {
			pos = {
				[2] = 9,
				[1] = 1,
			},
			rot = 0,
			trackType = "block",
		},
		[19] = {
			pos = {
				[2] = 9,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[20] = {
			pos = {
				[2] = 8,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[21] = {
			pos = {
				[2] = 8,
				[1] = 1,
			},
			rot = 0,
			trackType = "block",
		},
		[22] = {
			pos = {
				[2] = 8,
				[1] = 2,
			},
			rot = 0,
			trackType = "block",
		},
		[23] = {
			pos = {
				[2] = 8,
				[1] = 3,
			},
			rot = 0,
			trackType = "block",
		},
		[24] = {
			pos = {
				[2] = 7,
				[1] = 3,
			},
			rot = 0,
			trackType = "block",
		},
		[25] = {
			pos = {
				[2] = 7,
				[1] = 2,
			},
			rot = 0,
			trackType = "block",
		},
		[26] = {
			pos = {
				[2] = 7,
				[1] = 1,
			},
			rot = 0,
			trackType = "block",
		},
		[27] = {
			pos = {
				[2] = 7,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[28] = {
			pos = {
				[2] = 6,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[29] = {
			pos = {
				[2] = 6,
				[1] = 1,
			},
			rot = 0,
			trackType = "block",
		},
		[30] = {
			pos = {
				[2] = 6,
				[1] = 2,
			},
			rot = 0,
			trackType = "block",
		},
		[31] = {
			pos = {
				[2] = 6,
				[1] = 3,
			},
			rot = 0,
			trackType = "block",
		},
		[32] = {
			pos = {
				[2] = 5,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[33] = {
			pos = {
				[2] = 1,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[34] = {
			pos = {
				[2] = 0,
				[1] = 0,
			},
			rot = 0,
			trackType = "block",
		},
		[35] = {
			pos = {
				[2] = 0,
				[1] = 1,
			},
			rot = 0,
			trackType = "block",
		},
		[36] = {
			pos = {
				[2] = 0,
				[1] = 15,
			},
			rot = 0,
			trackType = "block",
		},
		[37] = {
			pos = {
				[2] = 6,
				[1] = 15,
			},
			rot = 0,
			trackType = "block",
		},
		[38] = {
			pos = {
				[2] = 7,
				[1] = 14,
			},
			rot = 0,
			trackType = "block",
		},
		[39] = {
			pos = {
				[2] = 7,
				[1] = 15,
			},
			rot = 0,
			trackType = "block",
		},
		[40] = {
			pos = {
				[2] = 8,
				[1] = 15,
			},
			rot = 0,
			trackType = "block",
		},
		[41] = {
			pos = {
				[2] = 9,
				[1] = 15,
			},
			rot = 0,
			trackType = "block",
		},
		[42] = {
			pos = {
				[2] = 9,
				[1] = 14,
			},
			rot = 0,
			trackType = "block",
		},
		[43] = {
			pos = {
				[2] = 8,
				[1] = 14,
			},
			rot = 0,
			trackType = "block",
		},
		[44] = {
			pos = {
				[2] = 8,
				[1] = 13,
			},
			rot = 0,
			trackType = "block",
		},
		[45] = {
			pos = {
				[2] = 9,
				[1] = 13,
			},
			rot = 0,
			trackType = "block",
		},
		[46] = {
			pos = {
				[2] = 9,
				[1] = 12,
			},
			rot = 0,
			trackType = "block",
		},
		[47] = {
			pos = {
				[2] = 9,
				[1] = 11,
			},
			rot = 0,
			trackType = "block",
		},
		[48] = {
			pos = {
				[2] = 9,
				[1] = 10,
			},
			rot = 0,
			trackType = "block",
		},
		[49] = {
			pos = {
				[2] = 9,
				[1] = 9,
			},
			rot = 0,
			trackType = "block",
		},
		[50] = {
			pos = {
				[2] = 9,
				[1] = 8,
			},
			rot = 0,
			trackType = "block",
		},
		[51] = {
			pos = {
				[2] = 9,
				[1] = 7,
			},
			rot = 0,
			trackType = "block",
		},
		[52] = {
			pos = {
				[2] = 4,
				[1] = 7,
			},
			rot = 0,
			trackType = "farm",
		},
		[53] = {
			pos = {
				[2] = 4,
				[1] = 6,
			},
			rot = 0,
			trackType = "straight",
		},
		[54] = {
			pos = {
				[1] = 2,
				[2] = 0,
			},
			rot = 0,
			trackType = "curve",
		},
		[55] = {
			pos = {
				[1] = 2,
				[2] = 1,
			},
			rot = 2,
			trackType = "curve",
		},
		[56] = {
			pos = {
				[1] = 1,
				[2] = 1,
			},
			rot = 0,
			trackType = "curve",
		},
		[57] = {
			pos = {
				[1] = 3,
				[2] = 0,
			},
			rot = 0,
			trackType = "straight",
		},
		[58] = {
			pos = {
				[1] = 5,
				[2] = 0,
			},
			rot = 0,
			trackType = "straight",
		},
		[59] = {
			pos = {
				[1] = 11,
				[2] = 3,
			},
			rot = 3,
			trackType = "curve",
		},
		[60] = {
			pos = {
				[1] = 11,
				[2] = 2,
			},
			rot = 1,
			trackType = "curve",
		},
		[61] = {
			pos = {
				[1] = 13,
				[2] = 3,
			},
			rot = 1,
			trackType = "curve",
		},
	},
	baseCarriages = 1,
	humanName = "Oreful",
	doodads = {
		[1] = {
			doodadType = "forest",
			pos = {
				[2] = 6.0381774902344,
				[1] = 4.939200376853,
			},
		},
		[2] = {
			doodadType = "forest",
			pos = {
				[2] = 5.9745162572616,
				[1] = 3.7423674754607,
			},
		},
		[3] = {
			doodadType = "forest",
			pos = {
				[2] = 5.9617841671675,
				[1] = 2.6601245586689,
			},
		},
		[4] = {
			doodadType = "forest",
			pos = {
				[2] = 5.9363192044772,
				[1] = 1.6288107847556,
			},
		},
		[5] = {
			doodadType = "forest",
			pos = {
				[2] = 6.0254454001402,
				[1] = 0.54656786796374,
			},
		},
		[6] = {
			doodadType = "forest",
			pos = {
				[2] = 5.9999804374499,
				[1] = -0.70119437193259,
			},
		},
		[7] = {
			doodadType = "forest",
			pos = {
				[2] = 4.9177379119091,
				[1] = -0.077313154171675,
			},
		},
		[8] = {
			doodadType = "forest",
			pos = {
				[2] = 3.5935825445713,
				[1] = -1.0958948379908,
			},
		},
		[9] = {
			doodadType = "forest",
			pos = {
				[2] = 4.7267542129908,
				[1] = -1.1468237852439,
			},
		},
		[10] = {
			doodadType = "forest",
			pos = {
				[2] = 7.0440266927083,
				[1] = -0.65026542467949,
			},
		},
		[11] = {
			doodadType = "forest",
			pos = {
				[2] = 5.6307451297075,
				[1] = -1.6179177699945,
			},
		},
		[12] = {
			doodadType = "forest",
			pos = {
				[2] = 8.1390020908454,
				[1] = -1.0958948379908,
			},
		},
		[13] = {
			doodadType = "forest",
			pos = {
				[2] = 9.1321192032252,
				[1] = -0.66299751477364,
			},
		},
		[14] = {
			doodadType = "forest",
			pos = {
				[2] = 6.929436316857,
				[1] = 4.7354845878405,
			},
		},
		[15] = {
			doodadType = "forest",
			pos = {
				[2] = 8.2408603766026,
				[1] = 4.7991458208133,
			},
		},
		[16] = {
			doodadType = "forest",
			pos = {
				[2] = 7.4769240159255,
				[1] = 2.8129119873047,
			},
		},
		[17] = {
			doodadType = "forest",
			pos = {
				[2] = 7.6679077148438,
				[1] = 1.1831813714443,
			},
		},
		[18] = {
			doodadType = "forest",
			pos = {
				[2] = 9.2721737592648,
				[1] = 0.53383577786959,
			},
		},
		[19] = {
			doodadType = "forest",
			pos = {
				[2] = 9.3867641351162,
				[1] = 1.7052044990735,
			},
		},
		[20] = {
			doodadType = "forest",
			pos = {
				[2] = 9.5650157439403,
				[1] = 2.8511086488381,
			},
		},
		[21] = {
			doodadType = "forest",
			pos = {
				[2] = 9.4376932779948,
				[1] = 4.2134610689603,
			},
		},
		[22] = {
			doodadType = "forest",
			pos = {
				[2] = 9.4249611879006,
				[1] = 4.9901295197316,
			},
		},
		[23] = {
			doodadType = "forest",
			pos = {
				[2] = 9.0175288273738,
				[1] = 6.0087115948017,
			},
		},
		[24] = {
			doodadType = "forest",
			pos = {
				[2] = 8.0371438050881,
				[1] = 5.9195853991386,
			},
		},
		[25] = {
			doodadType = "forest",
			pos = {
				[2] = 8.9665996844952,
				[1] = 7.0782220302484,
			},
		},
		[26] = {
			doodadType = "forest",
			pos = {
				[2] = 9.9979130671575,
				[1] = 8.1604645557893,
			},
		},
		[27] = {
			doodadType = "forest",
			pos = {
				[2] = 9.8705906012119,
				[1] = 6.9381666917067,
			},
		},
		[28] = {
			doodadType = "forest",
			pos = {
				[2] = 9.8451256385216,
				[1] = 5.9068533090445,
			},
		},
		[29] = {
			doodadType = "grass",
			pos = {
				[2] = 5.5670838967348,
				[1] = 0.95400061974159,
			},
		},
		[30] = {
			doodadType = "grass",
			pos = {
				[2] = 5.7453355055589,
				[1] = 3.7296353853666,
			},
		},
		[31] = {
			doodadType = "grass",
			pos = {
				[2] = 6.929436316857,
				[1] = 5.5248851287059,
			},
		},
		[32] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 8.7246860601963,
				[1] = 10.083036765074,
			},
		},
		[33] = {
			doodadType = "mountain_small",
			pos = {
				[2] = 8.699221880008,
				[1] = 9.0262592022236,
			},
		},
		[34] = {
			doodadType = "mountain_small",
			pos = {
				[2] = 8.9029384515224,
				[1] = 10.732383532402,
			},
		},
		[35] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 9.5140873835637,
				[1] = 9.5228177584135,
			},
		},
		[36] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 9.6159448868189,
				[1] = 10.897903051132,
			},
		},
		[37] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.2064832051595,
				[1] = 6.3270177596655,
			},
		},
		[38] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.8048998514811,
				[1] = 6.4034118652344,
			},
		},
		[39] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.0536959721492,
				[1] = 4.0861386030148,
			},
		},
		[40] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -1.104625017215,
				[1] = 5.2065781813401,
			},
		},
		[41] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.5375221448067,
				[1] = 5.8813883463542,
			},
		},
		[42] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -1.7157739492563,
				[1] = 5.2829722869091,
			},
		},
		[43] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -1.6393804305639,
				[1] = 4.1116035657051,
			},
		},
		[44] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -1.0918928293081,
				[1] = 3.1312185434195,
			},
		},
		[45] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -1.2574122502254,
				[1] = 1.998046483749,
			},
		},
		[46] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -0.30249219063001,
				[1] = 0.89033938676883,
			},
		},
		[47] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -0.93910559629783,
				[1] = 0.71208738669371,
			},
		},
		[48] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -0.27702761919071,
				[1] = -0.12824229705028,
			},
		},
		[49] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 0.67789263603015,
				[1] = -0.15370686848958,
			},
		},
		[50] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 1.6964739285983,
				[1] = -1.0449656951122,
			},
		},
		[51] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 0.80521529760116,
				[1] = -1.1595560709635,
			},
		},
		[52] = {
			doodadType = "mountain_large",
			pos = {
				[2] = 2.5240715222481,
				[1] = -1.0322334093925,
			},
		},
		[53] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -0.060578957582131,
				[1] = -1.1340914995242,
			},
		},
		[54] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -0.74812150612856,
				[1] = -1.0449656951122,
			},
		},
		[55] = {
			doodadType = "mountain_small",
			pos = {
				[2] = 0.61423120743189,
				[1] = -0.93037531926082,
			},
		},
		[56] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.2319477765988,
				[1] = -0.17917143992889,
			},
		},
		[57] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.7157739492563,
				[1] = 1.4505591759315,
			},
		},
		[58] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -0.55713751377204,
				[1] = 0.38104834923377,
			},
		},
		[59] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.7157739492563,
				[1] = 2.2399597167969,
			},
		},
		[60] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.8940257537059,
				[1] = 3.2076122577374,
			},
		},
		[61] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.7412385206956,
				[1] = 0.77574861966647,
			},
		},
		[62] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.7157739492563,
				[1] = -0.39561990591196,
			},
		},
		[63] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.6139158591246,
				[1] = -1.5033273941431,
			},
		},
		[64] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.7921675657615,
				[1] = -1.0449656951122,
			},
		},
		[65] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.9576870844914,
				[1] = 0.6356936723758,
			},
		},
		[66] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.8685611822666,
				[1] = 1.9725819123097,
			},
		},
		[67] = {
			doodadType = "grass",
			pos = {
				[2] = 3.9076522435897,
				[1] = 15.760817307692,
			},
		},
		[68] = {
			doodadType = "forest",
			pos = {
				[2] = 9.1448512933193,
				[1] = 7.969480856871,
			},
		},
		[69] = {
			doodadType = "forest",
			pos = {
				[2] = 5.7985166892027,
				[1] = 15.299430651542,
			},
		},
		[70] = {
			doodadType = "forest",
			pos = {
				[2] = 7.0353260529347,
				[1] = 14.458881084736,
			},
		},
		[71] = {
			doodadType = "forest",
			pos = {
				[2] = 7.9839469714042,
				[1] = 13.065969613882,
			},
		},
		[72] = {
			doodadType = "grass",
			pos = {
				[2] = 7.5156398675381,
				[1] = 13.510260166266,
			},
		},
		[73] = {
			doodadType = "grass",
			pos = {
				[2] = 6.3989093487079,
				[1] = 14.386834560296,
			},
		},
		[74] = {
			doodadType = "grass",
			pos = {
				[2] = 5.5463515061599,
				[1] = 15.431518554688,
			},
		},
		[75] = {
			doodadType = "forest",
			pos = {
				[2] = 9.1727247971755,
				[1] = 12.369513095954,
			},
		},
		[76] = {
			doodadType = "forest",
			pos = {
				[2] = 9.4248899802183,
				[1] = 13.642346504407,
			},
		},
		[77] = {
			doodadType = "grass",
			pos = {
				[2] = 8.488276554988,
				[1] = 14.374826284555,
			},
		},
		[78] = {
			doodadType = "grass",
			pos = {
				[2] = 7.6837502504006,
				[1] = 15.419510278946,
			},
		},
		[79] = {
			doodadType = "grass",
			pos = {
				[2] = 9.6770551632612,
				[1] = 14.891164926382,
			},
		},
		[80] = {
			doodadType = "grass",
			pos = {
				[2] = 9.0646542280148,
				[1] = 12.261443309295,
			},
		},
		[81] = {
			doodadType = "forest",
			pos = {
				[2] = 7.839852357522,
				[1] = 15.611636430789,
			},
		},
		[82] = {
			doodadType = "forest",
			pos = {
				[2] = 6.5790272248097,
				[1] = 15.707697941707,
			},
		},
		[83] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -1.502261919853,
				[1] = 7.2301510541867,
			},
		},
		[84] = {
			doodadType = "forest",
			pos = {
				[2] = -0.87785319792919,
				[1] = 8.2868417593149,
			},
		},
		[85] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -2.0546234326485,
				[1] = 8.2988500350561,
			},
		},
		[86] = {
			doodadType = "forest",
			pos = {
				[2] = -1.2500968346229,
				[1] = 9.5476668920272,
			},
		},
		[87] = {
			doodadType = "forest",
			pos = {
				[2] = -0.92588463807717,
				[1] = 11.06065642528,
			},
		},
		[88] = {
			doodadType = "forest",
			pos = {
				[2] = -1.1540339543269,
				[1] = 12.093333708934,
			},
		},
		[89] = {
			doodadType = "forest",
			pos = {
				[2] = -1.3221440437513,
				[1] = 13.570299979968,
			},
		},
		[90] = {
			doodadType = "forest",
			pos = {
				[2] = -1.0459632873535,
				[1] = 14.807108561198,
			},
		},
		[91] = {
			doodadType = "forest",
			pos = {
				[2] = 0.070767720540365,
				[1] = 15.359470465244,
			},
		},
		[92] = {
			doodadType = "grass",
			pos = {
				[2] = -0.66171176616962,
				[1] = 14.771085298978,
			},
		},
		[93] = {
			doodadType = "grass",
			pos = {
				[2] = -1.0579710740309,
				[1] = 13.270102476462,
			},
		},
		[94] = {
			doodadType = "grass",
			pos = {
				[2] = -0.90186896690956,
				[1] = 10.436249561799,
			},
		},
		[95] = {
			doodadType = "grass",
			pos = {
				[2] = -0.57765677036383,
				[1] = 8.8392036633614,
			},
		},
		[96] = {
			doodadType = "grass",
			pos = {
				[2] = -0.85383752676157,
				[1] = 11.865184294872,
			},
		},
		[97] = {
			doodadType = "forest",
			pos = {
				[2] = 9.72508591872,
				[1] = 15.575611603566,
			},
		},
		[98] = {
			doodadType = "grass",
			pos = {
				[2] = 8.8845363519131,
				[1] = 15.875809107071,
			},
		},
		[99] = {
			doodadType = "forest",
			pos = {
				[2] = 9.0886699969952,
				[1] = 15.347462189503,
			},
		},
		[100] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -2.1026548727965,
				[1] = 7.1581029647436,
			},
		},
		[101] = {
			doodadType = "mountain_small",
			pos = {
				[2] = -2.0666313171387,
				[1] = -0.22673015105419,
			},
		},
		[102] = {
			doodadType = "mountain_large",
			pos = {
				[2] = -0.99793184720553,
				[1] = -1.487555479392,
			},
		},
		[103] = {
			doodadType = "forest",
			pos = {
				[2] = 8.8244965382111,
				[1] = 11.192742763421,
			},
		},
		[104] = {
			doodadType = "forest",
			pos = {
				[2] = 9.9532353327825,
				[1] = 12.021285619491,
			},
		},
		[105] = {
			doodadType = "forest",
			pos = {
				[2] = 4.0093454214243,
				[1] = 15.94785563151,
			},
		},
		[106] = {
			doodadType = "forest",
			pos = {
				[2] = 1.283561315292,
				[1] = 15.839785844852,
			},
		},
		[107] = {
			doodadType = "forest",
			pos = {
				[2] = -2.0666313171387,
				[1] = 10.880538549179,
			},
		},
		[108] = {
			doodadType = "forest",
			pos = {
				[2] = -2.1026548727965,
				[1] = 15.527580065605,
			},
		},
		[109] = {
			doodadType = "forest",
			pos = {
				[2] = 10.535957532051,
				[1] = 14.887319711538,
			},
		},
		[110] = {
			doodadType = "grass",
			pos = {
				[2] = 1.0302485930614,
				[1] = 15.777944711538,
			},
		},
	},
	dimensions = {
		height = 10,
		tileSize = 156,
		vertOffset = 55,
		width = 16,
	},
	townDrawParams = {
		pos = {
			[1] = 0.01,
			[2] = -1.58,
		},
		font = 0,
	},
}

return mapData
