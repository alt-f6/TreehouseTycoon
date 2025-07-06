local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local IncomeService = Knit.CreateService({
    Name = "IncomeService",
    Client = {}
})

IncomeService.PlayerData = {}

function IncomeService.Client:GetCash(player)
    local data = IncomeService.PlayerData[player]
    if data then
        return data.Cash
    end
    return 0
end

function IncomeService:KnitStart()
     while true do
        for player, data in pairs(self.PlayerData) do
            data.Cash = data.Cash + data.Rate
            -- If you want to notify the client, you should use a RemoteSignal, e.g. self.Client.CashUpdated:Fire(player, data.Cash)
            -- For now, we'll comment this out to avoid errors:
            -- self.Client.GetCash:Fire(player, data.Cash)
        end
        task.wait(1)
    end
end

game.Players.PlayerAdded:Connect(function(plr)
    IncomeService.PlayerData[plr] = {Cash = 0, Rate = 1}
end)

game.Players.PlayerRemoving:Connect(function(plr)
    IncomeService.PlayerData[plr] = nil
end)

return IncomeService
