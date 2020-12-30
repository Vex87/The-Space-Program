return function(connections)
	for _,con in pairs(connections) do
		if con then
			con:Disconnect()
		end
	end
end