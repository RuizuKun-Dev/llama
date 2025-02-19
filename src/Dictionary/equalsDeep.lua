local Dictionary = script.Parent
local Llama = Dictionary.Parent
local equalObjects = require(Llama.equalObjects)

local function compareDeep(a, b)
	if type(a) ~= "table" or type(b) ~= "table" then
		return a == b
	end

	for key, value in pairs(a) do
		if not compareDeep(b[key], value) then
			return false
		end
	end
	for key, value in pairs(b) do
		if not compareDeep(a[key], value) then
			return false
		end
	end

	return true
end
local function equalsDeep(...)
	if equalObjects(...) then
		return true
	end

	local argCount = select("#", ...)
	local firstObject = select(1, ...)

	for i = 2, argCount do
		local object = select(i, ...)

		if not compareDeep(firstObject, object) then
			return false
		end
	end

	return true
end

return equalsDeep
