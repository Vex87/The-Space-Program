type PROPERTIES_TEMPLATE = {
    BackgroundColor3: Color3.fromRGB,
    Name: string,
    Size: number,
    Font: Enum.Font,
    RichText: boolean,
    Text: string,
    TextColor3: Color3.fromRGB,
    TextSize: number,
}

type CHILDREN_TEMPLATE = {
    UICorner: UICorner,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration:any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local UICornerUI: any = require(ReplicatedStorage.Modules.UI.UICorner)

return function(name: string, text: string): TextLabel
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundColor3 = Configuration.UI.DarkMode,
        Name = name,
        Size = UDim2.new(0, 300, 0, 25),
        Font = Enum.Font.SciFi,
        RichText = true,
        Text = text,
        TextColor3 = Configuration.UI.LightMode,
        TextSize = 16,
    }

    local children: CHILDREN_TEMPLATE = {
        UICorner = UICornerUI,
    }

    return createElement("TextLabel", properties, children)
end