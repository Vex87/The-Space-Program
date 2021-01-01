type PROPERTIES_TEMPLATE = {
    BackgroundColor3: Color3.fromRGB,
    Name: string,
    Position: UDim2,
    Size: UDim2,
    Font: Enum.Font,
    RichText: boolean,
    Text: string,
    TextColor3: Color3.fromRGB,
    TextSize: number,
}

type CHILDREN_TEMPLATE = {
    UICorner: UICorner
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local UICornerUI: any = require(ReplicatedStorage.Modules.UI.UICorner)

return function(): TextLabel
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundColor3 = Configuration.UI.Colors.Dark,
        Name = "Amount",
        Position = UDim2.new(1, 5, 0, 0),
        Size = UDim2.new(0, 40, 0, 25),
        Font = Enum.Font.SciFi,
        RichText = true,
        Text = "<b>0%</b>",
        TextColor3 = Configuration.UI.LightColor,
        TextSize = 16,
    }

    local children: CHILDREN_TEMPLATE = {
        UICorner = UICornerUI(UDim.new(0, 5)),
    }

    return createElement("TextLabel", properties, children)
end