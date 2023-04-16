local plr = game.Players.LocalPlayer
local char = plr.Character or plr.CharacterAdded:Wait()

local flying = false

local function fly()
    local torso = char:WaitForChild("HumanoidRootPart")
    local bodyvel = Instance.new("BodyVelocity", torso)
    bodyvel.Name = "flyvel"
    bodyvel.Velocity = Vector3.new(0,0,0)
    bodyvel.MaxForce = Vector3.new(0,math.huge,0)
    flying = true
    repeat
        local velocity = Vector3.new(0, 0, 0)
        if game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.Space) then
            velocity = velocity + Vector3.new(0, 50, 0)
        elseif game:GetService("UserInputService"):IsKeyDown(Enum.KeyCode.LeftControl) then
            velocity = velocity - Vector3.new(0, 50, 0)
        end
        if game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton2) then
            velocity = velocity + workspace.CurrentCamera.CFrame.lookVector * 50
        end
        bodyvel.Velocity = velocity
        wait()
    until flying == false
    bodyvel:Destroy()
end

game:GetService("UserInputService").InputBegan:Connect(function(input, isTyping)
    if isTyping then return end
    if input.KeyCode == Enum.KeyCode.W then
        fly()
    elseif input.KeyCode == Enum.KeyCode.S then
        flying = false
    end
end)

return { flying = flying }
