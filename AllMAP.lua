local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "DiscordUI"
gui.Parent = player:WaitForChild("PlayerGui")

-- Frame หลัก
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 180)
frame.Position = UDim2.new(0.5, -160, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(60, 0, 0)
frame.Parent = gui

-- มุมโค้ง
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)

-- ขอบแดง
local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(255, 0, 0)
stroke.Parent = frame

-- Gradient แดงดำ
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))
}
gradient.Rotation = 90
gradient.Parent = frame

-- หัวข้อ
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0.3, 0)
title.BackgroundTransparency = 1
title.Text = "🔥 60 FPS 🔥"
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255,255,255)
title.Parent = frame

-- รายละเอียด
local desc = Instance.new("TextLabel")
desc.Size = UDim2.new(1, -20, 0.3, 0)
desc.Position = UDim2.new(0, 10, 0.3, 0)
desc.BackgroundTransparency = 1
desc.Text = "เข้ามาเอาสคริปใหม่ที่ Discord"
desc.TextScaled = true
desc.Font = Enum.Font.Gotham
desc.TextColor3 = Color3.fromRGB(255,150,150)
desc.Parent = frame

-- ปุ่ม
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 0.25, 0)
button.Position = UDim2.new(0.1, 0, 0.7, 0)
button.BackgroundColor3 = Color3.fromRGB(100, 0, 0)
button.Text = "Copy Link"
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.TextColor3 = Color3.fromRGB(255,255,255)
button.Parent = frame

-- มุมโค้งปุ่ม
Instance.new("UICorner", button).CornerRadius = UDim.new(0, 12)

-- ขอบปุ่ม
local btnStroke = Instance.new("UIStroke")
btnStroke.Thickness = 1.5
btnStroke.Color = Color3.fromRGB(1,1,1)
btnStroke.Parent = button

-- เอฟเฟกต์ hover
button.MouseEnter:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
end)

button.MouseLeave:Connect(function()
    button.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
end)

-- กดปุ่ม
button.MouseButton1Click:Connect(function()
   setclipboard("https://discord.gg/8sZZJRRtAA")
end)
