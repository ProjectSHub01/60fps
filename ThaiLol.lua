
  local uprequire = function(Target, Value)
  local Gun = require(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").ConfigMods:FindFirstChild("CConfig"))
  if Gun then
    Gun[Target] = Value
  end
end

local WindUI = loadstring(game:HttpGet("https://tree-hub.vercel.app/api/UI/WindUI"))()
local Window = WindUI:CreateWindow({
    Title = "60 FPS | Community",
    Icon = "airplay",
    Author = "Version : Free",
    Folder = "MarvenRiz",
    Size = UDim2.fromOffset(360, 300),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 130,
    HasOutline = false,
})
Window:EditOpenButton({
    Title = "Open Script",
    Icon = "monitor",
    CornerRadius = UDim.new(0, 10),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("ffffff"),
        Color3.fromHex("000000")
    ),
    Draggable = true,
})

local Tab = {
  T1 = Window:Tab({
    Title = "// Gun",
    Icon = "code",
  }),
  T2 = Window:Tab({
    Title = "// Player",
    Icon = "flame",
  }),
}

Tab.T1:Section({ Title = "> Gun Set" })
Tab.T1:Button({
  Title = "Disable Recoil",
  Desc = "ลบ : แรงดีดปืน",
  Callback = function()
    uprequire("gunRecoilMin", 0)
    uprequire("gunRecoilMax", 0)
    uprequire("AimGunRecoilMin", 0)
    uprequire("AimGunRecoilMax", 0)
    uprequire("KickbackMin", 0)
    uprequire("KickbackMax", 0)
    uprequire("AimKickbackMin", 0)
    uprequire("AimKickbackMax", 0)
    uprequire("SideKickMin", 0)
    uprequire("SideKickMax", 0)
    uprequire("AimSideKickMin", 0)
    uprequire("AimSideKickMax", 0)
    uprequire("CamShakeMin", 0)
    uprequire("CamShakeMax", 0)
    uprequire("AimCanShakeMin", 0)
    uprequire("AimCamShakeMax", 0)
    WindUI:Notify({
      Title = "Recoil Disabled",
      Content = "! Succeed",
      Icon = "bell",
      Duration = 5,
    })
  end
})
Tab.T1:Button({
  Title = "Friendly Fire",
  Desc = "เปิดให้ยิงทีมเดียวกันได้",
  Callback = function()
    uprequire("CanTeamKill", true)
    WindUI:Notify({
      Title = "Friendly Fire Enabled",
      Content = "! Succeed",
      Icon = "bell",
      Duration = 5,
    })
  end
})
Tab.T1:Button({
  Title = "Inf Ammo",
  Desc = "กระสุนปืนไม่จำกัด",
  Callback = function()
    uprequire("Ammo", 100000000)
    uprequire("StoredAmmo", 100000000)
    WindUI:Notify({
      Title = "Inf Ammo",
      Content = "! Succeed",
      Icon = "bell",
      Duration = 5,
    })
  end
})

Tab.T1:Button({
  Title = "Inf Damage",
  Desc = "ดาเมจปืนไม่จำกัด",
  Callback = function()
    uprequire("BaseDamage", 50)
    uprequire("LimbDamage", 50)
    uprequire("ArmorDamage", 50)
    uprequire("EShieldDamage", 50)
    WindUI:Notify({
      Title = "Inf Damage",
      Content = "! Succeed",
      Icon = "bell",
      Duration = 5,
    })
  end
})

Tab.T1:Button({
  Title = "Fast FireRate",
  Desc = "ยิงเร็วขึ้น",
  Callback = function()
    uprequire("Firerate", 0.01)
    uprequire("FireMode", 2)
    WindUI:Notify({
      Title = "Fast FireRate",
      Content = "! Succeed",
      Icon = "bell",
      Duration = 5,
    })
  end
})

Tab.T1:Section({ Title = "> Gun" })

local Radius = Tab.T1:Slider({
  Title = "Set Explosion Radius",
  Desc = "ปรับรัสมีการระเบิด",
  Value = {
    Min = 1,
    Max = 500,
    Default = 1,
  },
  Callback = function(_Rs)
    _G.Radius = _Rs
  end
})
Radius:Set(250)
Tab.T1:Button({
  Title = "Enable Explosive Ammo",
  Desc = "เปิดการทำงานกระสุนระเบิด",
  Callback = function()
    uprequire("ExplosiveEnabled", true)
    uprequire("ExplosiveAmmo", math.huge)
    uprequire("BlastPressue", 10000)
    uprequire("BlastRadius", _G.Radius)
    WindUI:Notify({
      Title = "Inf Ammo",
      Content = "! Succeed",
      Icon = "bell",
      Duration = 5,
    })
  end
})
