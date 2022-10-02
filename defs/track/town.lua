
local Font = require("include/font")

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
	extraDrawFunc = function (self, pos, rotation)
		Font.SetSize(3)
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.print(350, pos[1] - 0*Global.GRID_SIZE, pos[2] - 1.32*Global.GRID_SIZE)
		love.graphics.print(350, pos[1] - 0*Global.GRID_SIZE, pos[2] - 1.09*Global.GRID_SIZE)
		love.graphics.print(350, pos[1] - 0*Global.GRID_SIZE, pos[2] - 0.86*Global.GRID_SIZE)
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