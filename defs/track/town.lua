
return {
	stateImage = {"track_town"},
	topImage = "town_over",
	shopSlot = false,
	trainMidFunc = function (self, train)
		if not train.GetCarrying() then
			return
		end
		local good = train.GetCarrying()
		GameHandler.AddScore(Global.DELIVER_SCORE * train.def.cartCount)
		train.SetCarrying(false)
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