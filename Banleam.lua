
local BypassAdonis = function()
  run_on_actor(function()
    for i, v in pairs(getgc(true)) do
        if type(v) == "table" then
            if rawget(v, "Detected") and rawget(_VERSION, "AddDetector") and rawget(v, "Launch") then
                for k, v in pairs(v) do
                    v[k] = nil
                    end
                end
            end
        end
    end)
end
pcall(function()
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local desyncOffset = CFrame.new(0, -10, 0)
local desyncPos
local desynchook
local prevLookVector = nil
local isSpinning = false
local spinThreshold = 15
local folder = workspace:FindFirstChild("Rob_Part")
if not folder then
    folder = Instance.new("Folder")
    folder.Name = "Rob_Part"
    folder.Parent = workspace
end
for _, x in pairs(workspace.Map["\224\184\136\224\184\184\224\184\148\224\184\159\224\184\178\224\184\163\224\185\140\224\184\161"]:GetDescendants()) do
    if x:IsA("BasePart") then
        x.Parent = folder
    end
end

local waitQueue = {}
local function isInQueue(part)
    for _, q in ipairs(waitQueue) do
        if q.part == part then
            return true
        end
    end
    return false
end
end)

local NameMap = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Window = WindUI:CreateWindow({
	Title = "MarvenRiz X Hub",
	Icon = "rbxassetid://87526284179554",
	Author = "Map : " .. NameMap,
	Folder = "MarvenRizX",
	Size = UDim2.fromOffset(360, 410),
	Transparent = false,
	Theme = "Dark",
	Resizable = true,
	IconSize = 60,
	NewElements = true,
	BackgroundImageTransparency = 0.40,
	HideSearchBar = true,
	ScrollBarEnabled = false,
	Topbar = {
		Height = 45,
		ButtonsType = "Default",
	},
})


local Tab1 = Window:Tab({ Title = "Auto Farm", Border = true })
local Tab2 = Window:Tab({Title = "Gun Config", Border = true })

local Section1 = Tab1:Section({ Title = "| General" })
local Section1 = Tab2:Section({ Title = "| Set Gun" })

Tab1:Toggle({
	Title = "Auto Farm Money",
	Desc = "ออโต้ฟาม เงิน",
	Type = "Checkbox",
	Value = false,
	Callback = function(state)
	_G.Farm = state
	if not _G.Farm then
    	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        end
	end
})
local Code = Tab2:Code({
    Title = "Code",
    Code = [=[
-- [[ Hole / หลุมกระสุน ]]
BulletHoleEnabled = true -- เปิดรอยกระสุน
BulletHoleTexture = { 87526284179554 } -- ไอดีภาพ
BulletHoleSize = 10000 -- ขนาดรูป
BulletHoleVisibleTime = 100000 -- เวลาแสดงผล
BulletHoleFadeTime = 100000 -- เวลาเฟดหาย

-- [[ Ammo / จำนวนกระสุน ]]
LimitedAmmoEnabled = false -- ปิดระบบกระสุนจำกัด (ยิงได้ไม่หมด)
AmmoPerMag = math.huge -- กระสุนต่อแม็ก = ไม่จำกัด
Ammo = math.huge -- กระสุนปัจจุบัน = ไม่จำกัด
MaxAmmo = math.huge -- กระสุนสำรอง = ไม่จำกัด
ReloadTime = 0 -- เวลารีโหลด = 0 (รีทันที)

-- [[ Shot / ยิง ]]
BaseDamage = math.huge --ดาเมจ
FireRate = 0.1 -- ความเร็วการยิง (ยิ่งน้อย = ยิงไว)
CameraRecoilingEnabled = true -- ปิดแรงดีดกล้อง
Recoil = 0 -- ไม่มีแรงดีด
Auto = true -- ยิงออโต้
Spread = 1 -- ความกระจายกระสุน

-- [[ Distand / ระยะ ]]
Range = 9000000000 -- ระยะยิง (ไกลมาก)
BulletSpeed = 9000000000 -- ความเร็วกระสุน (เร็วมาก)

-- [[ Music / เพลง ]]
HitSoundIDs = { 8947284135 } -- เสียงตอนยิงโดนสิ่งของ
HitSoundVolume = 50 -- ความดังเสียง
HitSoundPitchMin = 1 -- pitch ต่ำสุด
HitSoundPitchMax = 1 -- pitch สูงสุด
HitCharSndIDs = { 8947284135 } -- เสียงตอนยิงโดนคน
HitCharSndVolume = 50 -- ความดัง

-- [[ Smoke / ควัน ]]
SmokeTrailEnabled = true -- เปิดควันกระสุน
MaximumRate = 999999999 -- อัตราสูงสุดของเอฟเฟกต์
MaximumTime = math.huge -- เวลาเอฟเฟกต์อยู่ (นานมาก)

-- [[ Blood / เลือดสาด ]]
BloodEnabled = true -- เปิดเลือด
GoreEffectEnabled = true -- เปิดเอฟเฟกต์แรง (เลือด/ชิ้นส่วน)

-- [[ Flame / กระสุนไฟ ]]
FlamingBullet = true -- กระสุนไฟ (ยิงแล้วทำให้ศัตรูติดไฟ)
IgniteChance = 100 -- โอกาสติดไฟ (100 = ติดทุกนัด)

-- [[ Freeze / กระสุนน้ำแข็ง ]]
FreezingBullet = true -- กระสุนแช่แข็ง (ทำให้ศัตรูช้าหรือแข็ง)
IcifyChance = 100 -- โอกาสแช่แข็ง (100 = ติดทุกนัด)

-- [[ Ricochet / กระสุนเด้ง]]
RicochetAmount = math.huge -- จำนวนครั้งที่กระสุนเด้งกำแพง
SuperRicochet = true -- เด้งแบบพิเศษ (true = เด้งแรง/ควบคุมยาก)

-- [[ Knockback / กระเด็น ]]
Knockback = math.huge -- แรงผลักศัตรูตอนโดนยิง
ExplosionKnockback = false -- ให้แรงระเบิดผลักตัวผู้เล่น

-- [[ Explosive / ระเบิด ]]
ExplosiveEnabled = fasle -- ปิดระเบิด (เปิดเมื่ออยากเล่นโหด)
ExplosionRadius = 1000 -- รัศมีระเบิด

-- [[ LightColor / แสงแฟรช ]]
MuzzleFlashEnabled = true -- เปิดแสงปากกระบอก
MuzzleLightEnabled = true -- เปิดไฟจากปืน
LightBrightness = 99999999999999 -- ความสว่างไฟ
LightRange = 99999999999999999 -- ระยะไฟ
LightColor = Color3.new(255, 0, 0) -- สีไฟ (แดง)
VisibleTime = math.huge -- เวลาที่เอฟเฟกต์มองเห็นได้ (ไม่หาย)
]=]
})

