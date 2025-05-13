_G.Key = [[
return {
    ["MarvenRiz-X-A3B9T-K7L2D-Z9XQW"] = {
        ClientId = "4f23c9f3-7947-4da6-8e10-1ab6d22b80bc"
    };
    ["MarvenRiz-X-M1P8R-N4R7K-Q2PLD"] = {
        ClientId = nil
    };
    ["MarvenRiz-X-W4Q7E-E6Z3P-9XJLM"] = {
        ClientId = nil
    };
    ["Admin"] = {
        ClientId = "e7646e22-29ec-4826-8ba2-fb7e6ea40160"
    };
}
]]

local CheckHwid = game:GetService("RbxAnalyticsService"):GetClientId()
local Hwid = loadstring(_G.Key)()
local info = Hwid[getgenv().Key]
if info and info.ClientId == CheckHwid then
local Detected
for _, v in getgc(true) do
    if typeof(v) == "table" then
        local Re = rawget(v, "Detected")
        if typeof(Re) == "function" and not Detected then
            Detected = Re
            hookfunction(Re, function() return true end)
            warn("Bypassed: Adonis Anti-Cheat")
        end
        local Kill = rawget(v, "Kill")
        if typeof(Kill) == "function" and rawget(v, "Variables") and rawget(v, "Process") then
            hookfunction(Kill, function() end)
        end
    end
end
hookfunction(getrenv().debug.info, newcclosure(function(info)
    if info == Detected then return coroutine.yield(coroutine.running()) end
end))
setthreadidentity(7)
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()
local OwO = library:Window("MarvenRiz X")
OwO:Box("Value Dupe", function(Text)
    _G.ValueDupe = tonumber(Text)
end)
OwO:Button("Dupe", function()
   for _, v in next, workspace:GetDescendants() do
    if v:IsA("ProximityPrompt") and v.Name == "WorkPrompt" then
        if (v.Parent.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 10 then
                for i = 1, _G.ValueDupe do
                fireproximityprompt(v, true)
                end
            end
        end
    end
end)
else
game.Players.LocalPlayer:Kick([[
Kick By : MarvenRiz X Hwid
หมายเหตุ : Key หรือ HWID ไม่ถูกต้อง
> หากมีปัญหาติดต่อแอดมิน <
]])
end
