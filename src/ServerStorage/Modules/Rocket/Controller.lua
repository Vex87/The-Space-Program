local MAX_ACTIVATION_DISTANCE: number = 100

local ServerStorage: ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createInstance = require(ServerStorage.Modules.Core.CreateInstance)

local rocketOwnerChanged: RemoteEvent = ReplicatedStorage.Remotes.Rocket.RocketOwnerChanged

return function(rocket: Model, part: Part): nil
    local ownerValue: ObjectValue = createInstance("ObjectValue", "Owner", part)
    local oldOwner: Player = nil

    local ownerClickDetector: ClickDetector = createInstance("ClickDetector", "OwnerClickDetector", part)
    ownerClickDetector.MaxActivationDistance = MAX_ACTIVATION_DISTANCE
    ownerClickDetector.MouseClick:Connect(function(player: Player): nil
        if ownerValue.Value then
            oldOwner = ownerValue.Value
            ownerValue.Value = nil
        else
            oldOwner = nil
            ownerValue.Value = player
        end
    end)

    ownerValue.Changed:Connect(function(newOwner: Player): nil
        rocketOwnerChanged:FireClient(newOwner or oldOwner, rocket, ownerValue.Value)
    end)
end