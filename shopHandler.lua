
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
	self.shopRotation = self.trackRotation
	for i = 1, Global.SHOP_SLOTS do
		self.items[i] = DeckHandler.GetNextDraw(self.decks[i])[1]
	end
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

function api.Update(dt)
	self.trackCreditTimer = self.trackCreditTimer - dt
	if self.trackCreditTimer <= 0 then
		self.trackCreditTimer = self.trackCreditTimer + Global.TRACK_CREDIT_TIME
		self.trackCredits = self.trackCredits + 1
	end
	if not self.heldTrack and self.emptySlot and self.trackCredits > 0 then
		UpdateItems()
	end
end

function api.KeyPressed(key, scancode, isRepeat)
	if key == "r" or key == "space" then
		self.trackRotation = (self.trackRotation + 1)%4
	end
end

function api.MousePressed(x, y)
	if not (self.hoveredItem and self.trackCredits > 0) then
		return false
	end
	self.heldTrack = self.items[self.hoveredItem]
	self.trackRotation = self.shopRotation
	self.items[self.hoveredItem] = false
	self.emptySlot = true
	self.trackCredits = self.trackCredits - 1
	return true
end

function api.Draw(drawQueue)
	local mousePos = self.world.GetMousePosition()
	self.hoveredItem = false
	if self.heldTrack then
		local def = TrackDefs[self.heldTrack]
		drawQueue:push({y=1000; f=function()
			local gx, gy = math.floor(mousePos[1] / Global.GRID_SIZE), math.floor(mousePos[2] / Global.GRID_SIZE)
			if not (gx < 0 or gy < 0 or gx >= Global.WORLD_WIDTH or gy >= Global.WORLD_HEIGHT) then
				love.graphics.setColor(1, 1, 1, 0.2)
				love.graphics.setLineWidth(5)
				love.graphics.rectangle("line", gx*Global.GRID_SIZE, gy*Global.GRID_SIZE, Global.GRID_SIZE, Global.GRID_SIZE, 4, 4, 8)
			end
			Resources.DrawImage(def.stateImage[1], mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8)
		end})
	end
	
	drawQueue:push({y=0; f=function()
		local shopItemsX = Global.WORLD_WIDTH*Global.GRID_SIZE + Global.SHOP_WIDTH*0.5
		local shopItemsY = 100
		
		Font.SetSize(1)
		love.graphics.print("Track: " .. math.floor(self.trackCredits + 0.02), shopItemsX - 100, shopItemsY)
		
		local shopItemsSpacing = 240
		for i = 1, Global.SHOP_SLOTS do
			local y = shopItemsY + shopItemsSpacing * i
			local def = self.items[i] and TrackDefs[self.items[i]]
			if (not self.heldTrack) and util.PosInRectangle(mousePos, shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2) then
				self.hoveredItem = i
			end
				if self.items[i] then
					Resources.DrawImage(def.stateImage[1], shopItemsX, y, self.shopRotation * math.pi/2, 1, 2)
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
	self.shopRotation = 0
	self.trackCredits = 5
	
	UpdateItems()
end

return api