return function(className: string, name: string, parent: Instance): any
    local newValue: className = Instance.new(className)
    newValue.Name = name
    newValue.Parent = parent
    return newValue
end