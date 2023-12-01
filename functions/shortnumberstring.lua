local function shortnumberstring(p1)
    local u1 = { "k", "m", "b", "t", "q" }
	local v1 = nil;
	local v2 = math.max(math.abs(p1), math.pow(10, -(#u1) * 3))
	local v3 = 10 ^ (math.ceil(math.log10(v2)) - 3)
	local v4 = math.round(v2 / v3) * v3
	local v5 = math.min(math.floor(math.log10(math.max(v4, 1)) / 3), #u1)
	v1 = v4 * math.sign(p1) / 10 ^ (v5 * 3)
	if not (v5 >= 1) then
		return string.format("%g", v1)
	end
	return string.format("%g%s", v1, u1[v5])
end