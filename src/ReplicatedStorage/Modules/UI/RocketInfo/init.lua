type PROPERTIES_TEMPLATE = {
    IgnoreGuilnset: boolean,
    Name: string,
}

type CHILDREN_TEMPLATE = {
    Fuel: Frame,
    Thrust: Frame,
    Stats: Frame
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")

local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)
local fuelUI: any = require(script.Fuel)
local thrustUI: any = require(script.Thrust)
local statsUI: any = require(script.Stats)

return function(): ScreenGui
    local properties: PROPERTIES_TEMPLATE = {
        IgnoreGuilnset = true,
        Name = "RocketInfo",
    }

    local children: CHILDREN_TEMPLATE = {
        Fuel = fuelUI(),
        Thrust = thrustUI(),
        Stats = statsUI(),
    }

    return createElement("ScreenGui", properties, children)
end