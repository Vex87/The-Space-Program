local Players: Players = game:GetService("Players")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local screenGuiUI: any = require(ReplicatedStorage.Modules.UI.RocketInfo)
local fuelTank: any = require(script.FuelTank)

local player: Player = Players.LocalPlayer
local rocketOwnerChanged: RemoteEvent = ReplicatedStorage.Remotes.Rocket.RocketOwnerChanged
local newUI: ScreenGui

local function showUI(willShow: boolean): nil
    newUI.Fuel:TweenPosition(
        willShow and Configuration.UI.Fuel.ShowPosition or Configuration.UI.Fuel.HidePosition, 
        table.unpack(Configuration.UI.Fuel.TweenInfo)
    )
    newUI.Thrust:TweenPosition(
        willShow and Configuration.UI.Thrust.ShowPosition or Configuration.UI.Thrust.HidePosition, 
        table.unpack(Configuration.UI.Thrust.TweenInfo)
    )
    newUI.Stats:TweenPosition(
        willShow and Configuration.UI.Stats.ShowPosition or Configuration.UI.Stats.HidePosition, 
        table.unpack(Configuration.UI.Stats.TweenInfo)
    )
end

local function newRocket(rocket: Model, isActive: boolean): nil
    fuelTank.clearUI()
    showUI(isActive)
    
    if not isActive then
        return
    end

    for _: nil, child: any in pairs(rocket:GetChildren()) do
        local possibleModule: ModuleScript = script:FindFirstChild(child.Name)
        if not possibleModule then
            continue
        end

        local module: amy = require(possibleModule)
        local runFunction: Function = module["new"] or module
        runFunction(rocket, child)
    end
end

return function(): nil
    newUI = screenGuiUI()
    newUI.Parent = player.PlayerGui
    rocketOwnerChanged.OnClientEvent:Connect(newRocket)
end