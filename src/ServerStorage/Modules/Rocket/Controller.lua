local ServerStorage: ServerStorage = game:GetService("ServerStorage")
local createInstance = require(ServerStorage.Modules.Core.CreateInstance)

return function(rocket: Model, part: Part): nil
    local ownerValue: ObjectValue = createInstance("ObjectValue", "Owner", part)
    local ownerClickDetector: ClickDetector = createInstance("ClickDetector", "OwnerClickDetector", part)
    ownerClickDetector.MouseClick:Connect(function(player: Player): nil
        ownerValue.Value = not ownerValue.Value and player or ownerValue.Value == player and nil
    end)

    local eventsFolder: Folder = createInstance("Folder", "Events", rocket)
    local ownerChangedEvent: BindableEvent = createInstance("BindableEvent", "OwnerChanged", eventsFolder)
    ownerValue.Changed:Connect(function(newOwner: Player): nil
        ownerChangedEvent:Fire(newOwner)
    end)
end