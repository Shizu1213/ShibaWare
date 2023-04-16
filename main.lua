local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local flyingEnabled = false
local speed = 50

local flyScriptURL = "https://raw.githubusercontent.com/Shizu1213/ShibaWare/main/FlyScript.lua"
local flyScript = loadstring(game:HttpGet(flyScriptURL))()

local gui = Instance.new("ScreenGui")
gui.Enabled = false
gui.Parent = player:WaitForChild("PlayerGui")

local flyButton = Instance.new("TextButton")
flyButton.Size = UDim2.new(0, 100, 0, 50)
flyButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flyButton.Text = "Fly"
flyButton.Parent = gui

local function toggleFly(inputObject, gameProcessedEvent)
    if not gameProcessedEvent and inputObject.KeyCode == Enum.KeyCode.RightShift then
        gui.Enabled = not gui.Enabled
        flyingEnabled = not flyingEnabled
        flyScript.flying = false
    end
end

local function toggleGUI()
    gui.Enabled = not gui.Enabled
    flyingEnabled = not flyingEnabled
    flyScript.flying = false
end

flyButton.MouseButton1Click:Connect(function()
    toggleGUI()
end)

game:GetService("UserInputService").InputBegan:Connect(toggleFly)

local bodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
bodyVelocity.Name = "flyvel"
bodyVelocity.Velocity = Vector3.new(0, 0, 0)
bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)

local function updateVelocity()
    local verticalSpeed = 0
    
    if flyingEnabled and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
        verticalSpeed = speed
    elseif flyingEnabled and game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
        verticalSpeed = -speed
    end
    
    bodyVelocity.Velocity = Vector3.new(0, verticalSpeed, 0)
end

game:GetService("RunService").RenderStepped:Connect(updateVelocity)

while wait() do
    if flyingEnabled then
        flyScript.flying = true
    else
        flyScript.flying = false
    end
end
