return function(func, ...)
	assert(type(func) == "function", string.format("Invalid argument #1 to Thread.Spawn (function? expected, got %s)", typeof(func))) 
    
	local thread = coroutine.create(func)
	local success, errorMessage = coroutine.resume(thread, ...)
	
	if not success then
		warn(debug.traceback(thread), errorMessage)
	end
end