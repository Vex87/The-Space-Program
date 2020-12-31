local Players: Players = game:GetService("Players")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)

local player: Player = Players.LocalPlayer
local UI: ScreenGui = player.PlayerGui.RocketInfo

local function updateUI(fuelUI: Frame, amount: number)
    local fuelPercent: number = math.round(amount / Configuration.Stats.MaxFuel * 100)
    fuelUI.Amount.Text = "<b>" .. tostring(fuelPercent) .. "%</b>"
end

local function createUI(part: Part): Frame
    local newFuelUI: Frame = UI.Fuel.UIListLayout.Template:Clone()
    updateUI(newFuelUI, part.FuelAmount.Value)
    newFuelUI.Parent = UI.Fuel
    return newFuelUI
end

return function(rocket: Model, part: Part): nil
    local newFuelUI = createUI(part)

    part.FuelAmount.Changed:Connect(function(newValue)
        updateUI(newFuelUI, newValue)
    end)
end