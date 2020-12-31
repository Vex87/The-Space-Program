type PROPERTIES_TEMPLATE = {
    Padding: Vector2,
}

type CHILDREN_TEMPLATE = {
    
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)

return function(): UIListLayout
    local properties: PROPERTIES_TEMPLATE = {
        Padding = Vector2.new(0, 5),
    }

    return createElement("UIListLayout", properties)
end