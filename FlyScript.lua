local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

local flying = false

local bodyVelocity = char.HumanoidRootPart:FindFirstChild("flyvel")
if not bodyVelocity then
    bodyVelocity = Instance.new("BodyVelocity", char.HumanoidRootPart)
    bodyVelocity.Name = "flyvel"
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.MaxForce = Vector3.new(0, math.huge, 0)
end

return {flying = flying}
