
local Font = require("include/font")
local util = require("include/util")

local TrackDefs, TrackDefList = util.LoadDefDirectory("defs/track")
local MapDefs = util.LoadDefDirectory("defs/maps")

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

local function SetupWorldRules()
	local map = MapDefs[self.world.GetMapName()]
	if map.rules then
		self.mapRules = map.rules
		if self.mapRules.shopState then
			for i = 1, #self.mapRules.shopState do
				self.items[i] = self.mapRules.shopState[i]
			end
		end
	end
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
	if not item then
		return false
	end
	if item == Global.SHOP_SLOTS + 1 then
		if self.shopBlockedTimer then
			return
		end
		self.shopBlockedTimer = Global.REFRESH_TIMER
		self.heldTrack = false
		UpdateItems(true)
		SoundHandler.PlaySound("switch")
		return
	end
	if self.heldTrack then
		if self.items[item] and self.emptySlot then
			self.items[self.emptySlot] = self.heldTrack
			self.heldTrack = self.items[item]
			self.emptySlot = item
			self.items[item] = false
			SoundHandler.PlaySound("put")
			return true
		end
		if self.emptySlot == item then
			self.items[item] = self.heldTrack
			self.heldTrack = false
			self.emptySlot = false
			SoundHandler.PlaySound("put")
			return true
		end
	end
	SoundHandler.PlaySound("take")
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
		--SoundHandler.PlaySound("spin")
	end
	if Global.DOODAD_MODE then
		if key == "1" then
			self.heldTrack = "forest"
			self.holdingDoodad = true
		elseif key == "2" then
			self.heldTrack = "field"
			self.holdingDoodad = true
		elseif key == "3" then
			self.heldTrack = "mountain_small"
			self.holdingDoodad = true
		elseif key == "4" then
			self.heldTrack = "mountain_large"
			self.holdingDoodad = true
		elseif key == "5" then
			self.heldTrack = "grass"
			self.holdingDoodad = true
		end
		if key == "q" then
			self.heldTrack = "block"
			self.holdingDoodad = false
		elseif key == "w" then
			self.heldTrack = "town"
			self.holdingDoodad = false
		elseif key == "a" then
			self.heldTrack = "sawmill"
			self.holdingDoodad = false
		elseif key == "s" then
			self.heldTrack = "mine"
			self.holdingDoodad = false
		elseif key == "d" then
			self.heldTrack = "farm"
			self.holdingDoodad = false
		elseif key == "f" then
			self.heldTrack = "factory"
			self.holdingDoodad = false
		elseif key == "t" then
			self.heldTrack = "straight"
			self.holdingDoodad = false
		elseif key == "y" then
			self.heldTrack = "curve"
			self.holdingDoodad = false
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
		if self.holdingDoodad then
			self.trackRotation = 0
		elseif button == 2 then
			self.trackRotation = (self.trackRotation + 1)%4
			--SoundHandler.PlaySound("spin")
		end
		if button == 1 and self.heldTrack then
			local mousePos = self.world.GetMousePosition()
			if self.holdingDoodad then
				mousePos = util.Subtract(util.Mult(1 / TerrainHandler.TileSize() , mousePos), {0.5, 0.5})
				DoodadHandler.AddDoodad(mousePos, self.heldTrack)
				print([[{pos = {]] .. mousePos[1] .. [[, ]] .. mousePos[2] .. [[}, doodadType = "]] .. self.heldTrack .. [["},]])
			else
				mousePos = {math.floor(mousePos[1] / TerrainHandler.TileSize()), math.floor(mousePos[2] / TerrainHandler.TileSize())}
				TerrainHandler.AddTrack(mousePos, self.heldTrack, self.trackRotation)
				print([[{pos = {]] .. mousePos[1] .. [[, ]] .. mousePos[2] .. [[}, rot = ]] .. self.trackRotation .. [[, trackType = "]] .. self.heldTrack .. [["},]])
			end
		end
		return
	end
	if button == 2 then
		self.trackRotation = (self.trackRotation + 1)%4
		--SoundHandler.PlaySound("spin")
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
			if def.stateImage then
				Resources.DrawImage(def.stateImage[1], mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8, TerrainHandler.TileScale())
			end
			if def.topImage then
				Resources.DrawImage(def.topImage, mousePos[1], mousePos[2], self.trackRotation * math.pi/2, 0.8, TerrainHandler.TileScale())
			end
		end})
	end
	
	drawQueue:push({y=800; f=function()
		local shopItemsX = Global.VIEW_WIDTH -  Global.SHOP_WIDTH*0.5
		local shopItemsY = 160 - TerrainHandler.GetVertOffset()
		local buttonExtra = 20
		
		love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.98)
		love.graphics.rectangle("fill", Global.VIEW_WIDTH - Global.SHOP_WIDTH, -1000, Global.SHOP_WIDTH * 2, Global.VIEW_HEIGHT + 2000)
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.setLineWidth(12)
		love.graphics.rectangle("line", Global.VIEW_WIDTH - Global.SHOP_WIDTH, -1000, Global.SHOP_WIDTH * 2, Global.VIEW_HEIGHT + 2000, 8, 8, 16)
		
		love.graphics.setColor(0, 0, 0, 1)
		Font.SetSize(0)
		love.graphics.printf(TerrainHandler.GetLevelHumanName(), shopItemsX - Global.SHOP_WIDTH*0.45, shopItemsY - 140, Global.SHOP_WIDTH*0.9, "center")
		Font.SetSize(1)
		love.graphics.printf("Track Shop" , shopItemsX - 200, shopItemsY + 30, 400, "center")
		
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
			
			if self.items[i] and def.stateImage then
				Resources.DrawImage(def.stateImage[1], shopItemsX, y, self.trackRotation * math.pi/2, 1, 2)
				if def.topImage then
					Resources.DrawImage(def.topImage, shopItemsX, y, self.trackRotation * math.pi/2, 1, 2)
				end
			end
			
			if self.hoveredItem == i then
				love.graphics.setColor(0.35, 1, 0.35, 0.8)
			else
				love.graphics.setColor(0, 0, 0, 0.8)
			end
			love.graphics.setLineWidth(8)
			love.graphics.rectangle("line", shopItemsX - Global.GRID_SIZE, y - Global.GRID_SIZE, Global.GRID_SIZE * 2, Global.GRID_SIZE * 2, 8, 8, 16)
		end
		
		if (self.mapRules and self.mapRules.refreshDisabled) then
			return
		end
		local y = shopItemsY + shopItemsSpacing * (Global.SHOP_SLOTS + 1.1)
		if util.PosInRectangle(mousePos, shopItemsX - Global.GRID_SIZE - buttonExtra, y - Global.GRID_SIZE, Global.GRID_SIZE * 2 + buttonExtra*2, Global.GRID_SIZE) then
			self.hoveredItem = Global.SHOP_SLOTS + 1
		end
		if self.shopBlockedTimer then
			love.graphics.setColor(0.45, 0.65, 0.72, 1)
		else
			love.graphics.setColor(0.5, 0.7, 0.8, 1)
		end
		love.graphics.setLineWidth(4)
		love.graphics.rectangle("fill", shopItemsX - Global.GRID_SIZE - buttonExtra, y - Global.GRID_SIZE, Global.GRID_SIZE * 2 + buttonExtra*2, Global.GRID_SIZE, 8, 8, 16)
		
		if self.shopBlockedTimer then
			local prop = self.shopBlockedTimer / Global.REFRESH_TIMER
			love.graphics.setColor(0.5, 0.5, 0.5, 1)
			love.graphics.rectangle("fill", shopItemsX - Global.GRID_SIZE - buttonExtra, y - Global.GRID_SIZE, prop * (Global.GRID_SIZE * 2 + buttonExtra*2), Global.GRID_SIZE, 8, 8, 16)
		end
		
		if self.hoveredItem == Global.SHOP_SLOTS + 1 and not self.shopBlockedTimer then
			love.graphics.setColor(0.35, 1, 0.35, 0.8)
		else
			love.graphics.setColor(0, 0, 0, 0.8)
		end
		love.graphics.setLineWidth(8)
		love.graphics.rectangle("line", shopItemsX - Global.GRID_SIZE - buttonExtra, y - Global.GRID_SIZE, Global.GRID_SIZE * 2 + buttonExtra*2, Global.GRID_SIZE, 8, 8, 16)
			
		Font.SetSize(1)
		love.graphics.setColor(0, 0, 0, 0.8)
		love.graphics.printf("Refresh", shopItemsX - Global.GRID_SIZE - 20, y - Global.GRID_SIZE + 14, Global.GRID_SIZE * 2 + 35, "center")
	end})
	
	drawQueue:push({y=1000; f=function()
		if (self.mapRules and self.mapRules.hints) then
			for i = 1, #self.mapRules.hints do
				local hint = self.mapRules.hints[i]
				local pos = util.Mult(TerrainHandler.TileSize(), hint.pos)
				local size = util.Mult(TerrainHandler.TileSize(), hint.size)
				
				if hint.arrowDest then
					local arrowDest = util.Mult(TerrainHandler.TileSize(), hint.arrowDest)
					love.graphics.setColor(0, 0, 0, 1)
					love.graphics.setLineWidth(12)
					if hint.arrow == "right" then
						love.graphics.line(pos[1] + size[1], pos[2] + size[2], arrowDest[1], arrowDest[2])
					end
					if hint.arrow == "left" then
						love.graphics.line(pos[1], pos[2] + size[2], arrowDest[1], arrowDest[2])
					end
				end
				
				Font.SetSize(1)
				love.graphics.setColor(Global.PANEL_COL[1], Global.PANEL_COL[2], Global.PANEL_COL[3], 0.98)
				love.graphics.setLineWidth(4)
				love.graphics.rectangle("fill", pos[1], pos[2], size[1], size[2], 8, 8, 16)
				love.graphics.setColor(0, 0, 0, 1)
				love.graphics.setLineWidth(12)
				love.graphics.rectangle("line", pos[1], pos[2], size[1], size[2], 8, 8, 16)
				love.graphics.printf(hint.text, pos[1] + 25, pos[2] + 10, size[1] - 50, "left")
			end
		end
		love.graphics.setColor(0, 0, 0, 1)
		love.graphics.rectangle("fill", -1000, Global.BLACK_BAR_LEEWAY + Global.VIEW_HEIGHT - TerrainHandler.GetVertOffset(), 5000, 3000)
		love.graphics.rectangle("fill", -1000, -3000 - Global.BLACK_BAR_LEEWAY - TerrainHandler.GetVertOffset(), 5000, 3000)
		love.graphics.rectangle("fill", Global.VIEW_WIDTH + Global.BLACK_BAR_LEEWAY, -1000, 3000, 5000)
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
	SetupWorldRules()
end

return api
