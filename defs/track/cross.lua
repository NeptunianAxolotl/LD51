
return {
	stateImage = {"track_cross"},
	topImage = "track_bridge",
	inShop = true,
	removable = true,
	entryUseIndexMap = {
		[0] = 1,
		[1] = 2,
		[2] = 1,
		[3] = 2,
	},
	overwrite = {
		straight = {
			rot = {
				[0] = true,
				[1] = true,
				[2] = true,
				[3] = true
			}
		},
	},
	paths = {
		{
			posFunc = function (t)
				return {0.5 - t, 0}
			end,
			dirFunc = function (t)
				return math.pi
			end,
			entry = 0,
			destination = 2,
			raiseTrain = 120,
		},
		{
			posFunc = function (t)
				return {t - 0.5, 0}
			end,
			dirFunc = function (t)
				return 0
			end,
			entry = 2,
			destination = 0,
			raiseTrain = 120,
		},
		{
			posFunc = function (t)
				return {0, 0.5 - t}
			end,
			dirFunc = function (t)
				return 1.5*math.pi
			end,
			entry = 1,
			destination = 3,
			setEffect = 60,
		},
		{
			posFunc = function (t)
				return {0, t - 0.5}
			end,
			dirFunc = function (t)
				return 0.5*math.pi
			end,
			entry = 3,
			destination = 1,
			setEffect = 60,
		},
	},
}