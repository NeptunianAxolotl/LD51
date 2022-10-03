
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local NewTrain = require("objects/train")

local self = {}
local api = {}

function api.AddTrain(trainType, gridPos, entry)
	trainData = {
		trainType = trainType,
	}
	local train = NewTrain(trainData, api, gridPos, entry, not self.firstTrainDone)
	IterableMap.Add(self.trainList, train)
	if not self.firstTrainDone then
		self.firstTrainDone = true
		return Global.TRAIN_SPAWN_TIME - 1 -- Minus one to leave the factory
	end
	return Global.TRAIN_SPAWN_TIME
end

local function DetectRuleOne() -- Very messsy
	--print("DetectRuleOne")
	local indexMax, keyByIndex, dataByKey = IterableMap.GetBarbarianData(self.trainList)
	local positionMap = {}
	local pointingMap = {}
	for i = 1, indexMax do
		local trainID = keyByIndex[i]
		local train = dataByKey[trainID]
		if train.travel > 0.52 then
			local nextTrack = TerrainHandler.GetTrackAtPos(train.currentTrack.pos, (train.currentPath.destination + train.currentTrack.rotation)%4)
			if nextTrack then
				local trackStr = train.currentTrack.pos[1] .. "_" .. train.currentTrack.pos[2]
				local nextStr = nextTrack.pos[1] .. "_" .. nextTrack.pos[2]
				--print(trainID, trackStr, nextStr)
				positionMap[trackStr] = train
				pointingMap[trackStr] = nextStr
				if pointingMap[nextStr] == trackStr then
					positionMap[nextStr].SetPermanentBlocked()
					train.SetPermanentBlocked()
				end
			end
		end
	end
end

function api.Update(dt)
	IterableMap.ApplySelfRandomOrder(self.trainList, "Update", dt)
	if math.random() < 0.01 then
		DetectRuleOne()
	end
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
