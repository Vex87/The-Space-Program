type TEMPLATE = {
    Tag: string,
    Stats: {
        MaxFuel: number,
    },
    UI: {
        DarkColor: Color3.fromRGB,
        LightColor: Color3.fromRGB,
    },
}

local Configuration: TEMPLATE = {
    Tag = "Rocket",
    Stats = {
        MaxFuel = 1000,
    },
    UI = {
        DarkColor = Color3.fromRGB(45, 45, 45),
        LightColor = Color3.fromRGB(255, 255, 255),
    },
}

return Configuration