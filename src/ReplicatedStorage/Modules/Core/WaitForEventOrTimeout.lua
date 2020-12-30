return function(event, timeout): boolean
    local connection, eventWasFired
    connection = event:Connect(function()
        eventWasFired = true
    end)

    wait(timeout)
    connection:Disconnect()
    return eventWasFired
end