
return {
	image = "track_curved",
	paths = {
		{
			posFunc = function (t)
				t = 1 - t
				return {0.5 - 0.5 * math.cos(t * math.pi / 2), 0.5 - 0.5 * math.sin(t * math.pi / 2)}
			end,
			dirFunc = function (t)
				return math.pi - t * math.pi / 2
			end,
			entry = 0,
			destination = 1,
		},
		{
			posFunc = function (t)
				return {0.5 - 0.5 * math.cos(t * math.pi / 2), 0.5 - 0.5 * math.sin(t * math.pi / 2)}
			end,
			dirFunc = function (t)
				return 1.5 * math.pi + t * math.pi / 2
			end,
			entry = 1,
			destination = 0,
		},
	},
}