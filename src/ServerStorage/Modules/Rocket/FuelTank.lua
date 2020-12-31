local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)

return function(rocket: Model, part: Part): nil
    local newFuelAmount: NumberValue = Instance.new("NumberValue")
    newFuelAmount.Name = "FuelAmount"
    newFuelAmount.Value = Configuration.Stats.MaxFuel
    newFuelAmount.Parent = part
end