
return {
	stateImage = {
		"track_splay_off",
		"track_splay_on",
	},
	toggleStates = 2,
	canPathSwitch = { -- Beware: Index in paths of other paths, indexed by current path destination.
		[1] = 1,
		[3] = 3,
	},
	inShop = true,
	removable = true,
	overwrite = {
		curve = {
			rot = {
				[0] = true,
				[1] = true,
			}
		},
	},
	paths = {
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
			requiredState = 1,
			speedMult = Global.CORNER_SPEED_MULT,
			trainStopOffset = Global.SWITCH_STOP_OFFSET,
			deccelMult = 2,
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
			requiredState = 2,
			speedMult = Global.CORNER_SPEED_MULT,
			trainStopOffset = Global.SWITCH_STOP_OFFSET,
			deccelMult = 2,
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
	},
}