local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local destination = character.PrimaryPart.Position

local Workspace = game:GetService("Workspace")

while true do
    for _, object in pairs(Workspace:GetChildren()) do
        if object:IsA("Model") and object:FindFirstChild("Humanoid") and object:FindFirstChild("HumanoidRootPart") then
            if object ~= character then
                local direction = (destination - object:FindFirstChild("HumanoidRootPart").Position).unit
                local teleportDistance = 3 

                object:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(destination + direction * teleportDistance)
            end
        end
    end

    wait(0.1)
end
