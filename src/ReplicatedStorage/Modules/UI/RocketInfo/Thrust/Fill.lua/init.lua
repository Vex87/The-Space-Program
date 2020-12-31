type PROPERTIES_TEMPLATE = {
    AnchorPoint: Vector2,
    BackgroundColor3: Color3.fromRGB,
    Name: string,
    Position: UDim2,
    Size: UDim2,
}

type CHILDREN_TEMPLATE = {
    UICorner: UICorner,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local UICornerUI: any = require(ReplicatedStorage.Modules.UI.UICorner)

return function(): Frame
    local properties: PROPERTIES_TEMPLATE = {
        AnchorPoint = Vector2.new(0, 1),
        BackgroundColor3 = Configuration.UI.LightColor,
        Name = "Fill",
        Position = UDim2.new(0, 0, 1, 0),
        Size = UDim2.new(1, 0, 0, 0),
    }

    local children: CHILDREN_TEMPLATE = {
        UICorner = UICornerUI(Vector2.new(0, 5))
    }

    return createElement("Frame", properties, children)
end