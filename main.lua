local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local flyingScriptURL = "https://raw.githubusercontent.com/Shizu1213/ShibaWare/main/FlyScript.lua"
local flyingScript = loadstring(game:HttpGet(flyingScriptURL))()

local gui = Instance.new("ScreenGui")
gui.Enabled = false -- Hide the GUI initially
gui.Parent = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 50)
flyButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flyButton.Text = "Fly"
flyButton.Parent = gui

local flyingEnabled = false

local function toggleFly(inputObject, gameProcessedEvent)
    if not gameProcessedEvent and inputObject.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
    end
end

local function toggleGUI()
    gui.Enabled = not gui.Enabled
    flyingEnabled = not flyingEnabled
    flyingScript.flying = false
end

flyButton.MouseButton1Click:Connect(function()
    toggleGUI()
end)

game:GetService("UserInputService").InputBegan:Connect(toggleFly)

while wait() do
    if flyingEnabled then
        flyingScript.flying = true
    else
        flyingScript.flying = false
    end
end
