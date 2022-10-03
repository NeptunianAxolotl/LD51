
return {
	stateImage = {"track_double_curved"},
	shopFrequencty = 3,
	removable = true,
	entryUseIndexMap = {
		[0] = 1,
		[1] = 1,
		[2] = 2,
		[3] = 2,
	},
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
			speedMult = Global.CORNER_SPEED_MULT,
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
			speedMult = Global.CORNER_SPEED_MULT,
		},
		{
			posFunc = function (t)
				t = 1 - t
				return {-0.5 + 0.5 * math.cos(t * math.pi / 2), -0.5 + 0.5 * math.sin(t * math.pi / 2)}
			end,
			dirFunc = function (t)
				return -t * math.pi / 2
			end,
			entry = 2,
			destination = 3,
			speedMult = Global.CORNER_SPEED_MULT,
		},
		{
			posFunc = function (t)
				return {-0.5 + 0.5 * math.cos(t * math.pi / 2), -0.5 + 0.5 * math.sin(t * math.pi / 2)}
			end,
			dirFunc = function (t)
				return 0.5 * math.pi + t * math.pi / 2
			end,
			entry = 3,
			destination = 2,
			speedMult = Global.CORNER_SPEED_MULT,
		},
	},
}