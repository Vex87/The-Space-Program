local CloneTable = require(script.Parent.CloneTable)

return function(OriginalTable)
	local copy = {}
	for k, v in pairs(OriginalTable) do
		if type(v) == "table" then
			v = CloneTable(v)
		end
		copy[k] = v
	end
	return copy
end