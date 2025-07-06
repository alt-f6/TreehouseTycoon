local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(0.25,0.07)
label.Position = UDim2.fromScale(0.02,0.02)
label.TextScaled = true
label.BackgroundTransparency = 1
label.TextColor3 = Color3.new(1,1,1)
label.Parent = gui

Knit.OnStart():andThen(function(client)
    local IncomeRemote = client:GetService("IncomeService").GetCash
    IncomeRemote:Connect(function(cash)
        label.Text = ("Leaves: %d"):format(cash)
    end)
end)
