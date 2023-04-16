local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local flying = false
local speed = 50

local bodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
bodyVelocity.Name = "flyvel"
bodyVelocity.Velocity = Vector3.new(0, 0, 0)
bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)

local function updateVelocity()
    local verticalSpeed = 0
    
    if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
        verticalSpeed = speed
    elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
        verticalSpeed = -speed
    end
    
    bodyVelocity.Velocity = Vector3.new(0, verticalSpeed, 0)
end

game:GetService("RunService").RenderStepped:Connect(updateVelocity)

return {flying = flying}
