local BAD_ARG_ERROR="%s is not a valid %s"

return function(target, path, maxWait)

	-- error checking
	assert(typeof(target) == "Instance", BAD_ARG_ERROR:format("Argument 1", "Instance"))
	assert(typeof(path) == "string", BAD_ARG_ERROR:format("Argument 2", "string"))
	if maxWait then
		assert(typeof(maxWait) == "number", BAD_ARG_ERROR:format("Argument 3", "number"))
	end

	-- yield for child
	local children = string.split(path,".")
	local currentChild
	local yieldDuration = tick()
	for _, segment in pairs(children) do
		currentChild = maxWait and target:WaitForChild(segment, yieldDuration + maxWait - tick()) or target:WaitForChild(segment)
		if currentChild then
			target = currentChild
		else
			return
		end
	end

	return currentChild
end