local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local flyScriptURL = "https://raw.githubusercontent.com/Shizu1213/ShibaWare/main/FlyScript.lua"
local flyScript = loadstring(game:HttpGet(flyScriptURL))()

local gui = Instance.new("ScreenGui")
gui.Enabled = true
gui.Parent = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 50)
flyButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flyButton.Text = "Fly"
flyButton.Parent = gui

local function toggleFly()
    flyScript.flying = not flyScript.flying
    print("flying:", flyScript.flying)
end

flyButton.MouseButton1Click:Connect(toggleFly)
