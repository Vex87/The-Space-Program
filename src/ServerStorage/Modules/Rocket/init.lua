local ReplicatedStorage: ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage: ServerStorage = game:GetService("ServerStorage")

local Configuration: any = require(ReplicatedStorage.Modules.Configuration.Rocket)
local collection = require(ServerStorage.Modules.Core.Collection)

return function(): nil
    collection(Configuration.Tag, function(rocket: Model): nil
        for _: nil, child: any in pairs(rocket:GetChildren()) do
            local possibleModule: ModuleScript = script:FindFirstChild(child.Name)
            if possibleModule then
                require(possibleModule)(rocket, child)
            end
        end
    end)
end