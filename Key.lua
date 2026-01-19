local Key = {
    ["ujjhf73"] = true,
    ["pack19201"] = true
}

local plr = game:GetService("Players").LocalPlayer
return plr and Key[plr.Name] == true
