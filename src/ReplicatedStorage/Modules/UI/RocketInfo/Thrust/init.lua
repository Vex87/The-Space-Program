type PROPERTIES_TEMPLATE = {
    BackgroundColor3: Color3.fromRGB,
    Name: string,
    Position: UDim2,
    Size: UDim2,
}

type CHILDREN_TEMPLATE = {
    
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local UICornerUI: any = require(ReplicatedStorage.Modules.UI.UICorner)
local fillUI: any = require(script.Fill)
local amountUI: any = require(script.Amount)

return function(): Frame
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundColor3 = Configuration.UI.DarkColor,
        Name = "Thrust",
        Position = UDim2.new(1, -50, 1, -480),
        Size = UDim2.new(0, 40, 0, 300),
    }

    local children: CHILDREN_TEMPLATE = {
        UICorner = UICornerUI(Vector2.new(0, 5)),
        Fill = fillUI(),
        Amount = amountUI(),
    }

    return createElement("Frame", properties, children)
end