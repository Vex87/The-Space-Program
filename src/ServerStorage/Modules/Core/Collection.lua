local CollectionService = game:GetService("CollectionService")
local newThread = require(script.Parent.NewThread)

return function(tag, func)
	for _,obj in pairs(CollectionService:GetTagged(tag)) do
		newThread(func, obj)
	end

	local instanceAddedEvent = CollectionService:GetInstanceAddedSignal(tag):Connect(function(obj)
		newThread(func, obj)
	end)

	return instanceAddedEvent
end