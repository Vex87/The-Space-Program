return function(part)
	local currentInstance = part
	repeat
		if currentInstance:FindFirstChildWhichIsA("Humanoid") then
			return currentInstance
		else
			currentInstance = currentInstance.Parent
		end
	until currentInstance:IsA("Workspace")
end