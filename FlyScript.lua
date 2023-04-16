local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local flying = false

local torso = char:WaitForChild("HumanoidRootPart")
local bodyvel = Instance.new("BodyVelocity", torso)
bodyvel.Name = "flyvel"
bodyvel.Velocity = Vector3.new(0,0,0)
bodyvel.MaxForce = Vector3.new(0,math.huge,0)

game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if isTyping then return end
    if input.KeyCode == Enum.KeyCode.W then
        bodyvel.Velocity = Vector3.new(0,50,0)
        flying = true
    elseif input.KeyCode == Enum.KeyCode.S then
        bodyvel.Velocity = Vector3.new(0,0,0)
        flying = false
    end
end)

return { flying = flying }
