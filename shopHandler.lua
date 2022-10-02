
local Font = require("include/font")
local util = require("include/util")
local TrackDefs, TrackDefList = util.LoadDefDirectory("defs/track")

local api = {}
local self = {}

local function InitializeDecks()
	local decks = {}
	for i = 1, Global.SHOP_SLOTS do
		local validItems = {}
		for j = 1, #TrackDefList do
			if TrackDefs[TrackDefList[j]].shopSlot == i then
				for k = 1, Global.DECK_SIZE_MULT do
					validItems[#validItems + 1] = TrackDefList[j]
				end
			end
		end
		decks[i] = DeckHandler.GetDeck(validItems, true)
	end
	return decks
end

local function UpdateItems()
	self.items[1] = "curve"
	self.items[2] = "straight"
	local drawnCards = DeckHandler.GetNextDraw(self.decks[3], 2)
	self.items[3] = drawnCards[1]
	self.items[4] = drawnCards[2]
	self.emptySlot = false
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

function api.AddTrackCredits(credits, source)
	if self.world.GetGameOver() then
		return false
	end
	self.trackCredits = self.trackCredits + credits
	GameHandler.AddSourceScore(credits, source)
end

function api.UpdateShopIfEmpty()
	if self.emptySlot then
		UpdateItems()
	end
end

function api.Update(dt)
	self.trackCreditTimer = self.trackCreditTimer - dt
	if self.trackCreditTimer <= 0 then
		self.trackCreditTimer = self.trackCreditTimer + Global.TRACK_CREDIT_TIME
		api.AddTrackCredits(1, "tickTrack")
	end
	if not self.heldTrack then
		api.UpdateShopIfEmpty()
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if key == "r" or key == "space" then
		self.trackRotation = (self.trackRotation + 1)%4
	end
end

function api.MousePressed(x, y, button)
	if button == 2 then
		self.trackRotation = (self.trackRotation + 1)%4
	end
	if button ~= 1 then
		return false
	end
	if not (self.hoveredItem and self.trackCredits > 0) then
		return false
	end
	if self.heldTrack then
		if self.items[self.hoveredItem] then
			if self.hoveredItem <= Global.SHOP_BIN_SLOTS and self.items[self.hoveredItem] == self.heldTrack then
				self.heldTrack = false
				self.emptySlot = false
			end
			return false
		end
		self.items[self.hoveredItem] = self.heldTrack
		self.heldTrack = false
		self.emptySlot = false
		self.trackCredits = self.trackCredits + 1
		return true
	end
	self.heldTrack = self.items[self.hoveredItem]
	self.items[self.hoveredItem] = false
	self.emptySlot = true
	self.trackCredits = self.trackCredits - 1
	return true
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
				love.graphics.rectangle("line", pos[1]*Global.GRID_SIZE, pos[2]*Global.GRID_SIZE, Global.GRID_SIZE, Global.GRID_SIZE, 4, 4, 8)
			end
			Resources.DrawImage(def.stateImage[1], mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8)
			if def.topImage then
				Resources.DrawImage(def.topImage, mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8)
			end
		end})
	end
	
	drawQueue:push({y=0; f=function()
		local shopItemsX = Global.WORLD_WIDTH*Global.GRID_SIZE + Global.SHOP_WIDTH*0.5
		local shopItemsY = 20
		
		Font.SetSize(1)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.print("Score: " .. math.floor(GameHandler.GetScore() + 0.02), shopItemsX - 100, shopItemsY - 30)
		love.graphics.print("Track: " .. math.floor(self.trackCredits + 0.02), shopItemsX - 100, shopItemsY + 30)
		
		local shopItemsSpacing = 240
		for i = 1, Global.SHOP_SLOTS do
			local y = shopItemsY + shopItemsSpacing * i
			local def = self.items[i] and TrackDefs[self.items[i]]
			if util.PosInRectangle(mousePos, shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2) then
				if (not self.heldTrack) or (not self.items[i]) or (i <= Global.SHOP_BIN_SLOTS and self.items[i] == self.heldTrack) then
					self.hoveredItem = i
				end
			end
			if self.items[i] then
				Resources.DrawImage(def.stateImage[1], shopItemsX, y, self.trackRotation * math.pi/2, 1, 2)
				if def.topImage then
					Resources.DrawImage(def.topImage, shopItemsX, y, self.trackRotation * math.pi/2, 1, 2)
				end
			end
			
			if self.trackCredits == 0 then
				love.graphics.setColor(0.5, 0.5, 0.5, 0.7)
				love.graphics.setLineWidth(4)
				love.graphics.rectangle("fill", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2, 8, 8, 16)
			end
			
			if self.hoveredItem == i and self.trackCredits > 0 then
				love.graphics.setColor(0.35, 1, 0.35, 0.8)
			else
				love.graphics.setColor(0, 0, 0, 0.8)
			end
			love.graphics.setLineWidth(8)
			love.graphics.rectangle("line", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2, 8, 8, 16)
		end
		
		Font.SetSize(2)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.print("- Every ten seconds an engine\n(or carriage) spawns and you\ngain a track.\n- Left click selects.\n- Right click rotates.\n- Score deliveries and travel\ndistance. Gain a bonus\ntrack every 1000 points.", shopItemsX - 200, shopItemsY + 120 + shopItemsSpacing * Global.SHOP_SLOTS)
		
		local barY = Global.WORLD_HEIGHT * Global.GRID_SIZE + Global.RESOURCE_BONUS_HEIGHT*0.5 + 10
		local barX = 100
		local barWidth = Global.WORLD_WIDTH * Global.GRID_SIZE / 4
		local barSpace = Global.WORLD_WIDTH * Global.GRID_SIZE / 12
		
		local showX, showY = GameHandler.GetShowOffset("food")
		if showY then
			InterfaceUtil.DrawSmoothNumberBar("food", {0, 1, 0}, {0.1, 0.1, 0.1}, {barX, barY + showY}, {barWidth, 40})
			love.graphics.setColor(0, 0, 0, 0.8)
			love.graphics.print("Food Delivered", barX, barY - 48 + showY)
			if showX then
				love.graphics.print("Order Size: " .. InterfaceUtil.Round(GameHandler.GetOrderSize()), barX + barWidth*0.5 + showX, barY - 48 + showY)
			end
		end
		barX = barX + barWidth + barSpace
		
		showX, showY = GameHandler.GetShowOffset("wood")
		if showY then
			InterfaceUtil.DrawSmoothNumberBar("wood", {0, 1, 0}, {0.1, 0.1, 0.1}, {barX, barY + showY}, {barWidth, 40})
			love.graphics.setColor(0, 0, 0, 0.8)
			love.graphics.print("Wood Delivered", barX, barY - 48 + showY)
			if showX then
				love.graphics.print("Train Speed: +" .. InterfaceUtil.Round((GameHandler.GetSpeedMult() - 1)*100) .. "%", barX + barWidth*0.5 + showX, barY - 48 + showY)
			end
		end
		barX = barX + barWidth + barSpace
		
		showX, showY = GameHandler.GetShowOffset("ore")
		if showY then
			InterfaceUtil.DrawSmoothNumberBar("ore", {0, 1, 0}, {0.1, 0.1, 0.1}, {barX, barY + showY}, {barWidth, 40})
			love.graphics.setColor(0, 0, 0, 0.8)
			love.graphics.print("Ore Delivered", barX, barY - 48 + showY)
			if showX then
				love.graphics.print("Carriages: " .. (1 + InterfaceUtil.Round(GameHandler.GetCartBonus())), barX + barWidth*0.5 + showX, barY - 48 + showY)
			end
		end
		barX = barX + barWidth + barSpace
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
		
		love.graphics.rectangle("fill", -1000, Global.BLACK_BAR_LEEWAY + Global.WORLD_HEIGHT * Global.GRID_SIZE + Global.RESOURCE_BONUS_HEIGHT, 5000, 3000)
		love.graphics.rectangle("fill", -1000, -3000 - Global.BLACK_BAR_LEEWAY, 5000, 3000)
		love.graphics.rectangle("fill", Global.BLACK_BAR_LEEWAY + Global.WORLD_WIDTH * Global.GRID_SIZE + Global.SHOP_WIDTH, -1000, 3000, 5000)
		love.graphics.rectangle("fill", -3000 - Global.BLACK_BAR_LEEWAY, -1000, 3000, 5000)
	end})
end

function api.Initialize(world)
	self = {
		world = world,
		items = {},
		decks = InitializeDecks(),
		trackCreditTimer = Global.TRACK_CREDIT_TIME,
	}
	self.heldTrack = false
	self.trackRotation = 0
	self.trackCredits = 5
	
	UpdateItems()
end

return api
