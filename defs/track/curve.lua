
return {
	image = "track_curved",
	paths = {
		[0] = {
			{
				posFunc = function (t)
					return {0.5 - 0.5 * math.cos(t * math.pi / 2), 0.5 - 0.5 * math.sin(t * math.pi / 2)}
				end,
				dirFunc = function (t)
					return math.pi - t * math.pi / 2
				end,
				destination = 1,
			}
		},
		[1] = {
			{
				posFunc = function (t)
					t = 1 - t
					return {0.5 - 0.5 * math.cos(t * math.pi / 2), 0.5 - 0.5 * math.sin(t * math.pi / 2)}
				end,
				dirFunc = function (t)
					return 1.5 * math.pi + t * math.pi / 2
				end,
				destination = 0,
			}
		}
	},
}