local Section1 = Tab2:Section({ Title = "| Config Gun" })
local Input = Tab2:Input({
    Title = "Config",
    Desc = "ค่าปรับ ปืน",
    Type = "Input", -- or "Textarea"
    Placeholder = "...",
    Callback = function(vco) 
       _G.Hee= vco
    end
})
local Button = Tab2:Button({
    Title = "Set Gun",
    Desc = "ปรับแต่งปืน",
    Locked = false,
    Callback = function()
        if _G.Hee then
			local func, err = loadstring("local g=require(game.Players.LocalPlayer.Character:FindFirstChildOfClass('Tool').Setting)\n".._G.Hee:gsub('([%w_]+)%s*=', 'g.%1 ='))
			if func then
				pcall(func)
			else
				warn('Error: '..err)
			end
		end
    end
})
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
        if _G.Farm then
        for _, v in pairs(folder:GetChildren()) do
            if v:IsA("BasePart") and v.Size.Z < 999 then
                local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and prompt.Enabled and prompt.ActionText == "ทำงาน" and not isInQueue(v) then
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    workspace.CurrentCamera.CameraSubject = v
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 0, 3), v.Position)
                    task.wait(0.25)
                    prompt:InputHoldBegin()
                    task.wait(0.1)
                    prompt:InputHoldEnd()
                    table.insert(waitQueue, {
                        part = v,
                        prompt = prompt,
                        startTime = tick()
                    })
                    task.wait(0.1)
                        end
                    end
                end
            end
        end)
    end
end)
task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
        if _G.Farm then
        for i, data in ipairs(waitQueue) do
            if tick() - data.startTime >= 5 then
                local v = data.part
                local prompt = data.prompt
                if v and v.Parent and prompt then
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    workspace.CurrentCamera.CameraSubject = v
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 0, 3), v.Position)
                    task.wait(0.25)
                    fireproximityprompt(prompt)
                end
                table.remove(waitQueue, i)
                task.wait(0.25)
                break
                end
                end
            end
        end)
    end
end)
RunService.Heartbeat:Connect(function()
    if not LocalPlayer.Character then return end
    local character = LocalPlayer.Character
    local root = character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    if not _G.Farm then
        desyncPos = nil
        return
    end
    local currentLook = root.CFrame.LookVector
    if prevLookVector then
        local dot = math.clamp(prevLookVector:Dot(currentLook), -1, 1)
        local angleDiff = math.deg(math.acos(dot))
        isSpinning = angleDiff > spinThreshold
    end
    prevLookVector = currentLook

    if isSpinning then return end

    desyncPos = root.CFrame

    root.CFrame = desyncPos * desyncOffset
    RunService.RenderStepped:Wait()
    root.CFrame = desyncPos
end)

desynchook = hookmetamethod(game, "__index", newcclosure(function(self, key)
    if _G.Farm
    and not checkcaller()
    and key == "CFrame"
    and LocalPlayer.Character
    and self == LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    and desyncPos
    and not isSpinning then
        return desyncPos
    end
    return desynchook(self, key)
end))
LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    prevLookVector = nil
    isSpinning = false
    desyncPos = nil
end)
BypassAdonis()
