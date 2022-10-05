
local util = require("include/util")
local Font = require("include/font")

local TrainDefs = util.LoadDefDirectory("defs/trains")

local function NewTrain(self, trainHandler, new_gridPos, new_entry, baseCarriages)
	self.def = TrainDefs[self.trainType]
	
	self.travel = 0
	self.speed = 1.2
	self.cartCount = baseCarriages + GameHandler.GetCartBonus()

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
	
	function self.SetPermanentBlocked()
		self.currentTrack.SetPermanentBlock(((self.currentPath.entry or 0) + self.currentTrack.rotation)%4)
		for i = 1, #self.carts do
			self.carts[i].currentTrack.SetPermanentBlock(((self.carts[i].currentPath.entry or 0) + self.carts[i].currentTrack.rotation)%4)
		end
		self.permanentlyBlocked = true
	end
	
	local function UpdateMovement(dt)
		if self.permanentlyBlocked then
			self.fireSpawnTimer = (self.fireSpawnTimer or 0) - dt
			if self.fireSpawnTimer <= 0 then
				self.fireSpawnTimer = 0.12 + 0.15 * math.random()
				local drawPos, drawRotation = self.currentTrack.GetPathDraw(self.currentPath, self.travel)
				if math.random() < 0.46 then
					EffectsHandler.SpawnEffect("fire", util.RandomPointInRectangle(drawPos, 45 * LevelHandler.TileScale(), 12 * LevelHandler.TileScale(), drawRotation), {
						scale = (0.7 + 0.3*math.random()) * LevelHandler.TileScale(),
						inFront = self.currentPath.setEffect
					})
				end
				for i = 1, #self.carts do
					if math.random() < 0.38 then
						drawPos, drawRotation = self.carts[i].currentTrack.GetPathDraw(self.carts[i].currentPath, self.carts[i].travel)
						EffectsHandler.SpawnEffect("fire", util.RandomPointInRectangle(drawPos, 30 * LevelHandler.TileScale(), 12 * LevelHandler.TileScale(), drawRotation), {
							scale = (0.7 + 0.3*math.random()) * LevelHandler.TileScale(),
							inFront = self.carts[i].currentPath.setEffect
						})
					end
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
			elseif self.currentTrack.def.canPathSwitch and self.travel < Global.PATH_SWITCH_DIST then
				local trackDef = self.currentTrack.def
				local switchMap = trackDef.canPathSwitch[(self.destination - self.currentTrack.rotation)%4]
				print((self.destination - self.currentTrack.rotation)%4)
				if switchMap then
					local altPath = trackDef.paths[switchMap]
					if altPath and altPath.requiredState == self.currentTrack.state then
						local altDestination = (altPath.destination + self.currentTrack.rotation)%4
						local altTrack = TerrainHandler.GetTrackAtPos(self.currentTrack.GetPos(), altDestination)
						local altEntry = (altDestination + 2)%4
						if altTrack and not altTrack.IsInUse(nextEntry) and altTrack.GetPathAndNextTrack(altEntry) then
							self.currentPath = altPath
							self.destination = altDestination
							self.nextTrack = altTrack
							self.nextTrack.SetUsedState(true, altEntry)
						end
					end
				end
			end
		end
		local mult = GameHandler.GetSpeedMult()*(self.currentPath.speedMult or 1)
		local allBlocked, someBlocked = TerrainHandler.AllExitsPermanentlyBlocked(self.currentTrack.GetPos(), self.currentTrack, self.currentPath.entry)
		local stopOffset = ((not (someBlocked and not someBlocked[self.destination]) and self.currentPath.trainStopOffset) or 0)
		local deccelMult = (self.currentPath.deccelMult or 1)
		local travelFullSpeed = self.nextTrack and not self.currentTrack.ShouldTrainSlow(self)
		local wantStop = (not self.nextTrack)
		if travelFullSpeed then
			self.speed = math.min(self.def.maxSpeed, self.speed + dt*self.def.accel*mult)
		else
			if (self.speed > -0.05 and wantStop) or (self.speed > 0.5 and not wantStop) then
				if (self.travel > 0.4 + stopOffset or self.speed > 0.15) or self.travel > 0.55 + stopOffset then
					self.speed = self.speed - dt*self.def.deccel*mult*deccelMult
				end
			end
			
			if self.speed < 0 then
				if self.travel < 0.52 + stopOffset then
					self.speed = 0.15
				elseif self.travel < 0.6 + stopOffset then
					self.speed = 0
				end
			end
			if (self.speed < 0.5 and not wantStop) then
				self.speed = math.min(self.def.maxSpeed, self.speed + dt*self.def.accel*mult)
			end
		end
		local travelChange = dt*self.speed*mult
		self.travel = self.travel + travelChange
		if not travelFullSpeed then
			if self.travel >= 0.92 + stopOffset then
				self.speed = -0.2
				if self.travel >= 0.99 + stopOffset then
					self.travel = 0.99 + stopOffset
				end
			end
		end
		if oldTravel < 0.5 and self.travel >= 0.5 and self.currentTrack.def.trainMidFunc then
			self.currentTrack.def.trainMidFunc(self.currentTrack, self)
		end
		if math.random() < 0.2 and self.travel > 0.52 and allBlocked then
			self.SetPermanentBlocked()
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
				Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRotation, false, LevelHandler.TileScale())
			end})
			for i = #self.carts, 1, -1 do
				local drawY = (self.carts[i].currentPath.raiseTrain or 10) - i*0.01
				drawQueue:push({y=drawY; f=function()
					local drawPos, drawRotation = self.carts[i].currentTrack.GetPathDraw(self.carts[i].currentPath, self.carts[i].travel)
					Resources.DrawImage(self.def.cartImage, drawPos[1], drawPos[2], drawRotation, false, LevelHandler.TileScale())
					if self.cargo then
						Resources.DrawImage(self.cargo, drawPos[1], drawPos[2], drawRotation, false, LevelHandler.TileScale())
					end
				end})
			end
		else
			drawQueue:push({y=10; f=function()
				local drawPos, drawRotation
				for i = #self.carts, 1, -1 do
					drawPos, drawRotation = self.carts[i].currentTrack.GetPathDraw(self.carts[i].currentPath, self.carts[i].travel)
					Resources.DrawImage(self.def.cartImage, drawPos[1], drawPos[2], drawRotation, false, LevelHandler.TileScale())
					if self.cargo then
						Resources.DrawImage(self.cargo, drawPos[1], drawPos[2], drawRotation, false, LevelHandler.TileScale())
					end
				end
				drawPos, drawRotation = self.currentTrack.GetPathDraw(self.currentPath, self.travel)
				Resources.DrawImage(self.def.image, drawPos[1], drawPos[2], drawRotation, false, LevelHandler.TileScale())
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
