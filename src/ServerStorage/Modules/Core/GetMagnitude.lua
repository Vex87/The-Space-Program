return function(Start, End)
	if typeof(Start) ~= "Vector3" then
		Start = Start.Position
	end

	if typeof(End) ~= "Vector3" then
		End = End.Position
	end	

	return (Start-End).Magnitude
end