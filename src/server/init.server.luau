local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddServices(script.Parent.Services)   -- грузим все модули в папке Services

Knit.Start():andThen(function()
    print("[Server] Knit started")
end)