type PROPERTIES_TEMPLATE = {
    BackgroundColor3: Color3.fromRGB,
    Name: string,
    Position: UDim2,
    Size: UDim2,
}

type CHILDREN_TEMPLATE = {
    UICorner: UICorner,
    Fill: Frame,
    Amount: TextLabel
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration: any = require(ReplicatedStorage.Modules.Core.Configuration.Rocket)
local UICornerUI: any = require(ReplicatedStorage.Modules.UI.UICorner)
local fillUI: any = require(script.Fill)
local amountUI: any = require(script.Amount)

return function(): Frame
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundColor3 = Configuration.UI.DarkColor,
        BorderSizePixel = 0,
        Name = "Template",
        Position = UDim2.new(0, 10, 0, 70),
        Size = UDim2.new(0, 300, 0, 25),
    }

    local children: CHILDREN_TEMPLATE = {
        UICorner = UICornerUI(Vector2.new(0, 5)),
        Fill = fillUI(),
        Amount = amountUI(),
    }

    return createElement("Frame", properties, children)
end