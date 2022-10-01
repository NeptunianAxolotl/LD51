
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local NewTrain = require("objects/train")

local self = {}
local api = {}

function api.AddTrain(trainType, gridPos, entry)
	trainData = {
		trainType = trainType,
	}
	IterableMap.Add(self.trainList, NewTrain(trainData, api, gridPos, entry))
end

function api.Update(dt)
	IterableMap.ApplySelfRandomOrder(self.trainList, "Update", dt)
end

function api.Draw(drawQueue)
	IterableMap.ApplySelf(self.trainList, "Draw", drawQueue)
end

function api.Initialize(world)
	self = {
		trainList = IterableMap.New(),
		world = world,
	}
end

return api
