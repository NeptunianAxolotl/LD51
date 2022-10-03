
return {
	stateImage = {"track_signal_off", "track_signal_on"},
	toggleStates = 2,
	offState = 1,
	removable = true,
	shopFrequency = 3,
	overwrite = {
		straight = {
			rot = {
				[0] = true,
				[2] = true
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
		},
	},
}