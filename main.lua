local flyScriptURL = "https://raw.githubusercontent.com/Shizu1213/ShibaWare/main/FlyScript.lua"

local flyScript = require(game:GetService("ReplicatedStorage").FlyScript)

local function toggleFly()
    local flying = flyScript.flying
    flyScript.flying = not flying
    
    print("flying:", flyScript.flying)
    
    local bodyVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("flyvel")
    if flying and not bodyVelocity then
        flyScript.fly()
    end
end

local gui = Instance.new("ScreenGui")
gui.Enabled = false -- Hide the GUI initially
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 50)
flyButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flyButton.Text = "Fly"
flyButton.Parent = gui

if input.KeyCode == Enum.KeyCode.RightShift then
    gui.Enabled = not gui.Enabled
    print("GUI Enabled:", gui.Enabled)
end

loadstring(game:HttpGet(flyScriptURL))()

flyButton.MouseButton1Click:Connect(toggleFly)

game:GetService("UserInputService").InputBegan:Connect(toggleGUI)
