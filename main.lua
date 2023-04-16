local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local flyScriptURL = "https://raw.githubusercontent.com/Shizu1213/ShibaWare/main/FlyScript.lua"
local flyScript = loadstring(game:HttpGet(flyScriptURL))()

local gui = Instance.new("ScreenGui")
gui.Enabled = false -- Hide the GUI initially
gui.Parent = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 50)
flyButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flyButton.Text = "Fly"
flyButton.Parent = gui

local function toggleFly(inputObject, gameProcessedEvent)
    if not gameProcessedEvent and inputObject.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
    else
        flyScript.flying = not flyScript.flying
        print("flying:", flyScript.flying)
    end
end

local function toggleGUI(inputObject, gameProcessedEvent)
    if not gameProcessedEvent and inputObject.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
    end
end

flyButton.MouseButton1Click:Connect(function()
    flyScript.flying = not flyScript.flying
    print("flying:", flyScript.flying)
end)

game:GetService("UserInputService").InputBegan:Connect(toggleFly)
game:GetService("UserInputService").InputBegan:Connect(toggleGUI)
