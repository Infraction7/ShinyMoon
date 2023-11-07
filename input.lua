if not game.Workspace.Pads:IsA("Folder") then return end
for _,v in pairs(game.Workspace.Pads:GetDescendants()) do
    if v:IsA("BasePart") then
        v.CanCollide = false
        v.Transparency = 1
    
    end
end


local groupid = 32907044 
local minrank = 14 

local PadLock = function(msg)
    for _,pad in pairs(game.Workspace.Pads:GetDescendants()) do
        if pad:IsA("BasePart") then
            local command = {}

            for word in string.gmatch(msg, "%S+") do
                table.insert(command, word)
            end

            local word1 = string.lower(command[1])
            local word2 = string.lower(command[2])
            local num = string.lower(command[3])

            if word1 == ":lock" and word2 == "pad" then
                if num == "all" then
                    pad.Transparency = 0.75
                    pad.CanCollide = true
                elseif pad.Parent.Name == num then
                    pad.Transparency = 0.75
                    pad.CanCollide = true
                end
            elseif word1 == ":unlock" and word2 == "pad" then
                if num == "all" then
                    pad.Transparency = 1
                    pad.CanCollide = false
                elseif pad.Parent.Name == num then
                    pad.Transparency = 1
                    pad.CanCollide = false
                end
            end
        end
    end
end
game.Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        if game.CreatorType == Enum.CreatorType.Group then
            if plr:GetRankInGroup(groupid) >= minrank then
                PadLock(msg)
            end
        elseif game.CreatorType == Enum.CreatorType.User then
            if plr.UserId == game.CreatorId then
                PadLock(msg)
            end            
        end
    end)
end)

--This is the script right now