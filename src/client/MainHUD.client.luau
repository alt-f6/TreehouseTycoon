local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local player = game.Players.LocalPlayer

local gui   = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
local label = Instance.new("TextLabel", gui)
label.Size  = UDim2.fromScale(0.25, 0.07)
label.Position = UDim2.fromScale(0.02, 0.02)
label.BackgroundTransparency = 1
label.TextScaled = true
label.TextColor3 = Color3.new(1, 1, 1)

Knit.Start():andThen(function()
    local IncomeService = Knit.GetService("IncomeService")

    task.spawn(function()
        while true do
            local cash = IncomeService:GetCash():await()  
            label.Text = string.format("Leaves: %d", cash)
            task.wait(1)
        end
    end)
end):catch(warn)