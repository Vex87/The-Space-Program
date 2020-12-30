return function(moduleDirectory)
    local modules = {}
    for _,module in pairs(moduleDirectory) do
        modules[module.Name] = require(module)
    end
    return modules
end