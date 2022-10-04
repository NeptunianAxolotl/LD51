
local mapData = {
	humanName = "Destiny",
	finalLevel = true,
	dimensions = {
		width = 17,
		height = 11,
		tileSize = 138,
		vertOffset = 30,
	},
	townDrawParams = {
		font = 0,
		pos = {0.01, -1.55}
	},
	baseCarriages = 2,
	track = {
		--{pos = {8, 1}, rot = 0, trackType = "town", setData = {progression = {
		--	{good = "wood", count = 3}}}},
		
		{pos = {14, 2}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 4}, {good = "ore", count = 4}, {good = "wood", count = 4}, {good = "ore", count = 4}}}},
{pos = {9, 4}, rot = 0, trackType = "farm"},
{pos = {15, 6}, rot = 1, trackType = "factory"},
{pos = {15, 7}, rot = 1, trackType = "straight"},
{pos = {15, 8}, rot = 2, trackType = "curve"},
{pos = {14, 8}, rot = 0, trackType = "mine"},
{pos = {13, 8}, rot = 0, trackType = "curve"},
{pos = {13, 9}, rot = 2, trackType = "curve"},
{pos = {12, 9}, rot = 2, trackType = "straight"},
{pos = {3, 6}, rot = 0, trackType = "sawmill"},
{pos = {8, 4}, rot = 0, trackType = "straight"},

