type PROPERTIES_TEMPLATE = {
    CornerRadius: Vector2,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)

return function(cornerRadius: Vector2): UICorner
    local properties: PROPERTIES_TEPLATE = {
        CornerRadius = cornerRadius,
    }
    return createElement("UICorner", properties)
end