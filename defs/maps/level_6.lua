
local mapData = {
	humanName = "Trifecta",
	dimensions = {
		width = 18,
		height = 11,
		tileSize = 138,
		vertOffset = 20,
	},
	townDrawParams = {
		font = 0,
		pos = {0.01, -1.55}
	},
	baseCarriages = 1,
	track = {
		--{pos = {8, 1}, rot = 0, trackType = "town", setData = {progression = {
		--	{good = "wood", count = 3},
		--}}},
		
{pos = {12, 5}, rot = 0, trackType = "town", setData = {progression = {
		{good = "wood", count = 8}, {good = "wood", count = 8}}}},
{pos = {6, 2}, rot = 0, trackType = "town", setData = {progression = {
		{good = "food", count = 8}, {good = "food", count = 8}}}},
{pos = {6, 8}, rot = 0, trackType = "town", setData = {progression = {
		{good = "ore", count = 8}, {good = "ore", count = 8}}}},

{pos = {14, 1}, rot = 0, trackType = "mine"},
{pos = {2, 5}, rot = 0, trackType = "sawmill"},
{pos = {13, 9}, rot = 0, trackType = "farm"},
{pos = {8, 5}, rot = 0, trackType = "factory"},
{pos = {9, 5}, rot = 1, trackType = "curve"},
{pos = {9, 6}, rot = 2, trackType = "curve"},
{pos = {7, 6}, rot = 3, trackType = "curve"},
{pos = {7, 4}, rot = 0, trackType = "curve"},
{pos = {8, 4}, rot = 2, trackType = "straight"},
{pos = {7, 5}, rot = 3, trackType = "straight"},
{pos = {8, 6}, rot = 0, trackType = "straight"},
{pos = {9, 4}, rot = 0, trackType = "straight"},

{pos = {2, 1}, rot = 0, trackType = "block"},
{pos = {3, 0}, rot = 0, trackType = "block"},
{pos = {2, 0}, rot = 0, trackType = "block"},
{pos = {1, 0}, rot = 0, trackType = "block"},
{pos = {0, 0}, rot = 0, trackType = "block"},
{pos = {1, 1}, rot = 0, trackType = "block"},
{pos = {0, 1}, rot = 0, trackType = "block"},
{pos = {1, 2}, rot = 0, trackType = "block"},
{pos = {0, 2}, rot = 0, trackType = "block"},
{pos = {1, 4}, rot = 0, trackType = "block"},
{pos = {2, 4}, rot = 0, trackType = "block"},
{pos = {3, 4}, rot = 0, trackType = "block"},
{pos = {0, 7}, rot = 0, trackType = "block"},
{pos = {0, 8}, rot = 0, trackType = "block"},
{pos = {0, 9}, rot = 0, trackType = "block"},
{pos = {1, 8}, rot = 0, trackType = "block"},
{pos = {1, 9}, rot = 0, trackType = "block"},
{pos = {1, 10}, rot = 0, trackType = "block"},
{pos = {2, 10}, rot = 0, trackType = "block"},
{pos = {2, 9}, rot = 0, trackType = "block"},
{pos = {2, 8}, rot = 0, trackType = "block"},
{pos = {3, 10}, rot = 0, trackType = "block"},
{pos = {4, 10}, rot = 0, trackType = "block"},
{pos = {13, 8}, rot = 0, trackType = "block"},
{pos = {14, 8}, rot = 0, trackType = "block"},
{pos = {14, 7}, rot = 0, trackType = "block"},
{pos = {9, 0}, rot = 0, trackType = "block"},
{pos = {10, 0}, rot = 0, trackType = "block"},
{pos = {11, 0}, rot = 0, trackType = "block"},
{pos = {12, 0}, rot = 0, trackType = "block"},
{pos = {13, 0}, rot = 0, trackType = "block"},
{pos = {14, 0}, rot = 0, trackType = "block"},
{pos = {15, 0}, rot = 0, trackType = "block"},
{pos = {16, 0}, rot = 0, trackType = "block"},
{pos = {17, 0}, rot = 0, trackType = "block"},
{pos = {16, 1}, rot = 0, trackType = "block"},
{pos = {17, 1}, rot = 0, trackType = "block"},
{pos = {17, 2}, rot = 0, trackType = "block"},



	},
	doodads = {
{pos = {13.064191293025, 7.9064392974411}, doodadType = "field"},
{pos = {14.023534802423, 7.8923304461051}, doodadType = "field"},
{pos = {14.065859587296, 7.0176347373188}, doodadType = "field"},
{pos = {13.995318868886, -0.26208827806556}, doodadType = "mountain_small"},
{pos = {13.148839093637, -0.26208827806556}, doodadType = "mountain_large"},
{pos = {12.104847783628, -1.2919716765915}, doodadType = "mountain_large"},
{pos = {13.628511732903, -0.92516393246858}, doodadType = "mountain_small"},
{pos = {13.078300144361, -1.4048355765965}, doodadType = "mountain_large"},
{pos = {13.995318868886, -1.7716433760049}, doodadType = "mountain_small"},
{pos = {14.531423375226, -0.93927189923715}, doodadType = "mountain_large"},
{pos = {15.222714631454, -0.27619624483413}, doodadType = "mountain_large"},
{pos = {16.22438115659, 0.72547094372735}, doodadType = "mountain_large"},
{pos = {15.984546606091, -0.30441239951313}, doodadType = "mountain_small"},
{pos = {15.645953634511, -1.1367837657099}, doodadType = "mountain_large"},
{pos = {14.728934909986, -1.7293193651282}, doodadType = "mountain_small"},
{pos = {14.51731452389, -0.47370822187783}, doodadType = "mountain_small"},
{pos = {15.617737700974, -0.65711212158203}, doodadType = "mountain_small"},
{pos = {13.233486894248, -0.8546239880548}, doodadType = "mountain_small"},
{pos = {11.060857358186, -1.3342956321827}, doodadType = "mountain_large"},
{pos = {9.8193536288496, -1.3060796433601}, doodadType = "mountain_large"},
{pos = {10.270809450011, -1.4330515101336}, doodadType = "mountain_small"},
{pos = {8.4790950167006, -1.3201876654141}, doodadType = "mountain_large"},
{pos = {8.8882260529891, -1.6164555204087}, doodadType = "mountain_small"},
{pos = {7.1952673870584, -1.3060796433601}, doodadType = "mountain_large"},
{pos = {9.0857384723166, -0.24798031129699}, doodadType = "mountain_large"},
{pos = {6.1794920105865, -1.3484036542367}, doodadType = "mountain_large"},
{pos = {2.9346543464108, -0.27619624483413}, doodadType = "mountain_large"},
{pos = {3.1744902237602, -1.2637556877689}, doodadType = "mountain_large"},
{pos = {4.2890209253284, -1.3342956321827}, doodadType = "mountain_large"},
{pos = {5.0085289996603, -1.672887387483}, doodadType = "mountain_small"},
{pos = {5.1355007005774, -1.3484036542367}, doodadType = "mountain_large"},
{pos = {3.5554057687953, -1.5176995318869}, doodadType = "mountain_large"},
{pos = {7.8019108426744, -1.7857513427734}, doodadType = "mountain_large"},
{pos = {1.9047710031703, -0.19154844422271}, doodadType = "mountain_large"},
{pos = {2.0317427040874, -1.2355397542318}, doodadType = "mountain_large"},
{pos = {1.9894188037817, 0.69725501019022}, doodadType = "mountain_small"},
{pos = {1.4250992484715, 0.82422693224921}, doodadType = "mountain_large"},
{pos = {0.77613145026608, -0.36084426658741}, doodadType = "mountain_large"},
{pos = {2.2856865482054, -1.7152113983597}, doodadType = "mountain_large"},
{pos = {1.1147235372792, -1.3907276098279}, doodadType = "mountain_large"},
{pos = {-0.42304771533911, -1.4189435986505}, doodadType = "mountain_large"},
{pos = {-1.4529309480087, -1.4330515101336}, doodadType = "mountain_large"},
{pos = {0.15538002788157, -1.5882394763007}, doodadType = "mountain_large"},
{pos = {-0.29607579328012, -0.53014019952304}, doodadType = "mountain_large"},
{pos = {-1.2272031479988, -0.40316827746405}, doodadType = "mountain_large"},
{pos = {0.5080798605214, 0.34455517755039}, doodadType = "mountain_large"},
{pos = {-0.31018376004869, 0.37277133222939}, doodadType = "mountain_large"},
{pos = {0.028408105822577, 1.8117861540421}, doodadType = "forest"},
{pos = {1.0159673276155, 2.0234060978544}, doodadType = "forest"},
{pos = {0.141272061113, 1.5014104428499}, doodadType = "forest"},
{pos = {-0.93093540357507, 1.5296265975289}, doodadType = "forest"},
{pos = {-1.3259590259497, 0.38687929899796}, doodadType = "mountain_small"},
{pos = {2.0317427040874, 3.8715528405231}, doodadType = "forest"},
{pos = {1.1570474375849, 3.9844170169554}, doodadType = "forest"},
{pos = {-1.0720152924026, 2.7146977963655}, doodadType = "forest"},
{pos = {-0.98736727064934, 3.9279851498811}, doodadType = "forest"},
{pos = {-1.0014752374179, 4.9014361837636}, doodadType = "forest"},
{pos = {-1.0014752374179, 5.9172120025192}, doodadType = "forest"},
{pos = {3.0193021470222, 3.8715528405231}, doodadType = "forest"},
{pos = {2.0881745711617, 8.0616260473279}, doodadType = "forest"},
{pos = {1.1288315040478, 7.9910870980525}, doodadType = "forest"},
{pos = {-0.042131949162138, 6.9894188037817}, doodadType = "forest"},
{pos = {-1.0437991377236, 6.9753117215806}, doodadType = "forest"},
{pos = {0.098947939665421, 8.1180579144022}, doodadType = "forest"},
{pos = {0.15538002788157, 9.1338332908741}, doodadType = "forest"},
{pos = {-0.90271924889606, 8.0193030315897}, doodadType = "forest"},
{pos = {1.1288315040478, 8.9363217561141}, doodadType = "forest"},
{pos = {1.0441832611526, 9.9944219174592}, doodadType = "forest"},
{pos = {1.8906630364017, 10.135501585145}, doodadType = "forest"},
{pos = {2.8641140702842, 10.220149385756}, doodadType = "forest"},
{pos = {2.0881745711617, 9.119726208673}, doodadType = "forest"},
{pos = {3.8798894467561, 10.347120202106}, doodadType = "forest"},
{pos = {5.050852899966, 11.292356629303}, doodadType = "forest"},
{pos = {6.1512760770494, 11.334679645041}, doodadType = "forest"},
{pos = {3.851673513219, 11.306463711504}, doodadType = "forest"},
{pos = {2.6807105022928, 11.207708828691}, doodadType = "forest"},
{pos = {7.1952673870584, 11.405220363451}, doodadType = "forest"},
{pos = {8.2251507302989, 11.447543379189}, doodadType = "forest"},
{pos = {8.3380144644475, 11.137168110281}, doodadType = "forest"},
{pos = {7.1670514535213, 10.967872509058}, doodadType = "forest"},
{pos = {9.579518193784, 10.713929107224}, doodadType = "mountain_large"},
{pos = {9.3961137412251, 11.532192948936}, doodadType = "mountain_large"},
{pos = {10.214377582937, 11.292356629303}, doodadType = "mountain_small"},
{pos = {10.863344938859, 10.671604322351}, doodadType = "mountain_large"},
{pos = {10.933884772702, 11.419327445652}, doodadType = "mountain_small"},
{pos = {11.51231229478, 10.615172455276}, doodadType = "mountain_small"},
{pos = {9.8898934626925, 10.488201638927}, doodadType = "mountain_small"},
{pos = {11.808581366055, 11.306463711504}, doodadType = "mountain_large"},
{pos = {12.147172568501, 10.981979591259}, doodadType = "mountain_small"},
{pos = {12.175388502038, 10.474092787591}, doodadType = "mountain_small"},
{pos = {13.162947944973, 11.024304376132}, doodadType = "forest"},
{pos = {14.065859587296, 11.179492895154}, doodadType = "forest"},
{pos = {15.053419030231, 10.981979591259}, doodadType = "forest"},
{pos = {16.182058140851, 11.066629161005}, doodadType = "forest"},
{pos = {17.183724665987, 11.094845094543}, doodadType = "forest"},
{pos = {17.211940599524, 1.7553542869678}, doodadType = "mountain_large"},
{pos = {17.310697251472, 0.96530682107677}, doodadType = "mountain_large"},
{pos = {16.675837862319, -0.24798031129699}, doodadType = "mountain_small"},
{pos = {17.169617583786, -0.17744047745414}, doodadType = "mountain_large"},
{pos = {16.393676757813, -1.1226757989413}, doodadType = "mountain_small"},
{pos = {13.45921613168, -1.9127232648324}, doodadType = "mountain_small"},
{pos = {16.210274074389, -1.6869953542516}, doodadType = "mountain_large"},
{pos = {17.296588400136, -0.91105596570001}, doodadType = "mountain_large"},
{pos = {17.240156533062, -1.7293193651282}, doodadType = "mountain_small"},

{pos = {0.028408105822577, 3.1238297172215}, doodadType = "grass"},
{pos = {-0.2255357382954, 4.8591122834579}, doodadType = "grass"},
{pos = {0.86077969316123, 6.3968837572181}, doodadType = "grass"},
{pos = {1.9612028702446, 2.9122097734092}, doodadType = "grass"},
{pos = {5.967872509058, 10.417660920516}, doodadType = "grass"},
{pos = {3.6964858787647, 9.4865333446558}, doodadType = "grass"},
{pos = {3.7670257126076, 4.2806847613791}, doodadType = "grass"},
{pos = {16.464217476223, 10.149608667346}, doodadType = "grass"},
{pos = {14.743041992188, 10.530524654665}, doodadType = "grass"},
{pos = {7.8442347429801, 10.572849439538}, doodadType = "grass"},
{pos = {11.949661033741, -0.10690042246943}, doodadType = "forest"},
{pos = {10.962100706239, -0.121008389238}, doodadType = "forest"},
{pos = {10.397781150928, -0.10690042246943}, doodadType = "forest"},
{pos = {11.949661033741, 0.75368709840636}, doodadType = "grass"},
{pos = {10.28491741678, 0.92298292077106}, doodadType = "grass"},
{pos = {12.92311162534, 4.5064126719599}, doodadType = "grass"},
{pos = {6.9977558522985, 7.3562259397645}, doodadType = "grass"},
{pos = {6.9977558522985, 7.3562259397645}, doodadType = "grass"},
{pos = {5.459984820822, 7.1587144050045}, doodadType = "grass"},
{pos = {4.5288572449615, 0.35866336546082}, doodadType = "grass"},
{pos = {2.6101702261662, 2.2068101081295}, doodadType = "grass"},
{pos = {2.6383866019871, 7.9769782467165}, doodadType = "grass"},
{pos = {2.1304989137511, 7.0740666043931}, doodadType = "grass"},
{pos = {12.937220476676, 10.347120202106}, doodadType = "grass"},
{pos = {17.254265384398, 4.1113887178725}, doodadType = "grass"},
{pos = {17.973772574162, 5.1694879946501}, doodadType = "grass"},
{pos = {16.746376811594, 5.2118123372396}, doodadType = "grass"},
{pos = {17.903231855752, 6.8201227602751}, doodadType = "grass"},
{pos = {17.014429064764, 6.2134793046592}, doodadType = "grass"},
{pos = {18.086636308311, 7.9628711645154}, doodadType = "grass"},
	},
}

return mapData
