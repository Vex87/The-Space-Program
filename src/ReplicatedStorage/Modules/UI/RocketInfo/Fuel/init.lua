type PROPERTIES_TEMPLATE = {
    BackgroundTransparency: number,
    Name: string,
    Position: UDim2,
    Size: UDim2,
}

type CHILDREN_TEMPLATE = {
    UIListLayout: UIListLayout
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local UIListLayoutUI: any = require(script.UIListLayout)

return function(): Frame
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundTransparency = 1,
        Name = "Fuel",
        Position = Configuration.UI.Fuel.HidePosition,
        Size = UDim2.new(0, 300, 0, 25)
    }

    local children: CHILDREN_TEMPLATE = {
        UIListLayout = UIListLayoutUI()
    }

    return createElement("Frame", properties, children)
end