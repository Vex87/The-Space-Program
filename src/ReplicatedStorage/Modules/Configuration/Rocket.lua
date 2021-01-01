type TEMPLATE = {
    Tag: string,
    Stats: {
        MaxFuel: number,
    },
    UI: {
        Colors: {
            Dark: Color3.fromRGB,
            Light: Color3.fromRGB,
        },
        Fuel: {
            ShowPosition: UDim2,
            HidePosition: UDim2,
            TweenInfo: {},
            TemplateTweenInfo: {},
        },
        Thrust: {
            ShowPosition: UDim2,
            HidePosition: UDim2,
            TweenInfo: {},
        },
        Stats: {
            ShowPosition: UDim2,
            HidePosition: UDim2,
            TweenInfo: {},
        },
    },
}

local Configuration: TEMPLATE = {
    Tag = "Rocket",
    Stats = {
        MaxFuel = 1000,
    },
    UI = {
        Colors = {
            Dark = Color3.fromRGB(45, 45, 45),
            Light = Color3.fromRGB(255, 255, 255),
        },
        Fuel = {
            ShowPosition = UDim2.new(0, 10, 1, -35),
            HidePosition = UDim2.new(0, 10, 1, 10),
            TweenInfo = {Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5, true},
            TemplateTweenInfo = {Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5, true},
        },
        Thrust = {
            ShowPosition = UDim2.new(1, -50, 0.5, 0),
            HidePosition = UDim2.new(1, 10, 0.5, 0),
            TweenInfo = {Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5, true},
        },
        Stats = {
            ShowPosition = UDim2.new(0, 10, 0, 10),
            HidePosition = UDim2.new(0, 10, 0, -155),
            TweenInfo = {Enum.EasingDirection.In, Enum.EasingStyle.Linear, 0.5, true},
        },
    },
}

return Configuration