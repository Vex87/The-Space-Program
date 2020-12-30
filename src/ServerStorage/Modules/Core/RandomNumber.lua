return function(n, Places)
	if not Places then
		return math.floor(n + 0.5)
	end
	return math.floor((n * 10 ^ Places) + 0.5) / 10 ^ Places
end