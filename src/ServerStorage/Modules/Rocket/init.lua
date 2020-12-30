local ROCKET_TAG: string = "Rocket"
local ServerStorage: ServerStorage = game:GetService("ServerStorage")
local collection = require(ServerStorage.Modules.Core.Collection)

return function(): nil
    collection(ROCKET_TAG, function(rocket: Model): nil
        for _: nil, child: any in pairs(rocket:GetChildren()) do
            local possibleModule: ModuleScript = script:FindFirstChild(child.Name)
            if possibleModule then
                require(possibleModule)(rocket, child)
            end
        end
    end)
end