-- {pos = {17, 0}, rot = 0, trackType = "block"},
-- {pos = {17, 1}, rot = 0, trackType = "block"},
-- {pos = {17, 2}, rot = 0, trackType = "block"},
-- {pos = {17, 3}, rot = 0, trackType = "block"},
{pos = {17, 4}, rot = 0, trackType = "block"},
{pos = {17, 5}, rot = 0, trackType = "block"},
{pos = {17, 6}, rot = 0, trackType = "block"},
{pos = {17, 7}, rot = 0, trackType = "block"},
{pos = {17, 8}, rot = 0, trackType = "block"},
{pos = {17, 9}, rot = 0, trackType = "block"},
{pos = {17, 10}, rot = 0, trackType = "block"},
{pos = {17, 11}, rot = 0, trackType = "block"},
{pos = {16, 11}, rot = 0, trackType = "block"},
{pos = {15, 11}, rot = 0, trackType = "block"},
{pos = {14, 11}, rot = 0, trackType = "block"},
{pos = {13, 11}, rot = 0, trackType = "block"},
{pos = {12, 11}, rot = 0, trackType = "block"},
--{pos = {10, 11}, rot = 0, trackType = "block"},
{pos = {11, 11}, rot = 0, trackType = "block"},
-- {pos = {9, 11}, rot = 0, trackType = "block"},
-- {pos = {7, 11}, rot = 0, trackType = "block"},
-- {pos = {8, 11}, rot = 0, trackType = "block"},
{pos = {6, 11}, rot = 0, trackType = "block"},
{pos = {4, 11}, rot = 0, trackType = "block"},
{pos = {5, 11}, rot = 0, trackType = "block"},
{pos = {3, 11}, rot = 0, trackType = "block"},
{pos = {1, 11}, rot = 0, trackType = "block"},
{pos = {2, 11}, rot = 0, trackType = "block"},
{pos = {0, 11}, rot = 0, trackType = "block"},
{pos = {9, 3}, rot = 0, trackType = "block"},
{pos = {8, 3}, rot = 0, trackType = "block"},
{pos = {8, 0}, rot = 0, trackType = "block"},
{pos = {9, 0}, rot = 0, trackType = "block"},
{pos = {7, 0}, rot = 0, trackType = "block"},
{pos = {6, 1}, rot = 0, trackType = "block"},
{pos = {6, 0}, rot = 0, trackType = "block"},
{pos = {11, 0}, rot = 0, trackType = "block"},
{pos = {10, 0}, rot = 0, trackType = "block"},
{pos = {11, 1}, rot = 0, trackType = "block"},
{pos = {9, 5}, rot = 1, trackType = "block"},
{pos = {10, 5}, rot = 1, trackType = "block"},
{pos = {11, 5}, rot = 1, trackType = "block"},
{pos = {8, 5}, rot = 1, trackType = "block"},
{pos = {12, 5}, rot = 1, trackType = "block"},
{pos = {13, 5}, rot = 1, trackType = "block"},
{pos = {14, 5}, rot = 1, trackType = "block"},
{pos = {15, 5}, rot = 1, trackType = "block"},
{pos = {17, 5}, rot = 1, trackType = "block"},
{pos = {16, 5}, rot = 1, trackType = "block"},
{pos = {14, 7}, rot = 2, trackType = "block"},
{pos = {14, 6}, rot = 2, trackType = "block"},
{pos = {16, 6}, rot = 2, trackType = "block"},
{pos = {16, 7}, rot = 2, trackType = "block"},
{pos = {13, 6}, rot = 2, trackType = "block"},
{pos = {12, 8}, rot = 2, trackType = "block"},
{pos = {12, 7}, rot = 2, trackType = "block"},
{pos = {12, 6}, rot = 2, trackType = "block"},
{pos = {13, 7}, rot = 2, trackType = "block"},
{pos = {12, 10}, rot = 2, trackType = "block"},
{pos = {13, 10}, rot = 2, trackType = "block"},
{pos = {14, 9}, rot = 2, trackType = "block"},
{pos = {14, 10}, rot = 2, trackType = "block"},
{pos = {15, 10}, rot = 2, trackType = "block"},
{pos = {15, 9}, rot = 2, trackType = "block"},
{pos = {16, 8}, rot = 2, trackType = "block"},
{pos = {16, 9}, rot = 2, trackType = "block"},
{pos = {16, 10}, rot = 2, trackType = "block"},
{pos = {5, 1}, rot = 2, trackType = "block"},
{pos = {5, 0}, rot = 2, trackType = "block"},
{pos = {4, 1}, rot = 2, trackType = "block"},
{pos = {4, 0}, rot = 2, trackType = "block"},
{pos = {3, 1}, rot = 2, trackType = "block"},
{pos = {2, 2}, rot = 2, trackType = "block"},
{pos = {3, 2}, rot = 2, trackType = "block"},
{pos = {1, 2}, rot = 2, trackType = "block"},
{pos = {0, 3}, rot = 2, trackType = "block"},
{pos = {1, 3}, rot = 2, trackType = "block"},
{pos = {0, 2}, rot = 2, trackType = "block"},
{pos = {0, 1}, rot = 2, trackType = "block"},
{pos = {0, 0}, rot = 2, trackType = "block"},
{pos = {1, 0}, rot = 2, trackType = "block"},
{pos = {1, 1}, rot = 2, trackType = "block"},
{pos = {2, 1}, rot = 2, trackType = "block"},
{pos = {2, 0}, rot = 2, trackType = "block"},
{pos = {3, 0}, rot = 2, trackType = "block"},
{pos = {2, 5}, rot = 2, trackType = "block"},
{pos = {3, 5}, rot = 2, trackType = "block"},
{pos = {16, 4}, rot = 2, trackType = "block"},
{pos = {2, 8}, rot = 2, trackType = "block"},
{pos = {1, 8}, rot = 2, trackType = "block"},
{pos = {0, 8}, rot = 2, trackType = "block"},
{pos = {3, 9}, rot = 2, trackType = "block"},
{pos = {2, 9}, rot = 2, trackType = "block"},
{pos = {0, 9}, rot = 2, trackType = "block"},
{pos = {1, 9}, rot = 2, trackType = "block"},
{pos = {0, 10}, rot = 2, trackType = "block"},
{pos = {2, 10}, rot = 2, trackType = "block"},
{pos = {3, 10}, rot = 2, trackType = "block"},
{pos = {4, 10}, rot = 2, trackType = "block"},
{pos = {1, 10}, rot = 2, trackType = "block"},
{pos = {11, 6}, rot = 2, trackType = "block"},
{pos = {17, 0}, rot = 0, trackType = "block"},
{pos = {17, 1}, rot = 0, trackType = "block"},
{pos = {17, 2}, rot = 0, trackType = "block"},
{pos = {17, 3}, rot = 0, trackType = "block"},
		
	},
	doodads = {
	
-- Extra:
{pos = {7.0259717858356, 11.487945114357}, doodadType = "forest"},
{pos = {8.0135312287704, 11.205784894418}, doodadType = "forest"},
{pos = {8.972874738168, 11.431512362715}, doodadType = "forest"},
{pos = {10.059189948483, 11.107029127038}, doodadType = "mountain_large"},
{pos = {9.170386272928, 10.655573305876}, doodadType = "grass"},
	
{pos = {9.0935996235281, 2.9597504104393}, doodadType = "field"},
{pos = {7.9533744480299, 2.9597504104393}, doodadType = "field"},
{pos = {15.337685405344, 4.7515320708786}, doodadType = "mountain_small"},
{pos = {16.1928534024, 4.262864264889}, doodadType = "mountain_large"},
{pos = {16.477910580842, 3.4348440861356}, doodadType = "mountain_small"},
{pos = {16.274299068727, 5.3352183466372}, doodadType = "mountain_large"},
{pos = {14.007423290308, 6.733350670856}, doodadType = "mountain_small"},
{pos = {13.41016332654, 6.746925243433}, doodadType = "mountain_large"},
{pos = {12.025604690331, 7.7649828040082}, doodadType = "mountain_large"},
{pos = {12.378531193388, 7.0727034859035}, doodadType = "mountain_small"},
{pos = {13.966701341712, 4.7786803314651}, doodadType = "mountain_small"},
{pos = {13.830960923347, 5.8510344132133}, doodadType = "mountain_large"},
{pos = {14.821869338768, 4.7379579405854}, doodadType = "forest"},
{pos = {7.9805235931839, 4.9687177132869}, doodadType = "field"},
{pos = {9.1750435207201, 4.9687177132869}, doodadType = "field"},
{pos = {10.423861738564, 4.9687177132869}, doodadType = "forest"},
{pos = {11.306177111639, 6.0410713527514}, doodadType = "forest"},
{pos = {11.862716895947, 5.2537735648777}, doodadType = "forest"},
{pos = {13.084384199502, 4.9144211921139}, doodadType = "forest"},
{pos = {12.392105765965, 6.4618689495584}, doodadType = "forest"},
{pos = {13.07081139606, 5.4981079101563}, doodadType = "forest"},
{pos = {11.726974708447, 9.7875233525815}, doodadType = "mountain_small"},
{pos = {12.758606841599, 10.099727907043}, doodadType = "mountain_large"},
{pos = {13.301570284194, 9.3260046917459}, doodadType = "mountain_small"},
{pos = {11.740549281024, 10.832729173743}, doodadType = "mountain_large"},
{pos = {16.342168393342, 6.5976102524909}, doodadType = "forest"},
{pos = {16.518632529438, 8.2400760374207}, doodadType = "forest"},
{pos = {14.618257826653, 9.2038370768229}, doodadType = "forest"},
{pos = {15.609168011209, 9.5431898918705}, doodadType = "forest"},
{pos = {14.523239356884, 10.099727907043}, doodadType = "forest"},
{pos = {14.020997862885, 10.710562443388}, doodadType = "forest"},
{pos = {12.18849425385, 11.009193309839}, doodadType = "mountain_small"},
{pos = {13.206551814425, 11.321396979733}, doodadType = "mountain_large"},
{pos = {12.717883123868, 10.43908072209}, doodadType = "mountain_small"},
{pos = {10.681769771852, 11.063488946445}, doodadType = "mountain_small"},
{pos = {11.034696274909, 0.81504235751387}, doodadType = "forest"},
{pos = {10.722491720448, -0.27088585452757}, doodadType = "forest"},
{pos = {9.8401745782382, 0.068466739378114}, doodadType = "forest"},
{pos = {8.3877466174139, -0.4473491060561}, doodadType = "forest"},
{pos = {9.6501376387002, -1.3432398257048}, doodadType = "forest"},
{pos = {7.0982064509737, -0.053700212119282}, doodadType = "forest"},
{pos = {7.3289653391078, -1.3160916204038}, doodadType = "forest"},
{pos = {8.537061608356, -1.506129057511}, doodadType = "forest"},
{pos = {3.0259757663893, 4.8872729315274}, doodadType = "forest"},
{pos = {2.0214923361073, 5.0773103133492}, doodadType = "forest"},
{pos = {3.9354407269022, 11.294248719146}, doodadType = "mountain_large"},
{pos = {3.5282177026721, 10.601970285609}, doodadType = "mountain_small"},
{pos = {2.8495125148607, 10.968470476676}, doodadType = "mountain_large"},
{pos = {2.8223642542742, 10.099727907043}, doodadType = "mountain_small"},
{pos = {1.9400475543478, 10.805581797724}, doodadType = "mountain_small"},
{pos = {2.1708073270494, 9.9504129161005}, doodadType = "mountain_large"},
{pos = {1.3835095391757, 10.384784200917}, doodadType = "mountain_small"},
{pos = {0.75910087253736, 10.126876167629}, doodadType = "mountain_large"},
{pos = {1.1391756361809, 9.4481714221014}, doodadType = "mountain_small"},
{pos = {0.44689631807631, 9.1359668676404}, doodadType = "mountain_small"},
{pos = {-1.181995778844, 8.9323553555254}, doodadType = "mountain_small"},
{pos = {-0.20466038800668, 8.8237623131793}, doodadType = "forest"},
{pos = {-0.84264329550923, 10.154024428216}, doodadType = "forest"},
{pos = {0.066821554432745, 11.117785467618}, doodadType = "forest"},
{pos = {-1.1412734985352, 11.172081988791}, doodadType = "forest"},
{pos = {0.9627123846524, 8.1043347344882}, doodadType = "forest"},
{pos = {1.546398660411, 8.9730773041214}, doodadType = "forest"},
{pos = {1.9807699452276, 8.0907610464787}, doodadType = "forest"},
{pos = {2.808790123981, 9.1223931796309}, doodadType = "forest"},
{pos = {3.7182550844939, 10.072579646456}, doodadType = "forest"},
{pos = {4.6548678633096, 10.900600267493}, doodadType = "forest"},
{pos = {5.7679438936538, 11.416416334069}, doodadType = "forest"},
{pos = {-1.5213483727497, -0.31160802426546}, doodadType = "mountain_small"},
{pos = {-1.3041627303414, 3.1226399739583}, doodadType = "mountain_large"},
{pos = {-0.58473537279212, 2.593249777089}, doodadType = "mountain_small"},
{pos = {-0.23180864859318, 1.7516554680423}, doodadType = "mountain_large"},
{pos = {-0.36754973038383, 0.88291278783826}, doodadType = "mountain_small"},
{pos = {-1.0734029576398, 2.1724526225657}, doodadType = "mountain_small"},
{pos = {-0.7476244940274, 0.65215323627859}, doodadType = "mountain_large"},
{pos = {-1.6027929333673, 0.21778195146201}, doodadType = "mountain_small"},
{pos = {-1.4670519621476, 1.8738221983979}, doodadType = "forest"},
{pos = {0.60978566045346, 2.7832871589108}, doodadType = "forest"},
{pos = {1.0848791150079, 1.6973589468693}, doodadType = "forest"},
{pos = {2.1300849361696, 2.0231376316236}, doodadType = "forest"},
{pos = {3.1345683664515, 1.7923778589221}, doodadType = "forest"},
{pos = {2.1572331967561, 0.91006104842476}, doodadType = "forest"},
{pos = {-0.028197136478148, 8.0093162647192}, doodadType = "forest"},
{pos = {-1.0734029576398, 8.2129277768342}, doodadType = "forest"},
{pos = {-0.96481013643569, 7.0184069647305}, doodadType = "forest"},
{pos = {-1.2498663197393, 5.8917563618093}, doodadType = "forest"},
{pos = {-1.0734029576398, 4.7379579405854}, doodadType = "forest"},
{pos = {3.8811442057292, 0.32637477266616}, doodadType = "forest"},
{pos = {4.6412937330163, 0.82861648780712}, doodadType = "forest"},
{pos = {5.6593517358752, 0.65215323627859}, doodadType = "forest"},
{pos = {4.9399241571841, -0.21658933335456}, doodadType = "forest"},
{pos = {6.5552425660949, -0.69168289847996}, doodadType = "forest"},
{pos = {6.1072967087013, -1.5332772075266}, doodadType = "forest"},
{pos = {2.4015670997509, -0.69168289847996}, doodadType = "forest"},
{pos = {3.4739211814991, -1.2210728742074}, doodadType = "forest"},
{pos = {2.3744188391644, -1.5739995984064}, doodadType = "forest"},
{pos = {4.4105339603148, -1.804759260537}, doodadType = "forest"},
{pos = {0.74552674224411, 0.0005963090537251}, doodadType = "forest"},
{pos = {-0.57116124249887, -0.2980338939722}, doodadType = "forest"},
{pos = {0.73195261195086, -0.9224426711815}, doodadType = "forest"},
{pos = {-0.50329059103261, -1.3160916204038}, doodadType = "forest"},
{pos = {-1.5756447833517, -1.329665750697}, doodadType = "forest"},
{pos = {10.491731063179, -1.5739995984064}, doodadType = "forest"},
{pos = {16.342168393342, 7.154148267663}, doodadType = "grass"},
{pos = {15.554871490036, 8.7151692708333}, doodadType = "grass"},
{pos = {14.849018483922, 10.696988755378}, doodadType = "grass"},
{pos = {11.441919299139, 6.1225161345109}, doodadType = "grass"},
{pos = {10.654620626698, 5.1180327042289}, doodadType = "grass"},
{pos = {12.18849425385, 4.8465505406476}, doodadType = "grass"},
{pos = {14.061719811481, 4.5479205587636}, doodadType = "grass"},
{pos = {11.265455163043, 0.92363517871801}, doodadType = "grass"},
{pos = {10.980399753736, -0.35233041514521}, doodadType = "grass"},
{pos = {9.1207469995471, 0.0005963090537251}, doodadType = "grass"},
{pos = {7.2746688179348, -0.026551951532779}, doodadType = "grass"},
{pos = {-0.50329059103261, 7.3577597797781}, doodadType = "grass"},
{pos = {-0.92408785612687, 5.6609965891078}, doodadType = "grass"},
{pos = {0.98986042409703, 7.8600012737772}, doodadType = "grass"},
{pos = {2.1708073270494, 8.0500390978827}, doodadType = "grass"},
{pos = {3.0802722875623, 8.9052070949389}, doodadType = "grass"},
{pos = {4.3155154905457, 10.154024428216}, doodadType = "grass"},
{pos = {0.73195261195086, 6.2311091768569}, doodadType = "grass"},
{pos = {2.2522521088089, 6.1903863436934}, doodadType = "grass"},
{pos = {1.8993251634681, 4.6565131588259}, doodadType = "grass"},
{pos = {2.9445309846298, 4.6700872891191}, doodadType = "grass"},
{pos = {1.5735469209975, 2.0774341527966}, doodadType = "grass"},
{pos = {3.7046809542006, 1.0865242999533}, doodadType = "grass"},
{pos = {1.0170086846835, 0.78789409692737}, doodadType = "grass"},
{pos = {2.8495125148607, 0.21778195146201}, doodadType = "grass"},
{pos = {4.8449056874151, -1.0581836424012}, doodadType = "grass"},
{pos = {1.4106577997622, -0.67810887875764}, doodadType = "grass"},
{pos = {0.71837848165761, -1.6825924196105}, doodadType = "grass"},
{pos = {5.9036851965863, -0.542367796967}, doodadType = "grass"},
{pos = {9.6094156901042, -0.74597930908203}, doodadType = "grass"},
{pos = {-0.13678995768229, 8.8509105737659}, doodadType = "grass"},
{pos = {6.0394264995188, 10.832729173743}, doodadType = "grass"},
{pos = {7.4782803300498, 9.882542706918}, doodadType = "grass"},
{pos = {8.3877466174139, 10.588395713032}, doodadType = "grass"},
{pos = {6.1344449692878, 10.072579646456}, doodadType = "grass"},
{pos = {11.794845802197, -1.3568139559981}, doodadType = "forest"},
{pos = {13.084384199502, -1.2210728742074}, doodadType = "forest"},
{pos = {14.550388502038, -1.506129057511}, doodadType = "forest"},
-- {pos = {15.731333856997, -1.0853319029877}, doodadType = "forest"},
-- {pos = {16.939430126245, -0.86814626057943}, doodadType = "forest"},
-- {pos = {17.061595972034, -1.6961665499038}, doodadType = "forest"},
{pos = {16.002816462862, -1.7368887196416}, doodadType = "forest"},
{pos = {14.387498938519, -1.2482211347939}, doodadType = "grass"},
{pos = {12.785754217618, -1.2346470045007}, doodadType = "grass"},
{pos = {16.1928534024, -1.0038872317991}, doodadType = "grass"},
--{pos = {17.495968141418, -0.28445998482082}, doodadType = "grass"},
{pos = {17.143041638361, 9.1587276735168}, doodadType = "forest"},
{pos = {17.414522475091, 8.0185024980186}, doodadType = "forest"},
{pos = {16.885133605072, 4.8014411373415}, doodadType = "mountain_small"},
{pos = {17.360225953918, 4.0277174797611}, doodadType = "mountain_large"},
{pos = {17.360225953918, 3.1725490404212}, doodadType = "mountain_small"},
{pos = {17.523115517437, 1.6522495435632}, doodadType = "mountain_small"},
{pos = {17.333078577899, -0.83181110326795}, doodadType = "forest"},
{pos = {17.292356629303, 2.8467707979506}, doodadType = "forest"},
{pos = {17.699579653533, 1.2857487996419}, doodadType = "forest"},
{pos = {17.468818996264, 0.19982058760049}, doodadType = "forest"},
{pos = {17.129467065784, 1.2721746693487}, doodadType = "forest"},
{pos = {17.007299450861, 1.0549890269404}, doodadType = "grass"},
{pos = {15.812779523324, 11.439176255378}, doodadType = "forest"},
{pos = {16.939430126245, 11.3305840976}, doodadType = "forest"},
{pos = {17.835320071898, 10.787619770437}, doodadType = "forest"},
{pos = {16.762965990149, 10.312526537024}, doodadType = "grass"},
{pos = {17.563837466033, 6.4167591039685}, doodadType = "grass"},


	},
}

return mapData