local HttpMap = "https://www.roblox.com/games/"
local MyLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/Ui60FPS.lua"))()

local Window = MyLibrary:CreateWindow("60 FPS", "Version : Free")

local Page1 = Window:addPage("👾Discord", 1, true, 6)
local Page2 = Window:addPage("🚀Link Map", 1, true, 6)
local Page3 = Window:addPage("👑Script", 1, true, 6)
  
Page1:addButton("> link Discord <", function()
  setclipboard("https://discord.gg/mPa6DptTv4")
end)


Page2:addButton("Youth 2554", function()
  setclipboard(HttpMap.."79639088460275")
end)
Page2:addButton("2544 Roplay", function()
  setclipboard(HttpMap.."79639088460275")
end)

Page3:addButton("Script : แมพทหารทั้งหลาย", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/ThaiLol.lua"))()
end)
Page3:addButton("Script : Youth 2554", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/Youth2544.lua"))()
end)
Page3:addButton(" Script : 2544 Roplay", function()
  loadstring(game:HttpGet("https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/2544Noob.lua"))()
end)
