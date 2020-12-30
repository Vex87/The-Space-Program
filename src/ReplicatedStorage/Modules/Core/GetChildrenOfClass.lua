return function(Parent, Class)
	local Tbl = {}
	for _,v in pairs(Parent:GetChildren()) do
		if v:IsA(Class) then
			table.insert(Tbl, v)
		end
	end
	return Tbl
end