return function()
	local Signal, Arguments = {}, {}
	local Bindable = Instance.new("BindableEvent")

	function Signal:Connect(Callback)
		return Bindable.Event:Connect(function()
			Callback(unpack(Arguments, 1, Arguments[0]))
		end)
	end

	function Signal:Fire(...)
		Arguments = {[0] = select("#", ...); ...}
		Bindable:Fire()
		Arguments = nil
	end	

	function Signal:Wait()
		Bindable.Event:Wait()
		return unpack(Arguments, 1, Arguments[0])
	end

	function Signal:Disconnect()
		Bindable:Destroy()
		Bindable, Arguments, Signal = nil
	end

	return Signal
end