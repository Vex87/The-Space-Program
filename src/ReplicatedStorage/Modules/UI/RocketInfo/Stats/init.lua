type PROPERTIES_TEMPLATE = {
    BackgroundTransparency: Color3.fromRGB,
    Name: string,
    Position: UDim2,
    Size: UDim2,
}

type CHILDREN_TEMPLATE = {
    UIListLayout: UIListLayoutUI,
    Altitude: TextLabel,
    Orientation: TextLabel,
    Position: TextLabel,
    RotationVelocity: TextLabel,
    Velocity: TextLabel,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local UIListLayoutUI: any = require(script.UIListLayout)
local templateUI: any = require(script.Template)

return function(): Frame
    local properties: PROPERTIES_TEMPLATE = {
        BackgroundTransparency = 1,
        Name = "Stats",
        Position = UDim2.new(0, 10, 0, 10),
        Size = UDim2.new(0, 300, 0, 25),
    }

    local children: CHILDREN_TEMPLATE = {
        UIListLayout = UIListLayoutUI(),
        Altitude = templateUI("Altitude", "Altitude: <b>0 studs</b>"),
        Orientation = templateUI("Orientation", "Orientation: <b>0, 0, 0</b>"),
        Position = templateUI("Position", "Position: <b>0, 0, 0</b>"),
        RotationVelocity = templateUI("RotationVelocity", "Rotation Velocity: <b>0, 0, 0 studs/sec</b>"),
        Velocity = templateUI("Velocity", "Velocity: <b>0 studs/sec</b>"),
    }

    return createElement("Frame", properties, children)
end