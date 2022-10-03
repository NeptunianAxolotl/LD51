
return {
	stateImage = {
		"track_branch_right_off",
		"track_branch_right_on",
	},
	toggleStates = 2,
	inShop = true,
	removable = true,
	overwrite = {
		straight = {
			rot = {
				[0] = true,
				[2] = true
			}
		},
		curve = {
			rot = {
				[1] = true
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
			requiredState = 1,
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
		{
			posFunc = function (t)
				t = 1 - t
				return {0.5 - 0.5 * math.cos(t * math.pi / 2), -0.5 + 0.5 * math.sin(t * math.pi / 2)}
			end,
			dirFunc = function (t)
				return math.pi + t * math.pi / 2
			end,
			entry = 0,
			destination = 3,
			requiredState = 2,
			speedMult = Global.CORNER_SPEED_MULT,
		},
		{
			posFunc = function (t)
				return {0.5 - 0.5 * math.cos(t * math.pi / 2), -0.5 + 0.5 * math.sin(t * math.pi / 2)}
			end,
			dirFunc = function (t)
				return 0.5 * math.pi - t * math.pi / 2
			end,
			entry = 3,
			destination = 0,
			speedMult = Global.CORNER_SPEED_MULT,
		},
	},
}