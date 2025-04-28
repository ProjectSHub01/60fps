if game.CoreGui:FindFirstChild("Ui60FPS") then
    game.CoreGui:FindFirstChild("Ui60FPS"):Destroy()
end

local Library = {}
function Library:CreateWindow(windowname, windowinfo)
    local Ui60FPS = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local stroke = Instance.new("UIStroke")
    local uiGradient = Instance.new("UIGradient")
    local FrameCorner = Instance.new("UICorner")
    local DashBoard = Instance.new("Frame")
    local DashBoardCorner = Instance.new("UICorner")
    local TabContainer = Instance.new("Frame")
    local TabContainer_2 = Instance.new("UIListLayout")
    local PageContainer = Instance.new("Frame")
    local PageContainerCorner = Instance.new("UICorner")
    local PageFolder = Instance.new("Folder")
    local Title = Instance.new("TextLabel")
    local Title2 = Instance.new("TextLabel")
    local leave = Instance.new("TextButton")

    -- UI Setup
    Ui60FPS.Name = "Ui60FPS"
    Ui60FPS.Parent = game:GetService("CoreGui")
    Ui60FPS.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    Ui60FPS.ResetOnSpawn = false

    Frame.Parent = Ui60FPS
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.289808273, 0, 0.313227266, 0)
    Frame.Size = UDim2.new(0, 432, 0, 285)
    
    stroke.Thickness = 2
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Parent = Frame
    
    uiGradient.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 0, 0))
    uiGradient.Rotation = 0
    uiGradient.Parent = stroke
    
    task.defer(function()
        local camera = workspace.CurrentCamera
        local viewportSize = camera.ViewportSize
        Frame.Position = UDim2.new(0, (viewportSize.X - Frame.Size.X.Offset) / 2, 0, (viewportSize.Y - Frame.Size.Y.Offset) / 2 - 50)
    end)
    
    game:GetService("RunService").RenderStepped:Connect(function()
        uiGradient.Rotation = uiGradient.Rotation + 2
    end)
    
    FrameCorner.Name = "FrameCorner"
    FrameCorner.Parent = Frame
    
    DashBoard.Name = "DashBoard"
    DashBoard.Parent = Frame
    DashBoard.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    DashBoard.BorderColor3 = Color3.fromRGB(15, 15, 15)
    DashBoard.Position = UDim2.new(0.0185185205, 0, 0.16842106, 0)
    DashBoard.Size = UDim2.new(0, 107, 0, 223)

    DashBoardCorner.CornerRadius = UDim.new(0, 6)
    DashBoardCorner.Name = "DashBoardCorner"
    DashBoardCorner.Parent = DashBoard

    TabContainer.Name = "TabContainer"
    TabContainer.Parent = DashBoard
    TabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderColor3 = Color3.fromRGB(15, 15, 15)
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.0280373823, 0, 0.0391304344, 0)
    TabContainer.Size = UDim2.new(0, 100, 0, 214)

    TabContainer_2.Name = "TabContainer"
    TabContainer_2.Parent = TabContainer
    TabContainer_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabContainer_2.SortOrder = Enum.SortOrder.LayoutOrder
    TabContainer_2.Padding = UDim.new(0, 8)

    PageContainer.Name = "PageContainer"
    PageContainer.Parent = Frame
    PageContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    PageContainer.BorderColor3 = Color3.fromRGB(15, 15, 15)
    PageContainer.Position = UDim2.new(0.282407403, 0, 0.16842106, 0)
    PageContainer.Size = UDim2.new(0, 299, 0, 223)

    PageContainerCorner.CornerRadius = UDim.new(0, 6)
    PageContainerCorner.Name = "PageContainerCorner"
    PageContainerCorner.Parent = PageContainer

    PageFolder.Name = "PageFolder"
    PageFolder.Parent = PageContainer

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(20, 20, 20)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.04,0,0.001,0)
    Title.Size = UDim2.new(0, 355, 0, 33)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = windowname
    Title.TextColor3 = Color3.fromRGB(255, 0, 0)
    Title.TextSize = 15.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Title2.Name = "Title2"
    Title2.Parent = Frame
    Title2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title2.BackgroundTransparency = 1.000
    Title2.BorderColor3 = Color3.fromRGB(20, 20, 20)
    Title2.BorderSizePixel = 0
    Title2.Position = UDim2.new(0.04,0,0,15)
    Title2.Size = UDim2.new(0, 355, 0, 33)
    Title2.Font = Enum.Font.GothamSemibold
    Title2.Text = windowinfo
    Title2.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title2.TextSize = 12.000
    Title2.TextXAlignment = Enum.TextXAlignment.Left

    leave.Name = "leave"
    leave.Parent = Frame
    leave.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    leave.BackgroundTransparency = 1.000
    leave.BorderColor3 = Color3.fromRGB(20, 20, 20)
    leave.BorderSizePixel = 0
    leave.Position = UDim2.new(0.88499999, 0, 0.0495263338, 0)
    leave.Size = UDim2.new(0, 38, 0, 22)
    leave.AutoButtonColor = false
    leave.Font = Enum.Font.SourceSans
    leave.Text = "x"
    leave.TextColor3 = Color3.fromRGB(255, 0, 0)
    leave.TextSize = 20
    
    leave.MouseButton1Click:Connect(function()
      if game.CoreGui:FindFirstChild("Ui60FPS") then
        game.CoreGui:FindFirstChild("Ui60FPS"):Destroy()
      end
    end)

    -- Dragging functionality
    local UserInputService = game:GetService("UserInputService")
    local gui = Frame
    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)

    -- Page Creation Functions
    local PageYep = {}
    function PageYep:addPage(pagename, scrollsize, visible, elementspacing)
        local Tab = Instance.new("TextButton")
        local TabCorner = Instance.new("UICorner")
        local Home = Instance.new("ScrollingFrame")
        local PageLayout = Instance.new("UIListLayout")
        
        Tab.Name = "Tab"
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Tab.BorderColor3 = Color3.fromRGB(15, 15, 15)
        Tab.Position = UDim2.new(-0.0250000004, 0, 0, 0)
        Tab.Size = UDim2.new(0, 106, 0, 26)
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.GothamSemibold
        Tab.Text = pagename or "nil"
        Tab.TextColor3 = Color3.fromRGB(255, 255, 255)
        Tab.TextSize = 11.000
        Tab.TextTransparency = 0.300
        
        TabCorner.CornerRadius = UDim.new(0, 7)
        TabCorner.Name = "TabCorner"
        TabCorner.Parent = Tab

        Home.Name = "Page"
        Home.Parent = PageFolder
        Home.Active = true
        Home.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Home.BackgroundTransparency = 1.000
        Home.BorderColor3 = Color3.fromRGB(15, 15, 15)
        Home.BorderSizePixel = 0
        Home.Position = UDim2.new(0, 0, 0.0391303785, 0)
        Home.Size = UDim2.new(0, 298, 0, 205)
        Home.ScrollBarThickness = 3
        Home.ScrollBarImageColor3 = Color3.fromRGB(5, 5, 5)
        Home.CanvasSize = UDim2.new(0, 0, scrollsize, 0) or UDim2.new(0, 0, 4, 0)
        Home.Visible = visible or false
        PageLayout.Name = "PageLayout"
        PageLayout.Parent = Home
        PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, elementspacing) or UDim.new(0, 6)

        Tab.MouseButton1Down:Connect(function()
            Tab.TextSize = 9 
            for i, v in pairs(PageFolder:GetChildren()) do 
                v.Visible = false
            end
            wait(0.02)
            Home.Visible = true
            Tab.TextTransparency = 0
            Tab.TextSize = 11
            for i, v in pairs(TabContainer:GetChildren()) do 
                if v:IsA("GuiButton") and v ~= Tab then 
                    v.TextTransparency = 0.3
                end
            end
        end)

        if visible == true then 
            Tab.TextTransparency = 0
            for i, v in pairs(PageFolder:GetChildren()) do 
                if v:IsA("Frame") and v ~= Home then 
                    v.Visible = false
                end
            end
        else
            Tab.TextTransparency = 0.3
        end
        
        Tab.MouseEnter:Connect(function()
            Tab.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
        end)
        
        Tab.MouseLeave:Connect(function()
            Tab.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        end)

        local PageElements = {}
        function PageElements:addButton(buttonname, callback)
            local ButtonHolder = Instance.new("Frame")
            local Button = Instance.new("TextButton")
            local UIStroke = Instance.new("UIStroke")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonHolderCorner = Instance.new("UICorner")

            local callback = callback or function () end

            ButtonHolder.Name = "ButtonHolder"
            ButtonHolder.Parent = Home
            ButtonHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ButtonHolder.BorderColor3 = Color3.fromRGB(17, 17, 17)
            ButtonHolder.BorderSizePixel = 0
            ButtonHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            ButtonHolder.Size = UDim2.new(0, 288, 0, 26)
            
            Button.Name = "Button"
            Button.Parent = ButtonHolder
            Button.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            Button.BackgroundTransparency = 1.000
            Button.BorderColor3 = Color3.fromRGB(17, 17, 17)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 288, 0, 26)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = buttonname
            Button.TextColor3 = Color3.fromRGB(255, 255, 255)
            Button.TextSize = 11.000
            
            UIStroke.Parent = Button
            UIStroke.Transparency = 0.8
            UIStroke.Color = Color3.fromRGB(255, 255, 255);
            UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
            
            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button
            ButtonHolderCorner.CornerRadius = UDim.new(0, 5)
            ButtonHolderCorner.Name = "ButtonHolderCorner"
            ButtonHolderCorner.Parent = ButtonHolder

            Button.MouseButton1Down:Connect(function()
                Button.TextSize = 9
                wait(0.1)
                Button.TextSize = 11
                pcall(callback)
            end)
        end
        return PageElements
    end

    return PageYep
end

return Library
