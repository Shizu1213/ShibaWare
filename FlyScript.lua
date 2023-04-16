-- Variables
local flying = false
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local torso = char:WaitForChild("HumanoidRootPart")
local bodyvel = Instance.new("BodyVelocity", torso)
bodyvel.Name = "flyvel"
bodyvel.Velocity = Vector3.new(0,0,0)
bodyvel.MaxForce = Vector3.new(0,math.huge,0)

-- Function to fly
local function fly()
    local inputService = game:GetService("UserInputService")
    inputService.InputBegan:Connect(function(input, isTyping)
        if isTyping then return end
        if input.KeyCode == Enum.KeyCode.W then
            bodyvel.Velocity = Vector3.new(0,50,0)
            flying = true
        elseif input.KeyCode == Enum.KeyCode.S then
            bodyvel.Velocity = Vector3.new(0,0,0)
            flying = false
        end
    end)
end

-- Return values
return {
    flying = flying,
    fly = fly,
}
