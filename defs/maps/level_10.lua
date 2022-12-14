
local mapData = {
	humanName = "Crosstalk",
	finalLevel = true,
	dimensions = {
		width = 17,
		height = 11,
		tileSize = 138,
		vertOffset = 30,
	},
	townDrawParams = {
		font = 0,
		pos = {0.01, -1.58}
	},
	baseCarriages = 2,
	track = {
		--{pos = {8, 1}, rot = 0, trackType = "town", setData = {progression = {
		--	{good = "wood", count = 3}}}},
		
		{pos = {7,4}, rot = 0, trackType = "factory"},
		{pos = {11, 2}, rot = 0, trackType = "town", setData = {progression = {
			{good = "food", count = 8}, {good = "ore", count = 4}}}},
		{pos = {12, 7}, rot = 0, trackType = "town", setData = {progression = {
			{good = "ore", count = 8}, {good = "food", count = 4}}}},
		
		{pos = {3, 8}, rot = 0, trackType = "farm"},
		{pos = {2, 0}, rot = 0, trackType = "mine"},
		
		{pos = {8, 4}, rot = 0, trackType = "cross"},
		{pos = {9, 4}, rot = 1, trackType = "curve"},
		{pos = {9, 5}, rot = 2, trackType = "curve"},
		{pos = {8, 5}, rot = 0, trackType = "split"},
	
		{pos = {-1, -1}, rot = 0, trackType = "block"},
		{pos = {0, -1}, rot = 0, trackType = "block"},
		{pos = {1, -1}, rot = 0, trackType = "block"},
		{pos = {2, -1}, rot = 0, trackType = "block"},
		{pos = {3, -1}, rot = 0, trackType = "block"},
		{pos = {4, -1}, rot = 0, trackType = "block"},
		{pos = {5, -1}, rot = 0, trackType = "block"},
		{pos = {6, -1}, rot = 0, trackType = "block"},
		{pos = {7, -1}, rot = 0, trackType = "block"},
		{pos = {8, -1}, rot = 0, trackType = "block"},
		{pos = {9, -1}, rot = 0, trackType = "block"},
		{pos = {10, -1}, rot = 0, trackType = "block"},
		{pos = {11, -1}, rot = 0, trackType = "block"},
		{pos = {13, -1}, rot = 0, trackType = "block"},
		{pos = {12, -1}, rot = 0, trackType = "block"},
		{pos = {14, -1}, rot = 0, trackType = "block"},
		{pos = {15, -1}, rot = 0, trackType = "block"},
		{pos = {15, 0}, rot = 0, trackType = "block"},
		{pos = {16, 1}, rot = 0, trackType = "block"},
		{pos = {16, 2}, rot = 0, trackType = "block"},
		{pos = {16, 3}, rot = 0, trackType = "block"},
		{pos = {15, 4}, rot = 0, trackType = "block"},
		{pos = {15, 5}, rot = 0, trackType = "block"},
		{pos = {15, 6}, rot = 0, trackType = "block"},
		{pos = {15, 7}, rot = 0, trackType = "block"},
		{pos = {15, 8}, rot = 0, trackType = "block"},
		{pos = {15, 9}, rot = 0, trackType = "block"},
		{pos = {15, 10}, rot = 0, trackType = "block"},
		{pos = {-1, 0}, rot = 0, trackType = "block"},
		{pos = {-1, 1}, rot = 0, trackType = "block"},
		{pos = {-1, 2}, rot = 0, trackType = "block"},
		{pos = {-1, 3}, rot = 0, trackType = "block"},
		{pos = {-1, 4}, rot = 0, trackType = "block"},
		{pos = {-1, 5}, rot = 0, trackType = "block"},
		{pos = {-1, 6}, rot = 0, trackType = "block"},
		{pos = {-1, 7}, rot = 0, trackType = "block"},
		{pos = {-1, 8}, rot = 0, trackType = "block"},
		{pos = {-1, 9}, rot = 0, trackType = "block"},
		{pos = {-1, 11}, rot = 0, trackType = "block"},
		{pos = {0, 11}, rot = 0, trackType = "block"},
		{pos = {2, 11}, rot = 0, trackType = "block"},
		{pos = {1, 11}, rot = 0, trackType = "block"},
		{pos = {3, 11}, rot = 0, trackType = "block"},
		{pos = {4, 11}, rot = 0, trackType = "block"},
		{pos = {6, 11}, rot = 0, trackType = "block"},
		{pos = {5, 11}, rot = 0, trackType = "block"},
		{pos = {7, 11}, rot = 0, trackType = "block"},
		{pos = {9, 11}, rot = 0, trackType = "block"},
		{pos = {8, 11}, rot = 0, trackType = "block"},
		{pos = {10, 10}, rot = 0, trackType = "block"},
		{pos = {11, 10}, rot = 0, trackType = "block"},
		{pos = {12, 10}, rot = 0, trackType = "block"},
		{pos = {13, 10}, rot = 0, trackType = "block"},
		{pos = {14, 10}, rot = 0, trackType = "block"},
		{pos = {0, 0}, rot = 0, trackType = "block"},
		{pos = {5, 0}, rot = 0, trackType = "block"},
		{pos = {0, 4}, rot = 0, trackType = "block"},
		{pos = {1, 4}, rot = 0, trackType = "block"},
		{pos = {5, 1}, rot = 0, trackType = "block"},
		{pos = {6, 1}, rot = 0, trackType = "block"},
		{pos = {6, 0}, rot = 0, trackType = "block"},
		{pos = {2, 4}, rot = 0, trackType = "block"},
		{pos = {6, 4}, rot = 0, trackType = "block"},
		{pos = {6, 5}, rot = 0, trackType = "block"},
		{pos = {7, 5}, rot = 0, trackType = "block"},
		{pos = {3, 4}, rot = 3, trackType = "block"},
		{pos = {4, 4}, rot = 3, trackType = "block"},
		{pos = {7, 1}, rot = 3, trackType = "block"},
		{pos = {7, 0}, rot = 3, trackType = "block"},
		{pos = {14, 4}, rot = 3, trackType = "block"},
		{pos = {14, 5}, rot = 3, trackType = "block"},
		{pos = {3, 7}, rot = 0, trackType = "block"},
		{pos = {2, 7}, rot = 0, trackType = "block"},
		{pos = {7, 9}, rot = 0, trackType = "block"},
		{pos = {8, 9}, rot = 0, trackType = "block"},
		{pos = {9, 9}, rot = 0, trackType = "block"},
		{pos = {8, 8}, rot = 0, trackType = "block"},
		{pos = {11, 4}, rot = 0, trackType = "block"},
		{pos = {-1, 10}, rot = 0, trackType = "block"},
		{pos = {9, 10}, rot = 0, trackType = "block"},
		{pos = {8, 10}, rot = 0, trackType = "block"},
		{pos = {7, 10}, rot = 0, trackType = "block"},
		{pos = {6, 10}, rot = 0, trackType = "block"},
		{pos = {2, 9}, rot = 0, trackType = "block"},
		{pos = {3, 9}, rot = 0, trackType = "block"},
		
		{pos = {16, 4}, rot = 0, trackType = "block"},
{pos = {16, 5}, rot = 0, trackType = "block"},
{pos = {16, 6}, rot = 0, trackType = "block"},
{pos = {16, 7}, rot = 0, trackType = "block"},
{pos = {16, 8}, rot = 0, trackType = "block"},
{pos = {16, 9}, rot = 0, trackType = "block"},
{pos = {16, 10}, rot = 0, trackType = "block"},
{pos = {16, 0}, rot = 0, trackType = "block"},
{pos = {16, -1}, rot = 0, trackType = "block"},
	},
	doodads = {
		{pos = {2.9988275058028, 6.8692971934443}, doodadType = "field"},
{pos = {1.9807699452276, 6.8692971934443}, doodadType = "field"},
{pos = {2.9852533755095, 8.8646903659986}, doodadType = "field"},
{pos = {1.9128992937613, 8.8782649385756}, doodadType = "field"},
{pos = {6.0665747601053, 0.93741530266361}, doodadType = "mountain_large"},
{pos = {4.9670724177706, 0.73380379054857}, doodadType = "mountain_small"},
{pos = {5.1163874087126, 0.00080230270606885}, doodadType = "mountain_large"},
{pos = {7.0439099298007, 0.76095205113508}, doodadType = "mountain_small"},
{pos = {6.5552425660949, 0.21798794511436}, doodadType = "mountain_large"},
{pos = {5.6864999964617, -0.50143952300583}, doodadType = "mountain_small"},
{pos = {4.9942206783571, -1.1258481896442}, doodadType = "mountain_large"},
{pos = {4.0033109360847, -1.3430338320525}, doodadType = "mountain_large"},
{pos = {2.9038090360337, -1.2887374214504}, doodadType = "mountain_small"},
{pos = {2.2115297179291, -1.3837561123613}, doodadType = "mountain_large"},
{pos = {1.0848791150079, -1.2615892161494}, doodadType = "mountain_small"},
{pos = {0.1075439453125, -1.4652006729789}, doodadType = "mountain_large"},
{pos = {0.093969815019248, -0.84079200634058}, doodadType = "mountain_small"},
{pos = {-0.38112386067708, -0.2028093199799}, doodadType = "mountain_large"},
{pos = {-1.1005512182263, 0.55734053902004}, doodadType = "mountain_small"},
{pos = {-1.4399037015611, 0.027950563292573}, doodadType = "mountain_small"},
{pos = {-1.2905886000481, -0.77292157601619}, doodadType = "mountain_large"},
{pos = {-0.95123600614244, -1.5059230638587}, doodadType = "mountain_small"},
{pos = {0.8133971725685, -1.7638309865758}, doodadType = "mountain_small"},
{pos = {-1.2905886000481, 1.4532311480978}, doodadType = "mountain_large"},
{pos = {15.962094514266, 9.8284514054008}, doodadType = "mountain_small"},
{pos = {16.912280981091, 9.0275799295177}, doodadType = "mountain_large"},
{pos = {16.640800144361, 9.9777672809103}, doodadType = "mountain_small"},
{pos = {17.17018901438, 11.063695050668}, doodadType = "mountain_large"},
{pos = {16.152131453804, 10.79221332937}, doodadType = "mountain_small"},
{pos = {15.351259977921, 10.955102008322}, doodadType = "mountain_large"},
{pos = {14.29248046875, 10.670045714447}, doodadType = "mountain_small"},
{pos = {15.826354095901, 9.0140053569407}, doodadType = "mountain_large"},
{pos = {16.206427974977, 7.982374108356}, doodadType = "mountain_small"},
{pos = {16.953002929688, 7.4529843537704}, doodadType = "mountain_small"},
{pos = {16.369317538496, 7.2086500084918}, doodadType = "mountain_large"},
{pos = {17.224485535553, 6.4620741692142}, doodadType = "mountain_small"},
{pos = {17.346653150476, 8.3081523508265}, doodadType = "mountain_large"},
{pos = {10.953250608582, 3.7201060419497}, doodadType = "mountain_small"},
{pos = {6.0530001875283, 3.9237175540648}, doodadType = "forest"},
{pos = {6.1208712812783, 4.8603303328804}, doodadType = "forest"},
{pos = {7.1660775447237, 4.9824979478034}, doodadType = "forest"},
{pos = {3.9218665966089, 3.9101438660553}, doodadType = "forest"},
{pos = {2.7952159936877, 3.7065323539402}, doodadType = "forest"},
{pos = {1.3156388877095, 3.9644403872283}, doodadType = "forest"},
{pos = {0.18898850593014, 3.8965692934783}, doodadType = "forest"},
{pos = {-1.032680677331, 3.3536049663157}, doodadType = "forest"},
{pos = {-0.80192101520041, 4.4395336206409}, doodadType = "forest"},
{pos = {-0.096067566802536, 3.7879762511322}, doodadType = "grass"},
{pos = {2.7952159936877, 4.1273290661798}, doodadType = "grass"},
{pos = {4.6412937330163, 4.6974416539289}, doodadType = "grass"},
{pos = {5.1299619812896, 3.6793840933537}, doodadType = "grass"},
{pos = {1.9671958149343, 3.4214760600657}, doodadType = "grass"},
{pos = {-1.1684216485507, 5.8648142054461}, doodadType = "forest"},
{pos = {-0.97838426672894, 7.4258360931839}, doodadType = "forest"},
{pos = {-0.70690232428952, 10.683620287024}, doodadType = "forest"},
{pos = {-1.1955699091372, 9.5298214235168}, doodadType = "forest"},
{pos = {-0.8697914455248, 8.4303190811821}, doodadType = "forest"},
{pos = {0.98986042409703, 11.199436353601}, doodadType = "forest"},
{pos = {2.1165108058764, 11.009398529495}, doodadType = "forest"},
{pos = {3.7318292147871, 10.79221332937}, doodadType = "forest"},
{pos = {5.2385541390682, 11.29445482337}, doodadType = "forest"},
{pos = {6.0665747601053, 10.344267471977}, doodadType = "forest"},
{pos = {6.4873714723449, 11.416621553725}, doodadType = "forest"},
{pos = {7.3561144842618, 9.1633203478827}, doodadType = "forest"},
{pos = {8.0076709692029, 8.118114526721}, doodadType = "forest"},
{pos = {8.727098547894, 9.1633203478827}, doodadType = "forest"},
{pos = {8.0891148663949, 10.765065068784}, doodadType = "forest"},
{pos = {9.3107857082201, 10.31711921139}, doodadType = "forest"},
{pos = {10.790362814198, 9.9641927083333}, doodadType = "forest"},
{pos = {12.337809244792, 10.127082271852}, doodadType = "forest"},
{pos = {13.47803442029, 9.9098961871603}, doodadType = "forest"},
{pos = {14.591110450634, 9.6384144658628}, doodadType = "forest"},
{pos = {14.862591287364, 8.3081523508265}, doodadType = "forest"},
{pos = {14.075294384058, 9.2176168690557}, doodadType = "grass"},
{pos = {9.7180087324502, 9.4212283811707}, doodadType = "grass"},
{pos = {7.1932249207428, 10.452860514323}, doodadType = "grass"},
{pos = {4.8720539480016, 10.697193975034}, doodadType = "grass"},
{pos = {-0.068919527357903, 10.575027244678}, doodadType = "grass"},
{pos = {15.093351944633, 6.9100200266078}, doodadType = "forest"},
{pos = {15.894223420516, 5.9055361540421}, doodadType = "forest"},
{pos = {14.088868956635, 4.9282014266304}, doodadType = "forest"},
{pos = {15.44627844769, 4.6567188207654}, doodadType = "forest"},
{pos = {14.414646314538, 4.0187360238338}, doodadType = "forest"},
{pos = {16.070687556612, 3.1635678056358}, doodadType = "forest"},
{pos = {16.423614059669, 1.9554728632388}, doodadType = "forest"},
{pos = {15.799204950747, 0.70665552996207}, doodadType = "forest"},
{pos = {17.265207484149, 4.5074038298234}, doodadType = "forest"},
{pos = {17.143041638361, -0.61003234420998}, doodadType = "forest"},
{pos = {15.10692651721, -0.48786539271258}, doodadType = "forest"},
{pos = {10.953250608582, 11.321603083956}, doodadType = "forest"},
{pos = {13.206551814425, 11.525214596071}, doodadType = "mountain_large"},
{pos = {11.903438844543, 11.728826108186}, doodadType = "mountain_small"},
{pos = {9.5822665449502, 11.470918074898}, doodadType = "mountain_small"},
{pos = {17.292356629303, 0.46232162696728}, doodadType = "mountain_small"},
{pos = {16.152131453804, -1.5737934941831}, doodadType = "mountain_large"},
{pos = {15.011908047441, -1.8452755471934}, doodadType = "mountain_small"},
{pos = {13.844533726789, -1.1529963949452}, doodadType = "forest"},
{pos = {12.229216202446, -1.3158856267514}, doodadType = "forest"},
{pos = {11.007547129755, -0.97653308813123}, doodadType = "forest"},
{pos = {9.4465261265851, -1.2887374214504}, doodadType = "forest"},
{pos = {7.3425399116848, -0.69147690482762}, doodadType = "forest"},
{pos = {6.2837599602298, -1.3430338320525}, doodadType = "forest"},
{pos = {8.347022899683, -1.4652006729789}, doodadType = "forest"},
{pos = {17.563837466033, 3.0549752055735}, doodadType = "forest"},
{pos = {16.382892111073, 0.041524472443954}, doodadType = "grass"},
{pos = {17.523115517437, 1.9554728632388}, doodadType = "grass"},
{pos = {16.247149923573, 4.2630703691123}, doodadType = "grass"},
{pos = {17.061595972034, 5.498313129812}, doodadType = "grass"},
{pos = {17.495968141418, 3.7472543025362}, doodadType = "grass"},
{pos = {13.030087678329, -1.4787748032722}, doodadType = "grass"},
{pos = {9.9759149966033, -1.3294597017592}, doodadType = "grass"},
{pos = {8.2520044299139, -0.80006972603176}, doodadType = "grass"},
{pos = {12.079901211504, 10.914380059726}, doodadType = "forest"},
{pos = {13.518756368886, 10.79221332937}, doodadType = "forest"},
{pos = {8.3877466174139, 11.593084805254}, doodadType = "forest"},
{pos = {9.9759149966033, 10.642897453861}, doodadType = "forest"},
{pos = {-0.068919527357903, 11.280880250793}, doodadType = "grass"},
{pos = {2.958105114923, 11.240158302197}, doodadType = "grass"},
{pos = {6.3923530025759, 9.4755249023438}, doodadType = "grass"},
{pos = {7.9669490206069, 8.0638188901155}, doodadType = "grass"},
{pos = {14.604685023211, 5.6340544327446}, doodadType = "grass"},
{pos = {15.324110832767, 3.2857347571332}, doodadType = "grass"},
{pos = {13.600200266078, -0.81364385632501}, doodadType = "grass"},
{pos = {17.563837466033, 10.059211178102}, doodadType = "mountain_large"},
{pos = {16.097834932631, 11.552362856658}, doodadType = "mountain_small"},
{pos = {14.360349793365, 11.688103275023}, doodadType = "mountain_large"},
{pos = {15.419131071671, 11.62023306584}, doodadType = "mountain_small"},
{pos = {15.839926899343, 10.425712253736}, doodadType = "mountain_small"},
{pos = {17.373800526495, 7.2900947902514}, doodadType = "mountain_small"},
{pos = {17.672430508379, 8.8375421054121}, doodadType = "mountain_small"},
{pos = {16.559354478034, 9.5162477355072}, doodadType = "mountain_small"},
{pos = {-1.3313108803569, -1.6280900153561}, doodadType = "mountain_large"},
{pos = {2.6187527421592, -1.8181273971779}, doodadType = "mountain_small"},
{pos = {-0.40827190012172, -0.89508841694265}, doodadType = "mountain_small"},
{pos = {-1.7792562954668, 0.66593313908231}, doodadType = "mountain_large"},
{pos = {4.8449056874151, -1.7909791365914}, doodadType = "mountain_large"},
{pos = {3.5010694420856, -1.9131460880888}, doodadType = "mountain_small"},
{pos = {16.925855553668, -1.9810166289841}, doodadType = "mountain_small"},
{pos = {18.188246574955, 0.78810009057971}, doodadType = "mountain_large"},
	},
}

return mapData
