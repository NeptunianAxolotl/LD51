
local IterableMap = require("include/IterableMap")
local util = require("include/util")

local NewTrain = require("objects/train")
local MapDefs = util.LoadDefDirectory("defs/maps")

local self = {}
local api = {}

function api.AddTrain(trainType, gridPos, entry)
	if self.mapRules and self.mapRules.trainLimit then
		self.trainsSpawned = (self.trainsSpawned or 0)
		if self.trainsSpawned >= self.mapRules.trainLimit then
			return Global.TRAIN_SPAWN_TIME
		end
		self.trainsSpawned = self.trainsSpawned + 1
	end
	trainData = {
		trainType = trainType,
	}
	local train = NewTrain(trainData, api, gridPos, entry, self.baseCarriages)
	IterableMap.Add(self.trainList, train)
	return Global.TRAIN_SPAWN_TIME
end

function api.DefaultSpawnTimer()
	return (self.mapRules and self.mapRules.trainDelayOverride) or Global.TRAIN_SPAWN_TIME
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

local function SetupMapRules()
	local mapRules = MapDefs[self.world.GetMapName()].rules
	if mapRules then
		self.mapRules = mapRules
	end
	self.baseCarriages = MapDefs[self.world.GetMapName()].baseCarriages or 1
end

function api.NotifyGameLoss()
	-- Blow up all the trains
	IterableMap.ApplySelf(self.trainList, "SetPermanentBlocked")
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
	
	SetupMapRules()
end

return api
