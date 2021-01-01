local module: {} = {}

local Players: Players = game:GetService("Players")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)

local player: Player = Players.LocalPlayer

local function updateUI(fuelUI: Frame, amount: number): nil
    local fuelPercent: number = amount / Configuration.Stats.MaxFuel
    fuelUI.Amount.Text = "<b>" .. tostring(math.round(fuelPercent * 100)) .. "%</b>"
    fuelUI.Fill:TweenSize(UDim2.new(fuelPercent, 0, 1, 0), table.unpack(Configuration.UI.Fuel.TemplateTweenInfo))
end

local function createUI(fuelTank: Part): Frame
    local UI: ScreenGui = player.PlayerGui:WaitForChild("RocketInfo")
    local newFuelUI: Frame = UI.Fuel.UIListLayout.Template:Clone()
    newFuelUI.Parent = UI.Fuel
    updateUI(newFuelUI, fuelTank.FuelAmount.Value)
    return newFuelUI
end

function module.clearUI(): nil
    local UI: ScreenGui = player.PlayerGui:WaitForChild("RocketInfo")
    for _: nil, fuelFrame: Frame in pairs(UI.Fuel:GetChildren()) do
        if fuelFrame:IsA("Frame") then
            fuelFrame:Destroy()
        end
    end
end

function module.new(rocket: Model, fuelTank: Part): nil
    local newFuelUI = createUI(fuelTank)

    fuelTank.FuelAmount.Changed:Connect(function(newValue)
        updateUI(newFuelUI, newValue)
    end)
end

return module