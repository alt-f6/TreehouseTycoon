local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.Start():andThen(function(client)
    print("[Client] Knit started")
end):catch(warn)