
local mapData = {
	rules = {
		shopState = {
			"crowbar",
			"straight",
			"curve",
		},
		hints = {
			{
				text = "- A new train exits the portal every 10 seconds! (After your first move)\n- You lose if the portal is blocked.",
				pos = {0.4, 0.4},
				size = {3.45, 2.05},
				arrow = "mid",
				arrowDest = {1.55, 5}
			},
			{
				text = "- You can refresh the shop every 10 seconds.\n- A crowbar can remove unwanted track.",
				pos = {10, 6.4},
				size = {3.3, 1.6},
				arrow = "midRight",
				arrowDest = {14.5, 7.08},
			},
			{
				text = "- Maybe restart (with 'ctrl+r') if too many trains are stuck.",
				pos = {11.08, 0},
				size = {2.4, 1.65},
			},
		}
	},
	humanName = "Woody",
	track = {
		[1] = {
			pos = {
				[1] = 1,
				[2] = 5,
			},
			trackType = "factory",
			rot = 0,
		},
		[2] = {
			pos = {
				[1] = 2,
				[2] = 5,
			},
			trackType = "curve",
			rot = 1,
		},
		[3] = {
			pos = {
				[1] = 2,
				[2] = 6,
			},
			trackType = "curve",
			rot = 3,
		},
		[4] = {
			pos = {
				[1] = 3,
				[2] = 6,
			},
			trackType = "curve",
			rot = 2,
		},
		[5] = {
			pos = {
				[1] = 3,
				[2] = 5,
			},
			trackType = "straight",
			rot = 3,
		},
		[6] = {
			pos = {
				[1] = 3,
				[2] = 4,
			},
			trackType = "curve",
			rot = 0,
		},
		[7] = {
			pos = {
				[1] = 8,
				[2] = 1,
			},
			setData = {
				progression = {
					[1] = {
						good = "wood",
						count = 3,
					},
				},
			},
			trackType = "town",
			rot = 0,
		},
		[8] = {
			pos = {
				[1] = 7,
				[2] = 5,
			},
			trackType = "sawmill",
			rot = 0,
		},
		[9] = {
			pos = {
				[1] = 3,
				[2] = 2,
			},
			trackType = "block",
			rot = 0,
		},
		[10] = {
			pos = {
				[1] = 3,
				[2] = 1,
			},
			trackType = "block",
			rot = 0,
		},
		[11] = {
			pos = {
				[1] = 3,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[12] = {
			pos = {
				[1] = 4,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[13] = {
			pos = {
				[1] = 5,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[14] = {
			pos = {
				[1] = 6,
				[2] = -1,
			},
			trackType = "block",
			rot = 0,
		},
		[15] = {
			pos = {
				[1] = 5,
				[2] = -1,
			},
			trackType = "block",
			rot = 0,
		},
		[16] = {
			pos = {
				[1] = 2,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[17] = {
			pos = {
				[1] = 1,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[18] = {
			pos = {
				[1] = 0,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[19] = {
			pos = {
				[1] = 0,
				[2] = 1,
			},
			trackType = "block",
			rot = 0,
		},
		[20] = {
			pos = {
				[1] = 2,
				[2] = 1,
			},
			trackType = "block",
			rot = 0,
		},
		[21] = {
			pos = {
				[1] = 2,
				[2] = 2,
			},
			trackType = "block",
			rot = 0,
		},
		[22] = {
			pos = {
				[1] = 10,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[23] = {
			pos = {
				[1] = 9,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[24] = {
			pos = {
				[1] = 11,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[25] = {
			pos = {
				[1] = 12,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[26] = {
			pos = {
				[1] = 11,
				[2] = 1,
			},
			trackType = "block",
			rot = 0,
		},
		[27] = {
			pos = {
				[1] = 12,
				[2] = 1,
			},
			trackType = "block",
			rot = 0,
		},
		[28] = {
			pos = {
				[1] = 12,
				[2] = 2,
			},
			trackType = "block",
			rot = 0,
		},
		[29] = {
			pos = {
				[1] = 13,
				[2] = 1,
			},
			trackType = "block",
			rot = 0,
		},
		[30] = {
			pos = {
				[1] = 13,
				[2] = 0,
			},
			trackType = "block",
			rot = 0,
		},
		[31] = {
			pos = {
				[1] = 13,
				[2] = 2,
			},
			trackType = "block",
			rot = 0,
		},
		[32] = {
			pos = {
				[1] = 13,
				[2] = 3,
			},
			trackType = "block",
			rot = 0,
		},
		[33] = {
			pos = {
				[1] = 13,
				[2] = 4,
			},
			trackType = "block",
			rot = 0,
		},
		[34] = {
			pos = {
				[1] = 13,
				[2] = 5,
			},
			trackType = "block",
			rot = 0,
		},
		[35] = {
			pos = {
				[1] = 13,
				[2] = 6,
			},
			trackType = "block",
			rot = 0,
		},
		[36] = {
			pos = {
				[1] = 12,
				[2] = 6,
			},
			trackType = "block",
			rot = 0,
		},
		[37] = {
			pos = {
				[1] = 11,
				[2] = 6,
			},
			trackType = "block",
			rot = 0,
		},
		[38] = {
			pos = {
				[1] = 10,
				[2] = 6,
			},
			trackType = "block",
			rot = 0,
		},
		[39] = {
			pos = {
				[1] = 10,
				[2] = 7,
			},
			trackType = "block",
			rot = 0,
		},
		[40] = {
			pos = {
				[1] = 11,
				[2] = 7,
			},
			trackType = "block",
			rot = 0,
		},
		[41] = {
			pos = {
				[1] = 12,
				[2] = 7,
			},
			trackType = "block",
			rot = 0,
		},
		[42] = {
			pos = {
				[1] = 13,
				[2] = 7,
			},
			trackType = "block",
			rot = 0,
		},
		[43] = {
			pos = {
				[1] = 1,
				[2] = 7,
			},
			trackType = "block",
			rot = 0,
		},
		[44] = {
			pos = {
				[1] = 1,
				[2] = 6,
			},
			trackType = "block",
			rot = 0,
		},
		[45] = {
			pos = {
				[1] = 0,
				[2] = 6,
			},
			trackType = "block",
			rot = 0,
		},
		[46] = {
			pos = {
				[1] = 0,
				[2] = 7,
			},
			trackType = "block",
			rot = 0,
		},
		[47] = {
			pos = {
				[1] = 0,
				[2] = 5,
			},
			trackType = "block",
			rot = 0,
		},
		[48] = {
			pos = {
				[1] = 0,
				[2] = 4,
			},
			trackType = "block",
			rot = 0,
		},
		[49] = {
			pos = {
				[1] = 1,
				[2] = 4,
			},
			trackType = "block",
			rot = 0,
		},
		[50] = {
			pos = {
				[1] = 3,
				[2] = 3,
			},
			trackType = "block",
			rot = 0,
		},
		[51] = {
			pos = {
				[1] = 2,
				[2] = 3,
			},
			trackType = "block",
			rot = 0,
		},
		[52] = {
			pos = {
				[1] = 1,
				[2] = 3,
			},
			trackType = "block",
			rot = 0,
		},
		[53] = {
			pos = {
				[1] = 1,
				[2] = 2,
			},
			trackType = "block",
			rot = 0,
		},
		[54] = {
			pos = {
				[1] = 0,
				[2] = 2,
			},
			trackType = "block",
			rot = 0,
		},
		[55] = {
			pos = {
				[1] = 0,
				[2] = 3,
			},
			trackType = "block",
			rot = 0,
		},
		[56] = {
			pos = {
				[1] = 7,
				[2] = 4,
			},
			trackType = "block",
			rot = 0,
		},
		[57] = {
			pos = {
				[1] = 7,
				[2] = 3,
			},
			trackType = "block",
			rot = 0,
		},
		[58] = {
			pos = {
				[1] = 8,
				[2] = 5,
			},
			trackType = "straight",
			rot = 0,
		},
		[59] = {
			pos = {
				[1] = 9,
				[2] = 5,
			},
			trackType = "curve",
			rot = 2,
		},
		[60] = {
			pos = {
				[1] = 9,
				[2] = 1,
			},
			trackType = "curve",
			rot = 1,
		},
	},
	dimensions = {
		width = 14,
		height = 8,
		vertOffset = 55,
		tileSize = 180,
	},
	townDrawParams = {
		font = 0,
		pos = {
			[1] = 0.01,
			[2] = -1.58,
		},
	},
	doodads = {
		[1] = {
			pos = {
				[1] = 10.15060696072,
				[2] = -0.097099134657118,
			},
			doodadType = "forest",
		},
		[2] = {
			pos = {
				[1] = 11.044411892361,
				[2] = 0.63118659125434,
			},
			doodadType = "mountain_small",
		},
		[3] = {
			pos = {
				[1] = 11.99338921441,
				[2] = 1.635338168674,
			},
			doodadType = "mountain_small",
		},
		[4] = {
			pos = {
				[1] = 7.0167704264323,
				[2] = 3.9857150607639,
			},
			doodadType = "forest",
		},
		[5] = {
			pos = {
				[1] = 6.9505628797743,
				[2] = 2.9594943576389,
			},
			doodadType = "forest",
		},
		[6] = {
			pos = {
				[1] = 9.2347323947483,
				[2] = -0.11916842990451,
			},
			doodadType = "forest",
		},
		[7] = {
			pos = {
				[1] = 11.772696940104,
				[2] = 0.26704372829861,
			},
			doodadType = "mountain_large",
		},
		[8] = {
			pos = {
				[1] = 12.269257269965,
				[2] = -0.15227237277561,
			},
			doodadType = "mountain_large",
		},
		[9] = {
			pos = {
				[1] = 12.865125868056,
				[2] = 1.1718836466471,
			},
			doodadType = "mountain_large",
		},
		[10] = {
			pos = {
				[1] = 13.372718641493,
				[2] = 0.21187049018012,
			},
			doodadType = "mountain_large",
		},
		[11] = {
			pos = {
				[1] = 13.472032335069,
				[2] = -0.6929694281684,
			},
			doodadType = "mountain_large",
		},
		[12] = {
			pos = {
				[1] = 12.313395182292,
				[2] = -0.63779619004991,
			},
			doodadType = "mountain_small",
		},
		[13] = {
			pos = {
				[1] = 11.629248046875,
				[2] = 0.56497870551215,
			},
			doodadType = "mountain_small",
		},
		[14] = {
			pos = {
				[1] = 13.25133734809,
				[2] = 0.94015621609158,
			},
			doodadType = "mountain_small",
		},
		[15] = {
			pos = {
				[1] = 11.607177734375,
				[2] = -0.41710357666016,
			},
			doodadType = "mountain_large",
		},
		[16] = {
			pos = {
				[1] = 11.044411892361,
				[2] = -1.024008348253,
			},
			doodadType = "mountain_large",
		},
		[17] = {
			pos = {
				[1] = 10.12853664822,
				[2] = -1.4984976026747,
			},
			doodadType = "mountain_large",
		},
		[18] = {
			pos = {
				[1] = 12.611330837674,
				[2] = -1.3440127902561,
			},
			doodadType = "mountain_large",
		},
		[19] = {
			pos = {
				[1] = 11.585110134549,
				[2] = -1.5978093465169,
			},
			doodadType = "mountain_large",
		},
		[20] = {
			pos = {
				[1] = 10.757510715061,
				[2] = -1.7633288065592,
			},
			doodadType = "mountain_large",
		},
		[21] = {
			pos = {
				[1] = 11.640283203125,
				[2] = -1.2557356940375,
			},
			doodadType = "mountain_large",
		},
		[22] = {
			pos = {
				[1] = 9.3230095757378,
				[2] = -1.6529824150933,
			},
			doodadType = "mountain_small",
		},
		[23] = {
			pos = {
				[1] = 9.2678365071615,
				[2] = -1.4212551540799,
			},
			doodadType = "mountain_small",
		},
		[24] = {
			pos = {
				[1] = 8.4623074001736,
				[2] = -1.7191903008355,
			},
			doodadType = "mountain_small",
		},
		[25] = {
			pos = {
				[1] = 7.4471211751302,
				[2] = -1.2667703416612,
			},
			doodadType = "forest",
		},
		[26] = {
			pos = {
				[1] = 6.255381266276,
				[2] = -1.167458597819,
			},
			doodadType = "forest",
		},
		[27] = {
			pos = {
				[1] = 3.0774068196615,
				[2] = -1.4102205064562,
			},
			doodadType = "forest",
		},
		[28] = {
			pos = {
				[1] = 3.0994757758247,
				[2] = -0.71503863864475,
			},
			doodadType = "forest",
		},
		[29] = {
			pos = {
				[1] = 4.1146620008681,
				[2] = -1.4984976026747,
			},
			doodadType = "forest",
		},
		[30] = {
			pos = {
				[1] = 4.269147406684,
				[2] = -0.74814258151584,
			},
			doodadType = "forest",
		},
		[31] = {
			pos = {
				[1] = 4.3022508409288,
				[2] = 0.11255883110894,
			},
			doodadType = "forest",
		},
		[32] = {
			pos = {
				[1] = 3.1325798882378,
				[2] = 0.035316467285156,
			},
			doodadType = "forest",
		},
		[33] = {
			pos = {
				[1] = 6.387796359592,
				[2] = 7.7926635742188,
			},
			doodadType = "mountain_large",
		},
		[34] = {
			pos = {
				[1] = 7.5243638780382,
				[2] = 7.8699055989583,
			},
			doodadType = "mountain_large",
		},
		[35] = {
			pos = {
				[1] = 8.5395501030816,
				[2] = 7.8809400770399,
			},
			doodadType = "mountain_large",
		},
		[36] = {
			pos = {
				[1] = 6.7740085177951,
				[2] = 7.8478366427951,
			},
			doodadType = "mountain_small",
		},
		[37] = {
			pos = {
				[1] = 7.7450568305122,
				[2] = 7.5499009874132,
			},
			doodadType = "mountain_small",
		},
		[38] = {
			pos = {
				[1] = 5.9684807671441,
				[2] = 8.1237019856771,
			},
			doodadType = "mountain_small",
		},
		[39] = {
			pos = {
				[1] = 6.7960781521267,
				[2] = 8.2230136447483,
			},
			doodadType = "mountain_small",
		},
		[40] = {
			pos = {
				[1] = 7.3698791503906,
				[2] = 8.3774990505642,
			},
			doodadType = "mountain_small",
		},
		[41] = {
			pos = {
				[1] = 8.6388624403212,
				[2] = 8.2781873914931,
			},
			doodadType = "mountain_large",
		},
		[42] = {
			pos = {
				[1] = 9.6871520996094,
				[2] = 8.2671522352431,
			},
			doodadType = "mountain_small",
		},
		[43] = {
			pos = {
				[1] = 9.3230095757378,
				[2] = 8.0023213704427,
			},
			doodadType = "mountain_small",
		},
		[44] = {
			pos = {
				[1] = 13.516170247396,
				[2] = -1.3771166483561,
			},
			doodadType = "mountain_large",
		},
		[45] = {
			pos = {
				[1] = 14.906532118056,
				[2] = -1.4433244493273,
			},
			doodadType = "mountain_large",
		},
		[46] = {
			pos = {
				[1] = 13.240304904514,
				[2] = 1.8339614868164,
			},
			doodadType = "mountain_large",
		},
		[47] = {
			pos = {
				[1] = 13.107888454861,
				[2] = 2.7939744737413,
			},
			doodadType = "mountain_large",
		},
		[48] = {
			pos = {
				[1] = 13.152026367188,
				[2] = 3.9526109483507,
			},
			doodadType = "forest",
		},
		[49] = {
			pos = {
				[1] = 13.052715386285,
				[2] = 4.9126241048177,
			},
			doodadType = "forest",
		},
		[50] = {
			pos = {
				[1] = 9.9740525987413,
				[2] = 5.8947062174479,
			},
			doodadType = "forest",
		},
		[51] = {
			pos = {
				[1] = 9.775429280599,
				[2] = 6.8878234863281,
			},
			doodadType = "forest",
		},
		[52] = {
			pos = {
				[1] = 11.110620117187,
				[2] = 5.9498792860243,
			},
			doodadType = "forest",
		},
		[53] = {
			pos = {
				[1] = 12.291324869792,
				[2] = 5.7843600802951,
			},
			doodadType = "forest",
		},
		[54] = {
			pos = {
				[1] = 10.967168511285,
				[2] = 6.8436848958333,
			},
			doodadType = "forest",
		},
		[55] = {
			pos = {
				[1] = 12.489949544271,
				[2] = 6.8326504177517,
			},
			doodadType = "forest",
		},
		[56] = {
			pos = {
				[1] = 13.174096679687,
				[2] = 6.0160875108507,
			},
			doodadType = "forest",
		},
		[57] = {
			pos = {
				[1] = 10.812685139974,
				[2] = 7.9802517361111,
			},
			doodadType = "forest",
		},
		[58] = {
			pos = {
				[1] = 11.585110134549,
				[2] = 8.0243903266059,
			},
			doodadType = "forest",
		},
		[59] = {
			pos = {
				[1] = 2.0842898898655,
				[2] = 0.94015621609158,
			},
			doodadType = "forest",
		},
		[60] = {
			pos = {
				[1] = 3.0553371853299,
				[2] = 0.92912173800998,
			},
			doodadType = "forest",
		},
		[61] = {
			pos = {
				[1] = 3.0111992730035,
				[2] = 2.098792690701,
			},
			doodadType = "forest",
		},
		[62] = {
			pos = {
				[1] = 2.0401512993707,
				[2] = 2.0325848049588,
			},
			doodadType = "forest",
		},
		[63] = {
			pos = {
				[1] = 2.1946360270182,
				[2] = 3.1029446072049,
			},
			doodadType = "forest",
		},
		[64] = {
			pos = {
				[1] = 0.91461859809028,
				[2] = 2.9484592013889,
			},
			doodadType = "forest",
		},
		[65] = {
			pos = {
				[1] = 0.92565341525608,
				[2] = 2.1318968031141,
			},
			doodadType = "forest",
		},
		[66] = {
			pos = {
				[1] = -0.37643347846137,
				[2] = 1.9443079630534,
			},
			doodadType = "forest",
		},
		[67] = {
			pos = {
				[1] = -0.81781870524089,
				[2] = 1.811892191569,
			},
			doodadType = "forest",
		},
		[68] = {
			pos = {
				[1] = -0.56402214898003,
				[2] = 0.57601335313585,
			},
			doodadType = "forest",
		},
		[69] = {
			pos = {
				[1] = 1.7863545735677,
				[2] = -0.2074456108941,
			},
			doodadType = "forest",
		},
		[70] = {
			pos = {
				[1] = 0.53944125705295,
				[2] = 0.73049825032552,
			},
			doodadType = "forest",
		},
		[71] = {
			pos = {
				[1] = 0.8263417561849,
				[2] = -0.53848453097873,
			},
			doodadType = "forest",
		},
		[72] = {
			pos = {
				[1] = 1.6980777316623,
				[2] = -1.2115971883138,
			},
			doodadType = "forest",
		},
		[73] = {
			pos = {
				[1] = 0.3077138264974,
				[2] = -1.024008348253,
			},
			doodadType = "forest",
		},
		[74] = {
			pos = {
				[1] = -0.34332953559028,
				[2] = -0.31779191758898,
			},
			doodadType = "forest",
		},
		[75] = {
			pos = {
				[1] = -0.7295416937934,
				[2] = -1.0460776435004,
			},
			doodadType = "forest",
		},
		[76] = {
			pos = {
				[1] = -0.90609571668837,
				[2] = -0.49434594048394,
			},
			doodadType = "forest",
		},
		[77] = {
			pos = {
				[1] = 4.9091559516059,
				[2] = -0.13020307752821,
			},
			doodadType = "forest",
		},
		[78] = {
			pos = {
				[1] = 4.8981214735243,
				[2] = -1.1233200920953,
			},
			doodadType = "forest",
		},
		[79] = {
			pos = {
				[1] = 11.960286458333,
				[2] = 5.0450398763021,
			},
			doodadType = "grass",
		},
		[80] = {
			pos = {
				[1] = 9.3119744194878,
				[2] = 6.501611328125,
			},
			doodadType = "grass",
		},
		[81] = {
			pos = {
				[1] = 6.2995198567708,
				[2] = 3.202256266276,
			},
			doodadType = "grass",
		},
		[82] = {
			pos = {
				[1] = 6.0126193576389,
				[2] = 3.9526109483507,
			},
			doodadType = "grass",
		},
		[83] = {
			pos = {
				[1] = 7.2484978569878,
				[2] = 2.9153557671441,
			},
			doodadType = "grass",
		},
		[84] = {
			pos = {
				[1] = 3.7615539550781,
				[2] = 7.4726589626736,
			},
			doodadType = "grass",
		},
		[85] = {
			pos = {
				[1] = 2.7684370252821,
				[2] = 2.529143608941,
			},
			doodadType = "grass",
		},
		[86] = {
			pos = {
				[1] = 6.7298706054688,
				[2] = -0.93573133680556,
			},
			doodadType = "grass",
		},
		[87] = {
			pos = {
				[1] = 2.415328640408,
				[2] = 6.4795416937934,
			},
			doodadType = "grass",
		},
		[88] = {
			pos = {
				[1] = 0.89254930284288,
				[2] = 3.8422648111979,
			},
			doodadType = "forest",
		},
		[89] = {
			pos = {
				[1] = -0.078498331705729,
				[2] = 3.0919094509549,
			},
			doodadType = "forest",
		},
		[90] = {
			pos = {
				[1] = -0.86195729573568,
				[2] = 2.8932861328125,
			},
			doodadType = "forest",
		},
		[91] = {
			pos = {
				[1] = -0.27712164984809,
				[2] = 3.9857150607639,
			},
			doodadType = "forest",
		},
		[92] = {
			pos = {
				[1] = 0.020813327365451,
				[2] = 4.9567626953125,
			},
			doodadType = "forest",
		},
		[93] = {
			pos = {
				[1] = 0.95875718858507,
				[2] = 6.0050530327691,
			},
			doodadType = "forest",
		},
		[94] = {
			pos = {
				[1] = 0.13115980360243,
				[2] = 5.9719489203559,
			},
			doodadType = "forest",
		},
		[95] = {
			pos = {
				[1] = -0.97230360243056,
				[2] = 3.9526109483507,
			},
			doodadType = "forest",
		},
		[96] = {
			pos = {
				[1] = -0.81781870524089,
				[2] = 5.2657321506076,
			},
			doodadType = "forest",
		},
		[97] = {
			pos = {
				[1] = -0.90609571668837,
				[2] = 6.2367797851563,
			},
			doodadType = "forest",
		},
		[98] = {
			pos = {
				[1] = -0.92816501193576,
				[2] = 7.461624484592,
			},
			doodadType = "forest",
		},
		[99] = {
			pos = {
				[1] = 0.20840216742622,
				[2] = 7.0864468044705,
			},
			doodadType = "forest",
		},
		[100] = {
			pos = {
				[1] = 1.1132419162326,
				[2] = 7.2188625759549,
			},
			doodadType = "forest",
		},
		[101] = {
			pos = {
				[1] = 2.205670844184,
				[2] = 7.6933512369792,
			},
			doodadType = "forest",
		},
		[102] = {
			pos = {
				[1] = 3.6291381835938,
				[2] = 7.8478366427951,
			},
			doodadType = "forest",
		},
		[103] = {
			pos = {
				[1] = 4.8870863172743,
				[2] = 7.8036980523003,
			},
			doodadType = "forest",
		},
		[104] = {
			pos = {
				[1] = 1.0470343695747,
				[2] = 8.2561177571615,
			},
			doodadType = "forest",
		},
		[105] = {
			pos = {
				[1] = -0.42057189941406,
				[2] = 8.3223253038194,
			},
			doodadType = "forest",
		},
		[106] = {
			pos = {
				[1] = 0.2635752360026,
				[2] = 7.9912868923611,
			},
			doodadType = "forest",
		},
		[107] = {
			pos = {
				[1] = 2.4484327528212,
				[2] = 8.4657755533854,
			},
			doodadType = "forest",
		},
		[108] = {
			pos = {
				[1] = 4.8981214735243,
				[2] = 8.6754340277778,
			},
			doodadType = "forest",
		},
		[109] = {
			pos = {
				[1] = 2.9449910481771,
				[2] = 2.9705288357205,
			},
			doodadType = "forest",
		},
	},
	baseCarriages = 1,
}

return mapData
