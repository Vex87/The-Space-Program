return function(className: string, properties: table, subelement: table): instance
    -- create element based on class name
    assert(className, "Missing Parameter 1: className (string)")
    local CreateElement
    local success, errorMessage = pcall(function()
        CreateElement = Instance.new(className)
    end)
    assert(success, "Rovis Error: Unable to create element with the className (" .. className .. "). Error Message: " .. tostring(errorMessage))

    -- set properties
    for propertyName, propertyValue in pairs(properties or {}) do
        assert(propertyName, "Rovis Error: Missing key (property name) for properties dictionary")
        assert(propertyName, "Rovis Error: Missing value (property value) for properties dictionary")

        local keys = string.split(propertyName, ":")
        if keys[1]:lower() == "event" then
            -- check if property name is an event
            local event = CreateElement[keys[2]]
            assert(event, "Rovis Error: Event (" .. keys[2] .. ") does not exist.")

            -- connect callback function to event
            assert(typeof(propertyValue) == "function", "Rovis Error: Callback function for event (" .. keys[2] .. ") is not a function")
            success, errorMessage = pcall(function()
                event:Connect(propertyValue)
            end)
            assert(success, "Rovis Error: Unable to connect callback function with event (" .. keys[2] .. "). Error Message: " .. tostring(errorMessage))
        else
            -- if the property name is a property of the element, set the value
            success, errorMessage = pcall(function()
                CreateElement[propertyName] = propertyValue
            end)
            assert(success, "Rovis Error: Unable to set property value (" .. tostring(propertyValue) .. ") for property name (" .. tostring(propertyName) .. "). Error Message: " .. tostring(errorMessage))
        end
    end

    -- add subelements
    for _, subelementInstance in pairs(subelement or {}) do
        subelementInstance.Parent = CreateElement
    end

    return CreateElement
end