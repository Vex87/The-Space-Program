type PROPERTIES_TEMPLATE = {
    Padding: Vector2,
    FillDirection: Enum.FillDirection,
    VerticalAllignment: Enum.VerticalAlignment,
}

type CHILDREN_TEMPLATE = {
    Template: Frame,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local templateUI: any = require(script.Frame)

return function(): UIListLayout
    local properties: PROPERTIES_TEMPLATE = {
        Padding = Vector2.new(0, 5),
        FillDirection = Enum.FillDirection.Vertical,
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
    }

    local children: CHILDREN_TEMPLATE = {
        Template = templateUI(),
    }

    return createElement("UIListLayout", properties, children)
end