-- Load FlyScript module
local flyScript = require(script.Parent.FlyScript)

-- Function to toggle fly
local function toggleFly()
    local flying = flyScript.flying
    flyScript.flying = not flying
    
    print("flying:", flyScript.flying)
    
    local bodyVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("flyvel")
    if flying and not bodyVelocity then
        flyScript.fly()
    end
end

-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Enabled = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
print(gui.Parent)

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 50)
flyButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flyButton.Text = "Fly"
flyButton.Parent = gui

-- Function to toggle GUI
local function toggleGUI(input, gameProcessedEvent)
    print("toggleGUI function called")
    print(input.KeyCode)
    if input.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
    end
end

-- Connect event listeners
flyButton.MouseButton1Click:Connect(toggleFly)
game:GetService("UserInputService").InputBegan:Connect(toggleGUI)
