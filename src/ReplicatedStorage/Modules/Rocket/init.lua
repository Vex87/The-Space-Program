local ROCKET_TAG: string = "Rocket"

local Players: Players = game:GetService("Players")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local collection: any = require(ReplicatedStorage.Modules.Core.Collection)
local screenGuiUI: any = require(ReplicatedStorage.Modules.UI.RocketInfo)

local player: Player = Players.LocalPlayer

local function createUI(): nil
    local newUI: ScreenGui = screenGuiUI()
    newUI.Parent = player.PlayerGui
end

return function(): nil
    collection(ROCKET_TAG, function(rocket: Model): nil
        createUI()

        for _: nil, child: any in pairs(rocket:GetChildren()) do
            local possibleModule: ModuleScript = script:FindFirstChild(child.Name)
            if possibleModule then
                require(possibleModule)(rocket, child)
            end
        end
    end)
end