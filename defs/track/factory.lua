
return {
	stateImage = {"track_straight_half"},
	topImage = "train_factory",
	shopSlot = false,
	updateFunc = function (self, dt)
		self.spawnTimer = (self.spawnTimer or 0) - dt
		if self.spawnTimer <= 0 then
			self.spawnTimer = TrainHandler.AddTrain("basic", self.pos, (self.rotation + 2)%4)
		end
	end,
	paths = {
		{
			posFunc = function (t)
				return {0.6*t - 0.1, 0}
			end,
			dirFunc = function (t)
				return 0
			end,
			destination = 0,
			speedMult = 1 / 0.6,
			isSpawnPath = true,
		},
	},
}