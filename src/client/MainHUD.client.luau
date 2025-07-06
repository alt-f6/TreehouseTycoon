local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

-- HUD-объекты
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(0.25, 0.07)
label.Position = UDim2.fromScale(0.02, 0.02)
label.BackgroundTransparency = 1
label.TextScaled = true
label.TextColor3 = Color3.new(1, 1, 1)
label.Parent = gui

Knit.Start():andThen(function()
    print("[Client] Knit started")

    local IncomeService = Knit.GetService("IncomeService")

    -- опрашиваем сервер раз в секунду
    task.spawn(function()
        while true do
            local cash = IncomeService:GetCash()   -- RemoteFunction
            label.Text = ("Leaves: %d"):format(cash)
            task.wait(1)
        end
    end)
end):catch(warn)