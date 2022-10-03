
local Font = require("include/font")
local util = require("include/util")
local TrackDefs, TrackDefList = util.LoadDefDirectory("defs/track")

local api = {}
local self = {}

local function InitializeDeck()
	local deck = {}
	local validItems = {}
	for i = 1, #TrackDefList do
		local def = TrackDefs[TrackDefList[i]]
		if def.shopFrequency then
			for j = 1, Global.DECK_SIZE_MULT * def.shopFrequency do
				validItems[#validItems + 1] = TrackDefList[i]
			end
		end
	end
	return DeckHandler.GetDeck(validItems, true)
end

local function UpdateItems(refreshAll)
	self.emptySlot = false
	local toAvoid = {}
	for i = 1, Global.SHOP_SLOTS do
		if self.items[i] then
			toAvoid[self.items[i]] = true
		end
	end
	if refreshAll then
		local draws = DeckHandler.GetNextDraw(self.deck, 4, toAvoid)
		for i = 1, Global.SHOP_SLOTS do
			self.items[i] = draws[i]
		end
		return
	end
	
	for i = 1, Global.SHOP_SLOTS do
		if not self.items[i] then
			self.items[i] = DeckHandler.GetNextDraw(self.deck, 1, toAvoid)[1]
		end
	end
end

function api.GetHeldTrack()
	if not self.heldTrack then
		return false
	end
	return self.heldTrack, self.trackRotation
end

function api.UseHeldTrack()
	self.heldTrack = false
end

function api.SetHeldTrack(newTrack, newRotation)
	self.heldTrack = newTrack
	if newRotation then
		self.trackRotation = newRotation
	end
end

function api.UpdateShopIfEmpty()
	if self.emptySlot then
		UpdateItems()
	end
end

local function ClickShopButton(item)
	if self.shopBlockedTimer or not item then
		return false
	end
	if item == Global.SHOP_SLOTS + 1 then
		self.shopBlockedTimer = Global.REFRESH_TIMER
		self.heldTrack = false
		UpdateItems(true)
		return
	end
	if self.heldTrack then
		if self.items[item] and self.emptySlot then
			self.items[self.emptySlot] = self.heldTrack
			self.heldTrack = self.items[item]
			self.emptySlot = item
			self.items[item] = false
			return true
		end
		if self.emptySlot == item then
			self.items[item] = self.heldTrack
			self.heldTrack = false
			self.emptySlot = false
			return true
		end
	end
	self.heldTrack = self.items[item]
	self.items[item] = false
	self.emptySlot = item
	return true
end

function api.Update(dt)
	if self.shopBlockedTimer then
		self.shopBlockedTimer = self.shopBlockedTimer - dt
		if self.shopBlockedTimer <= 0 then
			self.shopBlockedTimer = false
		end
	end
	if not self.heldTrack then
		api.UpdateShopIfEmpty()
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if key == "r" or key == "space" then
		self.trackRotation = (self.trackRotation + 1)%4
	end
	if Global.DOODAD_MODE then
		if key == "1" then
			self.heldTrack = "forest"
		elseif key == "2" then
			self.heldTrack = "field"
		elseif key == "3" then
			self.heldTrack = "mountain_small"
		elseif key == "4" then
			self.heldTrack = "mountain_large"
		end
		return
	end
	for i = 1, Global.SHOP_SLOTS do
		if key == tostring(i) then
			ClickShopButton(i)
		end
	end
	if key == "e" then
		ClickShopButton(Global.SHOP_SLOTS + 1)
	end
end

function api.MousePressed(x, y, button)
	if Global.DOODAD_MODE then
		if self.heldTrack then
			local mousePos = self.world.GetMousePosition()
			mousePos = util.Subtract(util.Mult(1 / TerrainHandler.TileSize() , mousePos), {0.5, 0.5})
			DoodadHandler.AddDoodad(mousePos, self.heldTrack)
			print([[		{pos = {]] .. mousePos[1] .. [[, ]] .. mousePos[2] .. [[}, doodadType = "]] .. self.heldTrack .. [["},]])
		end
		return
	end
	if button == 2 then
		self.trackRotation = (self.trackRotation + 1)%4
	end
	if button ~= 1 then
		return false
	end
	return ClickShopButton(self.hoveredItem)
end

function api.Draw(drawQueue)
	local mousePos = self.world.GetMousePosition()
	self.hoveredItem = false
	if self.heldTrack and not self.world.GetGameOver() then
		local def = TrackDefs[self.heldTrack]
		drawQueue:push({y=1000; f=function()
			local pos = TerrainHandler.GetValidPlacement(mousePos)
			if pos then
				love.graphics.setColor(1, 1, 1, 0.2)
				love.graphics.setLineWidth(5)
				love.graphics.rectangle("line", pos[1]*TerrainHandler.TileSize(), pos[2]*TerrainHandler.TileSize(), TerrainHandler.TileSize(), TerrainHandler.TileSize(), 4, 4, 8)
			end
			Resources.DrawImage(def.stateImage[1], mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8, TerrainHandler.TileScale())
			if def.topImage then
				Resources.DrawImage(def.topImage, mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8, TerrainHandler.TileScale())
			end
		end})
	end
	
	drawQueue:push({y=800; f=function()
		local shopItemsX = Global.VIEW_WIDTH -  Global.SHOP_WIDTH*0.5
		local shopItemsY = 75
		
		Font.SetSize(1)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.print("Time: " .. util.SecondsToString(GameHandler.GetTimeRemaining()), shopItemsX - 100, shopItemsY - 90)
		love.graphics.print("Score: " .. math.floor(GameHandler.GetScore() + 0.02), shopItemsX - 100, shopItemsY - 30)
		
		local shopItemsSpacing = 240
		for i = 1, Global.SHOP_SLOTS do
			local y = shopItemsY + shopItemsSpacing * i
			local def = self.items[i] and TrackDefs[self.items[i]]
			if util.PosInRectangle(mousePos, shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2) then
				self.hoveredItem = i
			end
			
			love.graphics.setColor(Global.BACK_COL[1], Global.BACK_COL[2], Global.BACK_COL[3], 1)
			love.graphics.setLineWidth(4)
			love.graphics.rectangle("fill", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2, 8, 8, 16)
			
			if self.items[i] then
				Resources.DrawImage(def.stateImage[1], shopItemsX, y, self.trackRotation * math.pi/2, 1, 2)
				if def.topImage then
					Resources.DrawImage(def.topImage, shopItemsX, y, self.trackRotation * math.pi/2, 1, 2)
				end
			end
			
			if self.shopBlockedTimer then
				love.graphics.setColor(0.5, 0.5, 0.5, 0.7)
				love.graphics.setLineWidth(4)
				love.graphics.rectangle("fill", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2, 8, 8, 16)
			end
			
			if self.hoveredItem == i and not self.shopBlockedTimer then
				love.graphics.setColor(0.35, 1, 0.35, 0.8)
			else
				love.graphics.setColor(0, 0, 0, 0.8)
			end
			love.graphics.setLineWidth(8)
			love.graphics.rectangle("line", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2, 8, 8, 16)
		end
		
		local y = shopItemsY + shopItemsSpacing * (Global.SHOP_SLOTS + 1.1)
		if util.PosInRectangle(mousePos, shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE) then
			self.hoveredItem = Global.SHOP_SLOTS + 1
		end
		if self.shopBlockedTimer then
			love.graphics.setColor(0.5, 0.5, 0.5, 1)
		else
			love.graphics.setColor(0.5, 0.7, 0.8, 1)
		end
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE, 8, 8, 16)
		
		if self.hoveredItem == Global.SHOP_SLOTS + 1 and not self.shopBlockedTimer then
			love.graphics.setColor(0.35, 1, 0.35, 0.8)
		else
			love.graphics.setColor(0, 0, 0, 0.8)
		end
		love.graphics.setLineWidth(8)
		love.graphics.rectangle("line", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE, 8, 8, 16)
			
		Font.SetSize(1)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.printf("Refresh", shopItemsX - Global.GRID_SIZE - 20, y - Global.GRID_SIZE + 14, Global.GRID_SIZE * 2 + 35, "center")
	end})
	
	drawQueue:push({y=1000; f=function()
		love.graphics.setColor(0, 0, 0, 1)
		
		local offset = 10
		GameHandler.DrawScoreSource("travelScore", offset)
		offset = offset + 30
		GameHandler.DrawScoreSource("deliverScore", offset)
		offset = offset + 30
		GameHandler.DrawScoreSource("deliverBonusScore", offset)
		offset = offset + 30
		GameHandler.DrawScoreSource("tickTrack", offset)
		offset = offset + 30
		GameHandler.DrawScoreSource("deliverTrack", offset)
		offset = offset + 30
		love.graphics.setColor(0, 0, 0, 1)
		
		love.graphics.rectangle("fill", -1000, Global.BLACK_BAR_LEEWAY + Global.VIEW_HEIGHT, 5000, 3000)
		love.graphics.rectangle("fill", -1000, -3000 - Global.BLACK_BAR_LEEWAY, 5000, 3000)
		love.graphics.rectangle("fill", Global.VIEW_WIDTH, -1000, 3000, 5000)
		love.graphics.rectangle("fill", -3000 - Global.BLACK_BAR_LEEWAY, -1000, 3000, 5000)
	end})
end

function api.Initialize(world)
	self = {
		world = world,
		items = {},
		deck = InitializeDeck(),
		shopBlockedTimer = false,
	}
	self.heldTrack = false
	self.trackRotation = 0
	
	UpdateItems(true)
end

return api
