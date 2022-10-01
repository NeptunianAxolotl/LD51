
local util = require("include/util")

local self = {}
local api = {}

--------------------------------------------------
-- Smooth Numbers
--------------------------------------------------

local function UpdateSmoothNumber(dt, name)
	local number = self.smoothNumbers[name]
	if not number.diff or number.diff == 0 then
		return
	end
	local rate = number.rate*0.1*(0.24 + 0.06 * math.abs(number.want - number.has) / number.diff)
	if math.abs(rate) <= 0.008 or math.abs(number.want - number.has) < 0.02*number.diff then
		number.has = number.want
		number.diff = false
	end
	number.has = number.has + rate*(number.want - number.has)*2
end

function api.SetNumber(name, value)
	local number = self.smoothNumbers[name]
	while number.wrap and value < number.want do
		value = value + 1
	end
	number.want = value
	number.diff = math.abs(number.want - number.has)
	if value > number.recordHigh then
		--ChatHandler.ReportOnRecord(name, value, number.recordHigh)
		number.recordHigh = value
	end
end

function api.AddNumber(name, value)
	api.SetNumber(name, value + self.smoothNumbers[name].want)
end

function api.GetRawNumber(name)
	local number = self.smoothNumbers[name]
	return number.want
end

function api.GetNumber(name)
	local number = self.smoothNumbers[name]
	if number.wrap then
		return number.has%number.wrap
	end
	return number.has
end

function api.IsNumberBehindWrap(name)
	local number = self.smoothNumbers[name]
	return math.floor(number.has) ~= math.floor(number.want)
end

function api.RegisterSmoothNumber(name, initial, rate, wrap)
	initial = initial or 0
	rate = rate or 1
	wrap = wrap or false
	self.smoothNumbers[name] = {
		want = initial,
		has = initial,
		diff = 0,
		recordHigh = initial,
		wrap = wrap,
		rate = rate
	}
	self.smoothNumberList[#self.smoothNumberList + 1] = name
end

--------------------------------------------------
-- Updating
--------------------------------------------------

function api.Update(dt)
	for i = 1, #self.smoothNumberList do
		UpdateSmoothNumber(dt, self.smoothNumberList[i])
	end
end

function api.Initialize()
	self = {
		smoothNumbers = {},
		smoothNumberList = {},
	}
end

return api
