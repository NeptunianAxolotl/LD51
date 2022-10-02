
local util = require("include/util")
local Font = require("include/font")

local TrainDefs = util.LoadDefDirectory("defs/trains")

local function NewTrain(self, trainHandler, new_gridPos, new_entry)
	self.def = TrainDefs[self.trainType]
	
	self.travel = 0
	self.speed = 0
	self.cartCount = self.def.cartCount + GameHandler.GetCartBonus()
	if self.cartCount > 0 then
		self.travelLimit = self.def.cartDist+ 0.25
		self.spawnWaits = self.cartCount
		self.spawnWaitTimer = Global.TRAIN_SPAWN_TIME
	end
	
	local function EnterTrack(nextTrack, entry, isSpawn)
		local newPath, newDestination = nextTrack.GetPathAndNextTrack(entry, isSpawn)
		if not newPath then
			return
		end
		if self.currentTrack and self.cartCount == 0 then
			self.currentTrack.SetUsedState(false, entry)
		end
		
		self.currentTrack = nextTrack
		self.currentPath = newPath
		self.destination = newDestination
		self.currentTrack.SetUsedState(true, entry)
		self.nextTrack = false
		
		GameHandler.AddScore(Global.TRAVEL_SCORE)
	end
	EnterTrack(TerrainHandler.GetTrackAtPos(new_gridPos), new_entry, true)
	
	self.carts = {}
	for i = 1, self.cartCount do
		self.carts[i] = {
			currentTrack = self.currentTrack,
			currentPath = self.currentPath,
			travel = 0,
			moved = false,
		}
	end
	
	local function ManageCart(cartIndex, aheadTravel, aheadTrack, aheadPath)
		cart = self.carts[cartIndex]
		if aheadTravel > self.def.cartDist then
			if cart.travel > aheadTravel then
				if cartIndex == #self.carts then
					-- Last cart frees current track
					cart.currentTrack.SetUsedState(false, cart.currentPath.entry and (cart.currentPath.entry + cart.currentTrack.rotation)%4)
				end
				cart.currentTrack = aheadTrack
				cart.currentPath = aheadPath
			end
			cart.travel = aheadTravel - self.def.cartDist
			cart.moved = true
		elseif cart.moved then
			cart.travel = aheadTravel - self.def.cartDist + 1
		end
	end
	
	function self.GetCarrying()
		return self.cargo
	end
	
	function self.SetCarrying(newCarry)
		self.cargo = newCarry
	end
	
	local function UpdateMovement(dt)
		if self.permanentlyBlocked then
			self.fireSpawnTimer = (self.fireSpawnTimer or 0) - dt
			if self.fireSpawnTimer <= 0 then
				self.fireSpawnTimer = 0.2 + 0.15 * math.random()
				local drawPos, drawRotation = self.currentTrack.GetPathDraw(self.currentPath, self.travel)
				EffectsHandler.SpawnEffect("fire", util.RandomPointInRectangle(drawPos, 45, 10, drawRotation))
				for i = 1, #self.carts do
					drawPos, drawRotation = self.carts[i].currentTrack.GetPathDraw(self.carts[i].currentPath, self.carts[i].travel)
					EffectsHandler.SpawnEffect("fire", util.RandomPointInRectangle(drawPos, 30, 10, drawRotation))
				end
			end
			return
		end
		local oldTravel = self.travel
		if not self.nextTrack then
			local nextTrack = TerrainHandler.GetTrackAtPos(self.currentTrack.GetPos(), self.destination)
			local nextEntry = (self.destination + 2)%4
			if nextTrack and not nextTrack.IsInUse(nextEntry) and nextTrack.GetPathAndNextTrack(nextEntry) then
				self.nextTrack = nextTrack
				self.nextTrack.SetUsedState(true, nextEntry)
			end
		end
		local mult = GameHandler.GetSpeedMult()*(self.currentPath.speedMult or 1)
		if self.nextTrack then
			self.speed = math.min(self.def.maxSpeed, self.speed + dt*self.def.accel*mult)
		else
			if self.speed > -0.05 then
				if (self.travel > 0.4 or self.speed > 0.12) or self.travel > 0.55 then
					self.speed = self.speed - dt*self.def.deccel*mult
				end
			end
			if self.speed < 0 then
				if self.travel < 0.52 then
					self.speed = 0.12
				elseif self.travel < 0.6 then
					self.speed = 0
				end
			end
		end
		if self.travelLimit then
			self.speed = math.min(0.3, self.speed)
		end
		local travelChange = dt*self.speed*mult
		if self.travelLimit then
			self.travelLimit = self.travelLimit - travelChange
			if self.travelLimit < 0 then
				travelChange = travelChange + self.travelLimit
				self.travelLimit = 0
			end
		end
		self.travel = self.travel + travelChange
		if not self.nextTrack then
			if self.travel >= 0.92 then
				self.speed = -0.2
				if self.travel >= 0.99 then
					self.travel = 0.99
				end
			end
		end
		if oldTravel < 0.5 and self.travel >= 0.5 and self.currentTrack.def.trainMidFunc then
			self.currentTrack.def.trainMidFunc(self.currentTrack, self)
		end
		if self.travel > 0.52 and TerrainHandler.IsExitPermanentlyBlocked(self.currentTrack.GetPos(), self.destination) then
			self.currentTrack.SetPermanentBlock()
			for i = 1, #self.carts do
				self.carts[i].currentTrack.SetPermanentBlock()
			end
			self.permanentlyBlocked = true
		end
		if self.travel >= 1 then
			self.travel = self.travel - 1
			EnterTrack(self.nextTrack, (self.destination + 2)%4)
		end
		
		if self.cartCount > 0 then
			ManageCart(1, self.travel, self.currentTrack, self.currentPath)
			for i = 2, #self.carts do
				ManageCart(i, self.carts[i - 1].travel, self.carts[i - 1].currentTrack, self.carts[i - 1].currentPath)
			end
		end
		
		if self.spawnWaitTimer then
			self.spawnWaitTimer = self.spawnWaitTimer - dt
			if self.spawnWaitTimer <= 0 then
				self.spawnWaits = self.spawnWaits - 1
				if self.spawnWaits <= 0 then
					self.travelLimit = false
					self.spawnWaitTimer = false
				else
					self.travelLimit = self.def.cartDist
					self.spawnWaitTimer = Global.TRAIN_SPAWN_TIME
				end
			end
		end
	end
	
	function self.Update(dt)
		UpdateMovement(dt)
	end
	
	function self.Draw(drawQueue)
		local hasBridge = self.currentPath.raiseTrain
		if not hasBridge then
			for i = 1, #self.carts do
				if self.carts[i].currentPath.raiseTrain then
					hasBridge = true
					break
				end
			end
		end
		
		if hasBridge then
			drawQueue:push({y=(self.currentPath.raiseTrain or 10); f=function()
				local drawPos, drawRotation = self.currentTrack.GetPathDraw(self.currentPath, self.travel)
				Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRotation)
			end})
			for i = #self.carts, 1, -1 do
				local drawY = (self.carts[i].currentPath.raiseTrain or 10) - i*0.01
				drawQueue:push({y=drawY; f=function()
					local drawPos, drawRotation = self.carts[i].currentTrack.GetPathDraw(self.carts[i].currentPath, self.carts[i].travel)
					Resources.DrawImage(self.def.cartImage, drawPos[1], drawPos[2], drawRotation)
					if self.cargo then
						Resources.DrawImage(self.cargo, drawPos[1], drawPos[2], drawRotation)
					end
				end})
			end
		else
			drawQueue:push({y=10; f=function()
				local drawPos, drawRotation
				for i = #self.carts, 1, -1 do
					drawPos, drawRotation = self.carts[i].currentTrack.GetPathDraw(self.carts[i].currentPath, self.carts[i].travel)
					Resources.DrawImage(self.def.cartImage, drawPos[1], drawPos[2], drawRotation)
					if self.cargo then
						Resources.DrawImage(self.cargo, drawPos[1], drawPos[2], drawRotation)
					end
				end
				drawPos, drawRotation = self.currentTrack.GetPathDraw(self.currentPath, self.travel)
				Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRotation)
			end})
		end
		if DRAW_DEBUG then
			love.graphics.circle('line',self.pos[1], self.pos[2], def.radius)
		end
	end
	
	function self.DrawInterface()
		
	end
	
	return self
end

return NewTrain
