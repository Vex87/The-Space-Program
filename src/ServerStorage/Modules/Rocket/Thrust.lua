return function(rocket: Model, thrust: Model): nil
    local correspondingFuelTankValue: ObjectValue = thrust:FindFirstChild("FuelTank")
    if correspondingFuelTankValue and correspondingFuelTankValue.Value then
        local newBodyForce: BodyForce = Instance.new("BodyForce")
        newBodyForce.Force = Vector3.new(0, 0, 0)
        newBodyForce.Parent = thrust
    end
end