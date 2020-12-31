type PROPERTIES_TEMPLATE = {
    CornerRadius: UDim,
}

local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement: any = require(ReplicatedStorage.Modules.Core.CreateElement)

return function(cornerRadius: UDim): UICorner
    local properties: PROPERTIES_TEPLATE = {
        CornerRadius = cornerRadius,
    }
    return createElement("UICorner", properties)
end