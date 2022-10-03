
local Font = require("include/font")
local util = require("include/util")
local TrackDefs, TrackDefList = util.LoadDefDirectory("defs/track")

local api = {}
local self = {}

local function InitializeDeck()
	local deck = {}
	local validItems = {}
	for j = 1, #TrackDefList do
		local def = TrackDefs[TrackDefList[j]]
		if def.shopFrequency then
			for k = 1, Global.DECK_SIZE_MULT * def.shopFrequency do
				validItems[#validItems + 1] = TrackDefList[j]
			end
		end
	end
	return DeckHandler.GetDeck(validItems, true)
end

local function UpdateItems(refreshAll)
	self.emptySlot = false
	if refreshAll then
		local draws = DeckHandler.GetNextDraw(self.deck, 4)
		for i = 1, Global.SHOP_SLOTS do
			self.items[i] = draws[i]
		end
		return
	end
	
	for i = 1, Global.SHOP_SLOTS do
		if not self.items[i] then
			self.items[i] = DeckHandler.GetNextDraw(self.deck, 1)[1]
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
	if not item then
		return false
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
	if key == "1" then
		ClickShopButton(1)
	end
	if key == "2" then
		ClickShopButton(2)
	end
	if key == "3" then
		ClickShopButton(3)
	end
	if key == "4" then
		ClickShopButton(4)
	end
end

function api.MousePressed(x, y, button)
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
			Resources.DrawImage(def.stateImage[1], mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8)
			if def.topImage then
				Resources.DrawImage(def.topImage, mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8)
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
		
		Font.SetSize(2)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.print("- Every ten seconds an engine\n(or carriage) spawns and you\ngain a track.\n- Left click selects.\n- Right click rotates.\n- Score deliveries and travel\ndistance. Gain a bonus\ntrack every 1000 points.", shopItemsX - 200, shopItemsY + 120 + shopItemsSpacing * Global.SHOP_SLOTS)
		
		local barY = TerrainHandler.Height() * Global.GRID_SIZE + Global.RESOURCE_BONUS_HEIGHT*0.5 + 10
		local barX = 100
		local barWidth = TerrainHandler.Width() * Global.GRID_SIZE / 4
		local barSpace = TerrainHandler.Width() * Global.GRID_SIZE / 12
		
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
