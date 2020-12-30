local TweenService = game:GetService("TweenService")

return function(...)
	local tween = TweenService:Create(...)
	tween:Play()
	return tween
end