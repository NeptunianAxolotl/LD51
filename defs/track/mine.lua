
return {
	stateImage = {"track_mine"},
	trainMidFunc = function (self, train)
		train.SetCarrying("ore")
	end,
	trainSlowFunc = function (self, train)
		return train.GetCarrying() ~= "ore"
	end,
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