local Debris = game:GetService("Debris")

return function(sound, newSoundParent, despawnDelay)
	if not sound and newSoundParent then
		return
	end
	
	local newSound = sound:Clone()
	newSound.Parent = newSoundParent
	newSound:Play()
	Debris:AddItem(newSound, despawnDelay or sound.TimeLength)
	return newSound
end