
local BypassAdonis = function()
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
end

local folder
if game.PlaceId == 131130916935117 then
   folder = workspace:FindFirstChild("Rob_Part")
    if not folder then
        folder = Instance.new("Folder")
        folder.Name = "Rob_Part"
        folder.Parent = workspace
    end
    for _, cf in ipairs({
        --CFrame.new(-587, 17.53125, -634),
        --CFrame.new(540, 16.5312462, -852),
        --CFrame.new(-350.462952, 14.7469215, -1935.69922),
    }) do
        --game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = cf
        --task.wait(3)
        for _, x in pairs(workspace.Map["\224\184\136\224\184\184\224\184\148\224\184\159\224\184\178\224\184\163\224\185\140\224\184\161"]:GetDescendants()) do
            if x:IsA("BasePart") and x:FindFirstChildOfClass("ProximityPrompt") then
                x.Parent = folder
            end
        end
    end
end
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

--[[
local Section1 = Tab1:Section({ Title = "| Anti Player" })
Tab1:Toggle({
	Title = "Anti Visible",
	Desc = "ป้องกันการ โดนเห็นจากผู้เล่นปกติ",
	Type = "Checkbox",
	Value = false,
	Callback = function(sty)
    _G.Anti = sty
	end
})
local Section1 = Tab1:Section({ Title = "| Farm" })
--]]
Tab1:Toggle({
	Title = "Auto Farm Slow",
	Desc = "ออโต้ฟาม เงินแบบช้า",
	Type = "Checkbox",
	Value = false,
	Callback = function(state)
	_G.FarmSlow = state
	if not _G.FarmSlow then
	    task.wait(0.1)
    	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
    	workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character.Humanoid
        end
	end
})
Tab1:Toggle({
	Title = "Auto Farm Fast",
	Desc = "ออโต้ฟาม เงินแบบเร็ว [ อาจมีบัค ]",
	Type = "Checkbox",
	Value = false,
	Callback = function(state)
	_G.FarmFast = state
	if not _G.FarmFast then
	    task.wait(0.1)
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
    while task.wait() do
        xpcall(function()
            if _G.FarmSlow then
                for _, v in pairs(folder:GetChildren()) do
                    if v:IsA("BasePart") and v.Size.Z < 999 and v.StatusGui.StatusLabel.Text == "พร้อม" then
                    local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    workspace.CurrentCamera.CameraSubject = v
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 0, 3), v.Position)
                    task.wait(0.25)
                    prompt:InputHoldBegin()
                    task.wait(prompt.HoldDuration)
                    prompt:InputHoldEnd()
                    end
                end
            end
        end, print)
    end
end)

local waitQueue = {}
local function isInQueue(part)
    for _, data in ipairs(waitQueue) do
        if data.part == part then return true end
    end
    return false
end
local function getAllAvailable()
    local targets = {}
    if not folder then return targets end
    
    for _, v in pairs(folder:GetChildren()) do
        if v:IsA("BasePart") and v.Size.Z < 999 and v.StatusGui.StatusLabel.Text == "พร้อม" then
            local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
            if prompt and prompt.Enabled and prompt.ActionText == "ทำงาน" and not isInQueue(v) then
                table.insert(targets, {part = v, prompt = prompt})
            end
        end
    end
    return targets
end

task.spawn(function()
    while task.wait(0.1) do
        xpcall(function()
            if _G.FarmFast then
                local targets = getAllAvailable()
                for _, data in ipairs(targets) do
                    if not _G.FarmFast then break end
                    local v = data.part
                    local prompt = data.prompt
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 0, 3), v.Position)
                    task.wait(0.2)
                    prompt:InputHoldBegin()
                    task.wait(0.1)
                    prompt:InputHoldEnd()
                    table.insert(waitQueue, {
                        part = v,
                        prompt = prompt,
                        startTime = tick()
                    })
                end
            end
        end, print)
    end
end)
task.spawn(function()
    while task.wait(0.5) do
        xpcall(function()
            if _G.FarmFast and #waitQueue > 0 then
                local currentTime = tick()
                local readyToFire = {}
                for i = #waitQueue, 1, -1 do
                    if currentTime - waitQueue[i].startTime >= 7 then
                        table.insert(readyToFire, table.remove(waitQueue, i))
                    end
                end
                if #readyToFire > 0 then
                    local charPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                    table.sort(readyToFire, function(a, b)
                        return (a.part.Position - charPos).Magnitude < (b.part.Position - charPos).Magnitude
                    end)
                    for _, data in ipairs(readyToFire) do
                        if data.part and data.prompt then
                            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(data.part.Position + Vector3.new(0, 0, 3), data.part.Position)
                            task.wait(0.001)
                            fireproximityprompt(data.prompt)
                        end
                    end
                end
            end
        end, print)
    end
end)



--[[

task.spawn(function()
    while task.wait(0.1) do
        xpcall(function()
        if _G.FarmFast and folder then
            for _, v in pairs(folder:GetChildren()) do
            if v:IsA("BasePart") and v.Size.Z < 999 then
                local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                if prompt and prompt.Enabled and prompt.ActionText == "ทำงาน" and not isInQueue(v) then
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    workspace.CurrentCamera.CameraSubject = v
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 0, 3), v.Position)
                    task.wait(0.25)
                    prompt:InputHoldBegin()
                    task.wait(0.2)
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
        end, print)
    end
end)
task.spawn(function()
    while task.wait() do
        xpcall(function()
        if _G.FarmFast then
        for i, data in ipairs(waitQueue) do
            if tick() - data.startTime >= 8 then
                local v = data.part
                local prompt = data.prompt
                if v and v.Parent and prompt then
                    workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    workspace.CurrentCamera.CameraSubject = v
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Position + Vector3.new(0, 0, 3), v.Position)
                    task.wait(0.25)
                    for _, v in pairs(folder:GetChildren()) do
                        if v:IsA("BasePart") and (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Position).Magnitude <= 30 then
                            local prompt = v:FindFirstChildWhichIsA("ProximityPrompt", true)
                            if prompt and prompt.Enabled then
                                fireproximityprompt(prompt)
                            end
                        end
                    end
                end
                table.remove(waitQueue, i)
                task.wait(0.25)
                break
                end
                end
            end
        end, print)
    end
end)
--]]
--BypassAdonis()



