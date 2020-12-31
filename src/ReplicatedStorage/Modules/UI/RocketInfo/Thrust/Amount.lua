type PROPERTIES_TEMPLATE = {
    BackgroundTransparency: Color3.fromRGB,
    Name: string,
    Position: UDim2,
    Size: UDim2,
    Font: Enum.Font,
    RichText: boolean,
    Text: string,
    TextColor3: Color3.fromRGB,
    TextSize: number,
    TextWrapped: boolean,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)

return function(): TextLabel
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundTransparency = 1,
        Name = "Amount",
        Position = UDim2.new(0, 0, 1, -20),
        Size = UDim2.new(1, 0, 0, 20),
        Font = Enum.Font.SciFi,
        RichText = true,
        Text = "<b>0%</b>",
        TextColor3 = Configuration.UI.LightColor,
        TextSize = 16,
        TextWrapped = true,
    }

    return createElement("TextLabel", properties)
end