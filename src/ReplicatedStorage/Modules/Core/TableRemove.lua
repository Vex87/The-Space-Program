return function(Table, Value, RemoveCount)		
	local Count = 0

	if typeof(RemoveCount) == "number" then
		for _ = RemoveCount, 1, -1 do
			if table.find(Table, Value) then
				Count = Count + 1
				table.remove(Table, table.find(Table, Value))	
			end
		end
	elseif RemoveCount then
		repeat
			if table.find(Table, Value) then
				Count = Count + 1	
				table.remove(Table, table.find(Table, Value))	
			end
		until not table.find(Table, Value)
	elseif not RemoveCount then
		if table.find(Table, Value) then
			Count = Count + 1
			table.remove(Table, table.find(Table, Value))
		end
	end

	return Count
end