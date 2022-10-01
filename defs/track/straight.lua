
return {
	image = "track_straight",
	paths = {
		[0] = {
			{
				posFunc = function (t)
					return {0.5 - t, 0.5}
				end,
				dirFunc = function (t)
					return math.pi
				end,
				destination = 2,
			}
		},
		[2] = {
			{
				posFunc = function (t)
					return {t - 0.5, 0.5}
				end,
				dirFunc = function (t)
					return 0
				end,
				destination = 0,
			}
		}
	},
}