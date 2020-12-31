type PROPERTIES_TEMPLATE = {
    BackgroundColor3: Color3.fromRGB,
    BorderSizePixel: number,
    Name: string,
    Size: UDim2,
}

type CHILDREN_PROPERTIES = {
    UICorner: UICorner,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Configuration)
local UICornerUI: any = require(ReplicatedStorage.Modules.UI.UICorner)

return function(): Frame
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundColor3 = Configuration.UI.LightColor,
        BorderSizePixel = 0,
        Name = "Fill",
        Size = UDim2.new(0, 0, 1, 0),
    }

    local children: CHILDREN_TEMPLATE = {
        UICorner = UICornerUI(Vector2.new(0, 5)),
    }

    return createElement("Frame", properties, children)
end