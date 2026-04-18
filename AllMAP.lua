
local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name


getgenv().Config = {
  ["รวมฟรอมช่าง"] = {
    http = "https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/4king.lua",
  };
  ["สงครามขาสั้น ปั้มเงิน"] = {
    http = "https://pastefy.app/XNfmWbmv/raw",
  };
  ["ราชาอาชีวะ V2"] = {
    http = "https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/RachaX.lua"
  };
  ["Ban Leam : เมืองเพรช"] = {
    http = "https://raw.githubusercontent.com/ProjectSHub01/60fps/refs/heads/main/Banleam.lua"
  };
}

local Map = {}
for n, data in pairs(getgenv().Config) do
    table.insert(Map, n)
end

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()

local Window = WindUI:CreateWindow({
	Title = "MarvenRiz X Hub",
	Icon = "rbxassetid://87526284179554",
	Folder = "MarvenRizX",
	Size = UDim2.fromOffset(340, 400),
	Transparent = true,
	Theme = "Dark",
	Resizable = true,
	IconSize = 60,
	NewElements = true,
	BackgroundImageTransparency = 0.40,
	HideSearchBar = true,
	ScrollBarEnabled = false,
	SideBarWidth = 120,
	Topbar = {
		Height = 45,
		ButtonsType = "Default",
	},
})


local Tab1 = Window:Tab({
    Title = "🌟 MAP",
})


local Section1 = Tab1:Section({ Title = "| MAP" })


local Dropdown = Tab1:Dropdown({
    Title = "Select Map",
    Values = Map,
    Value = "None",
    Callback = function(option) 
    	_G.Map = option
    end
})


Tab1:Button({
	Title = "Load Script",
	Callback = function()
	loadstring(game:HttpGet(getgenv().Config[_G.Map].http))()
	end
})
