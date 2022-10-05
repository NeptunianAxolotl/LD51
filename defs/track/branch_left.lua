
return {
	stateImage = {
		"track_branch_off",
		"track_branch_on",
	},
	toggleStates = 2,
	canPathSwitch = { -- Beware: Index in paths of other paths, indexed by current path destination.
		[1] = 1,
		[2] = 3,
	},
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
				[0] = true
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
			trainStopOffset = Global.SWITCH_STOP_OFFSET,
			deccelMult = 2,
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