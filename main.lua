local flyScriptURL = "https://raw.githubusercontent.com/Shizu1213/ShibaWare/main/FlyScript.lua"

local function toggleFly()
    local flying = require(game:GetService("ReplicatedStorage").FlyScript).flying
    require(game:GetService("ReplicatedStorage").FlyScript).flying = not flying
    
    local bodyVelocity = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("flyvel")
    if bodyVelocity then
        bodyVelocity:Destroy()
    end
    
    if flying and not bodyVelocity then
        fly()
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

local function toggleGUI(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
    end
end

loadstring(game:HttpGet(flyScriptURL))()

flyButton.MouseButton1Click:Connect(toggleFly)

game:GetService("UserInputService").InputBegan:Connect(toggleGUI)
