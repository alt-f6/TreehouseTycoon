local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local IncomeService

local RoomService = Knit.CreateService{
    Name = "RoomService",
    Client = { RequestBuild = Knit.CreateSignal() }
}

function RoomService.Client:RequestBuild(player, cost)
    local data = IncomeService.PlayerData[player]
    if not data or data.Cash < cost then return false end

    data.Cash -= cost
    data.Rate += 1      -- +1 лист в секунду
    return true
end

function RoomService:KnitInit()
    IncomeService = Knit.GetService("IncomeService")
end

return RoomService
