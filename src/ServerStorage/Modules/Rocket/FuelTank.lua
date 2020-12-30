local MAX_FUEL = 1000

return function(rocket: Model, part: Model): nil
    local newFuelAmount: NumberValue = Instance.new("NumberValue")
    newFuelAmount.Name = "FuelAmount"
    newFuelAmount.Value = MAX_FUEL
    newFuelAmount.Parent = part
end