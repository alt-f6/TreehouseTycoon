local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local IncomeService

local RoomService = Knit.CreateService{
    Name = "RoomService",
    Client = { RequestBuild = Knit.CreateSignal() }
}

function RoomService.Client:RequestBuild(player, cost)
    if not IncomeService or not IncomeService.PlayerData then return false end
    local data = IncomeService.PlayerData[player.UserId]
    if not data or type(data.Cash) ~= "number" or data.Cash < cost then return false end

    data.Cash = data.Cash - cost
    data.Rate = (data.Rate or 0) + 1      -- +1 leaf per second
    return true
end

function RoomService:KnitInit()
    IncomeService = Knit.GetService("IncomeService")
end

return RoomService
