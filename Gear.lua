local boxGear = script.Parent
local clickDetector = boxGear.ClickDetector

local function onClick()
    local player = game.Players.LocalPlayer
    local gui = player.PlayerGui:FindFirstChild("ScriptExecutorGui")

    if not gui then
        gui = Instance.new("ScreenGui")
        gui.Name = "ScriptExecutorGui"
        
        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0.5, 0, 0.5, 0)
        frame.Position = UDim2.new(0.25, 0, 0.25, 0)
        frame.BackgroundColor3 = Color3.new(1, 1, 1)
        frame.BorderSizePixel = 2
        frame.Parent = gui

        local textBox = Instance.new("TextBox")
        textBox.Size = UDim2.new(0.8, 0, 0.8, 0)
        textBox.Position = UDim2.new(0.1, 0, 0.1, 0)
        textBox.BackgroundColor3 = Color3.new(0.8, 0.8, 0.8)
        textBox.BorderSizePixel = 2
        textBox.TextWrapped = true
        textBox.Text = "-- Enter Lua script here\n\nprint('Hello, Roblox!')"
        textBox.Parent = frame

        local executeButton = Instance.new("TextButton")
        executeButton.Size = UDim2.new(0.3, 0, 0.1, 0)
        executeButton.Position = UDim2.new(0.35, 0, 0.9, 0)
        executeButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
        executeButton.BorderSizePixel = 2
        executeButton.Text = "Execute"
        executeButton.Parent = frame

        executeButton.MouseButton1Click:Connect(function()
            local scriptText = textBox.Text
            local success, err = pcall(function()
                loadstring(scriptText)()
            end)
            if not success then
                warn("Error executing script:", err)
            end
        end)

        gui.Parent = player.PlayerGui
    end

    gui.Enabled = true
end

clickDetector.MouseClick:Connect(onClick)
