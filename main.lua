-- FemWare UI Library
-- A modern UI library for Roblox with working components

local FemWare = {}
FemWare.__index = FemWare

-- Library configuration
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

-- Horrible animation settings (but functional)
local HORRIBLE_EASING = Enum.EasingStyle.Back
local HORRIBLE_DIRECTION = Enum.EasingDirection.In
local HORRIBLE_TIME = 0.8 -- Shorter but still annoying
local HORRIBLE_OVERSHOOT = 1.5 -- Less extreme overshoot

-- Create main GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Enabled = true

local UIContainer = Instance.new("Frame")
UIContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
UIContainer.AnchorPoint = Vector2.new(0.5, 0.5)
UIContainer.BackgroundTransparency = 1
UIContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
UIContainer.Name = "UIContainer"
UIContainer.Size = UDim2.new(0, 868, 0, 455)
UIContainer.BorderSizePixel = 0
UIContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
UIContainer.Parent = ScreenGui

local MainFrame = Instance.new("Frame")
MainFrame.ClipsDescendants = true
MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.AnchorPoint = Vector2.new(0, 0.5)
MainFrame.Name = "MainFrame"
MainFrame.Position = UDim2.new(0, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 455)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundColor3 = Color3.fromRGB(255, 212, 251)
MainFrame.Parent = UIContainer

local UICorner = Instance.new("UICorner")
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = MainFrame

-- Library icon and name
local Libary_Icon = Instance.new("ImageLabel")
Libary_Icon.ScaleType = Enum.ScaleType.Crop
Libary_Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
Libary_Icon.Name = "Libary_Icon"
Libary_Icon.Image = "rbxassetid://70476080604761"
Libary_Icon.BackgroundTransparency = 1
Libary_Icon.Position = UDim2.new(0, 25, 0, 12)
Libary_Icon.Size = UDim2.new(0, 50, 0, 50)
Libary_Icon.BorderSizePixel = 0
Libary_Icon.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Libary_Icon.Parent = MainFrame

local Libary_Name = Instance.new("TextLabel")
Libary_Name.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Libary_Name.TextColor3 = Color3.fromRGB(201, 6, 255)
Libary_Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
Libary_Name.Text = "FemWare"
Libary_Name.Name = "Libary_Name"
Libary_Name.AnchorPoint = Vector2.new(0.5, 0.5)
Libary_Name.Size = UDim2.new(0, 1, 0, 1)
Libary_Name.BackgroundTransparency = 1
Libary_Name.Position = UDim2.new(0.5, 75, 0.5, 0)
Libary_Name.BorderSizePixel = 0
Libary_Name.AutomaticSize = Enum.AutomaticSize.XY
Libary_Name.TextSize = 35
Libary_Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Libary_Name.Parent = Libary_Icon

-- Tab system
local Bottom_Bar = Instance.new("Frame")
Bottom_Bar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Bottom_Bar.AnchorPoint = Vector2.new(0.5, 1)
Bottom_Bar.Name = "Bottom_Bar"
Bottom_Bar.BackgroundTransparency = 1
Bottom_Bar.Position = UDim2.new(0.4991667568683624, 0, 1, 0)
Bottom_Bar.Size = UDim2.new(0, 570, 0, 72)
Bottom_Bar.ZIndex = 50
Bottom_Bar.BorderSizePixel = 0
Bottom_Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bottom_Bar.Parent = MainFrame

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Padding = UDim.new(0, 8)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.FillDirection = Enum.FillDirection.Horizontal
UIListLayout.Parent = Bottom_Bar

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 12)
UIPadding.Parent = Bottom_Bar

-- Content area
local Container = Instance.new("ScrollingFrame")
Container.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
Container.Active = true
Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
Container.BackgroundTransparency = 0.8500000238418579
Container.Position = UDim2.new(0.023333333432674408, 0, 0.16043956577777863, 0)
Container.Name = "Container"
Container.Size = UDim2.new(0, 563, 0, 302)
Container.BorderSizePixel = 0
Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Container.Parent = MainFrame

-- ESP Preview
local Preview = Instance.new("Frame")
Preview.ClipsDescendants = true
Preview.BorderColor3 = Color3.fromRGB(0, 0, 0)
Preview.AnchorPoint = Vector2.new(1, 0.5)
Preview.Name = "Preview"
Preview.Position = UDim2.new(1, 0, 0.5, 0)
Preview.Size = UDim2.new(0, 245, 0, 455)
Preview.BorderSizePixel = 0
Preview.BackgroundColor3 = Color3.fromRGB(255, 212, 251)
Preview.Parent = UIContainer

local UICorner = Instance.new("UICorner")
UICorner.Parent = Preview

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Preview

-- ESP Preview elements
local Preview_Model = Instance.new("ImageLabel")
Preview_Model.ScaleType = Enum.ScaleType.Fit
Preview_Model.BorderColor3 = Color3.fromRGB(0, 0, 0)
Preview_Model.Name = "Preview_Model"
Preview_Model.AnchorPoint = Vector2.new(0.5, 0.5)
Preview_Model.Image = "rbxassetid://118769933784810"
Preview_Model.BackgroundTransparency = 1
Preview_Model.Position = UDim2.new(0.5, 0, 0.5, 0)
Preview_Model.Size = UDim2.new(0, 233, 0, 392)
Preview_Model.BorderSizePixel = 0
Preview_Model.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Preview_Model.Parent = Preview

local Box = Instance.new("ImageLabel")
Box.ScaleType = Enum.ScaleType.Crop
Box.ImageTransparency = 0.3799999952316284
Box.BorderColor3 = Color3.fromRGB(0, 0, 0)
Box.AnchorPoint = Vector2.new(0.5, 0.5)
Box.Image = "rbxassetid://106610492674685"
Box.Name = "Box"
Box.Position = UDim2.new(0.5, 0, 0.5, 0)
Box.Size = UDim2.new(0, 100, 0, 200)
Box.BorderSizePixel = 0
Box.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Box.Visible = false -- Set to invisible by default
Box.Parent = Preview_Model

-- Horrible Healthbar
local Healthbar = Instance.new("Frame")
Healthbar.Name = "Healthbar"
Healthbar.AnchorPoint = Vector2.new(0, 0.5)
Healthbar.Position = UDim2.new(0, -15, 0.5, 0)
Healthbar.Size = UDim2.new(0, 8, 0, 150)
Healthbar.BorderSizePixel = 2
Healthbar.BorderColor3 = Color3.fromRGB(0, 0, 0)
Healthbar.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
Healthbar.Visible = false
Healthbar.Parent = Box

local HealthbarFill = Instance.new("Frame")
HealthbarFill.Name = "HealthbarFill"
HealthbarFill.AnchorPoint = Vector2.new(0, 1)
HealthbarFill.Position = UDim2.new(0, 0, 1, 0)
HealthbarFill.Size = UDim2.new(1, 0, 0.8, 0)
HealthbarFill.BorderSizePixel = 0
HealthbarFill.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
HealthbarFill.Parent = Healthbar

local HealthText = Instance.new("TextLabel")
HealthText.Name = "HealthText"
HealthText.FontFace = Font.new("rbxasset://fonts/families/Creepster.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
HealthText.TextColor3 = Color3.fromRGB(255, 255, 255)
HealthText.BorderColor3 = Color3.fromRGB(0, 0, 0)
HealthText.Text = "100"
HealthText.AnchorPoint = Vector2.new(0.5, 0.5)
HealthText.Size = UDim2.new(0, 1, 0, 1)
HealthText.BackgroundTransparency = 1
HealthText.Position = UDim2.new(0.5, 0, 0.5, 0)
HealthText.BorderSizePixel = 0
HealthText.AutomaticSize = Enum.AutomaticSize.XY
HealthText.TextSize = 20
HealthText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
HealthText.Parent = Healthbar

local UIStroke = Instance.new("UIStroke")
UIStroke.Parent = Box

local Username_Esp = Instance.new("TextLabel")
Username_Esp.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Username_Esp.TextColor3 = Color3.fromRGB(0, 0, 0)
Username_Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Username_Esp.Text = "Femgamer21"
Username_Esp.Name = "Username_Esp"
Username_Esp.AnchorPoint = Vector2.new(0.5, 0)
Username_Esp.Size = UDim2.new(0, 1, 0, 1)
Username_Esp.BackgroundTransparency = 1
Username_Esp.Position = UDim2.new(0.5, 0, 0, -40)
Username_Esp.BorderSizePixel = 0
Username_Esp.AutomaticSize = Enum.AutomaticSize.XY
Username_Esp.TextSize = 35
Username_Esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Username_Esp.Parent = Box

local Distance_Esp = Instance.new("TextLabel")
Distance_Esp.FontFace = Font.new("rbxasset://fonts/families/Creepster.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Distance_Esp.TextColor3 = Color3.fromRGB(0, 0, 0)
Distance_Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Distance_Esp.Text = "10[m]"
Distance_Esp.Name = "Distance_Esp"
Distance_Esp.AnchorPoint = Vector2.new(0.5, 0)
Distance_Esp.Size = UDim2.new(0, 1, 0, 1)
Distance_Esp.BackgroundTransparency = 1
Distance_Esp.Position = UDim2.new(0.5, 0, 0, -75)
Distance_Esp.BorderSizePixel = 0
Distance_Esp.AutomaticSize = Enum.AutomaticSize.XY
Distance_Esp.TextSize = 35
Distance_Esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Distance_Esp.Parent = Box

local Tool_Esp = Instance.new("TextLabel")
Tool_Esp.FontFace = Font.new("rbxasset://fonts/families/GrenzeGotisch.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Tool_Esp.TextColor3 = Color3.fromRGB(0, 0, 0)
Tool_Esp.BorderColor3 = Color3.fromRGB(0, 0, 0)
Tool_Esp.Text = "Holding [Nothing]"
Tool_Esp.Name = "Tool_Esp"
Tool_Esp.AnchorPoint = Vector2.new(0.5, 1)
Tool_Esp.Size = UDim2.new(0, 1, 0, 1)
Tool_Esp.BackgroundTransparency = 1
Tool_Esp.Position = UDim2.new(0.5, 0, 1, 45)
Tool_Esp.BorderSizePixel = 0
Tool_Esp.AutomaticSize = Enum.AutomaticSize.XY
Tool_Esp.TextSize = 35
Tool_Esp.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Tool_Esp.Parent = Box

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.BorderColor3 = Color3.fromRGB(0, 0, 0)
Header.Size = UDim2.new(0, 245, 0, 40)
Header.BorderSizePixel = 0
Header.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Header.Parent = Preview

local UICorner = Instance.new("UICorner")
UICorner.Parent = Header

local Inline = Instance.new("Frame")
Inline.AnchorPoint = Vector2.new(0, 1)
Inline.Name = "Inline"
Inline.Position = UDim2.new(0, 0, 1, 0)
Inline.BorderColor3 = Color3.fromRGB(0, 0, 0)
Inline.Size = UDim2.new(1, 1, 0, 1)
Inline.BorderSizePixel = 0
Inline.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Inline.Parent = Header

local Label = Instance.new("TextLabel")
Label.FontFace = Font.new("rbxasset://fonts/families/IndieFlower.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
Label.TextColor3 = Color3.fromRGB(0, 0, 0)
Label.BorderColor3 = Color3.fromRGB(0, 0, 0)
Label.Text = "ESP Preview"
Label.Name = "Label"
Label.AnchorPoint = Vector2.new(0.5, 0.5)
Label.Size = UDim2.new(0, 1, 0, 1)
Label.BackgroundTransparency = 1
Label.Position = UDim2.new(0.5, 0, 0.5, 0)
Label.BorderSizePixel = 0
Label.AutomaticSize = Enum.AutomaticSize.XY
Label.TextSize = 35
Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Label.Parent = Header

-- Library variables
local currentTab = nil
local tabs = {}
local sections = {}

-- Random font system
local random_font = {
    random_fonts = {
        "rbxasset://fonts/families/IndieFlower.json",
        "rbxasset://fonts/families/GrenzeGotisch.json",
        "rbxasset://fonts/families/Creepster.json",
        "rbxasset://fonts/families/SourceSansPro.json",
        "rbxasset://fonts/families/Roboto.json",
        "rbxasset://fonts/families/Ubuntu.json",
        "rbxasset://fonts/families/OpenSans.json",
        "rbxasset://fonts/families/Lato.json",
        "rbxasset://fonts/families/Montserrat.json",
        "rbxasset://fonts/families/Poppins.json"
    }
}

-- Font randomization system
local function getRandomFont()
    return random_font.random_fonts[math.random(1, #random_font.random_fonts)]
end

local function randomizeAllFonts()
    -- Randomize tab fonts
    for tabName, tab in pairs(tabs) do
        if tab.button and tab.button:FindFirstChild("TabText") then
            tab.button.TabText.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
        end
    end
    
    -- Randomize section fonts
    for tabName, tab in pairs(tabs) do
        for sectionName, section in pairs(tab.sections) do
            if section.frame and section.frame:FindFirstChild("Section_Label") then
                section.frame.Section_Label.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
            end
            
            -- Randomize component fonts in this section
            for _, child in pairs(section.holder:GetChildren()) do
                if child:IsA("Frame") then
                    -- Toggle text
                    if child:FindFirstChild("Toggle_Text") then
                        child.Toggle_Text.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    end
                    -- Slider text
                    if child:FindFirstChild("Slider_Text") then
                        child.Slider_Text.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    end
                    -- Slider value
                    if child:FindFirstChild("Value") then
                        child.Value.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    end
                    -- Dropdown option
                    if child:FindFirstChild("Dropdown") and child.Dropdown:FindFirstChild("Option") then
                        child.Dropdown.Option.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    end
                end
            end
        end
    end
    
    print("🎨 Fonts randomized!")
end

-- Start font randomization timer
spawn(function()
    while true do
        wait(20) -- Wait 20 seconds
        randomizeAllFonts()
    end
end)

-- Keybind system
local currentKeybind = Enum.KeyCode.RightShift -- Default keybind
local isUIVisible = true

function FemWare:SetKeybind(keyCode)
    currentKeybind = keyCode
    print("🔑 Keybind set to:", keyCode.Name)
end

function FemWare:ToggleUI()
    isUIVisible = not isUIVisible
    UIContainer.Visible = isUIVisible
    
    -- Horrible UI toggle animation
    if isUIVisible then
        UIContainer.Size = UDim2.new(0, 0, 0, 0)
        UIContainer.Position = UDim2.new(0.5, math.random(-200, 200), 0.5, math.random(-200, 200))
        UIContainer.Rotation = math.random(-360, 360)
        
        local horribleUITween = TweenService:Create(UIContainer,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Size = UDim2.new(0, 868, 0, 455),
                Position = UDim2.new(0.5, 0, 0.5, 0),
                Rotation = 0
            }
        )
        horribleUITween:Play()
    else
        local horribleUIHideTween = TweenService:Create(UIContainer,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Size = UDim2.new(0, 0, 0, 0),
                Position = UDim2.new(0.5, math.random(-200, 200), 0.5, math.random(-200, 200)),
                Rotation = math.random(-360, 360)
            }
        )
        horribleUIHideTween:Play()
    end
    
    print("🎮 UI", isUIVisible and "opened" or "closed")
end

-- Keybind input detection
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    
    if input.KeyCode == currentKeybind then
        FemWare:ToggleUI()
    end
end)

-- Utility functions
local function createUICorner(parent, cornerRadius)
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, cornerRadius or 8)
    corner.Parent = parent
    return corner
end

local function createUIStroke(parent, color, thickness)
    local stroke = Instance.new("UIStroke")
    stroke.Color = color or Color3.fromRGB(0, 0, 0)
    stroke.Thickness = thickness or 1
    stroke.Parent = parent
    return stroke
end

-- Tab system
function FemWare:CreateTab(name)
    local tabButton = Instance.new("ImageLabel")
    tabButton.ScaleType = Enum.ScaleType.Crop
    tabButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabButton.Image = "rbxassetid://111972795775401"
    tabButton.Name = "Tab_" .. name
    tabButton.Size = UDim2.new(0, 176, 0, 42)
    tabButton.BorderSizePixel = 0
    tabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.Parent = Bottom_Bar
    
    createUIStroke(tabButton)
    
    local tabText = Instance.new("TextLabel")
    tabText.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    tabText.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    tabText.Text = name
    tabText.Name = "TabText"
    tabText.TextStrokeTransparency = 0
    tabText.AnchorPoint = Vector2.new(0.5, 0.5)
    tabText.Size = UDim2.new(0, 1, 0, 1)
    tabText.BackgroundTransparency = 1
    tabText.Position = UDim2.new(0.5, 0, 0.5, 0)
    tabText.BorderSizePixel = 0
    tabText.AutomaticSize = Enum.AutomaticSize.XY
    tabText.TextSize = 80
    tabText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tabText.Parent = tabButton
    
    -- Tab content frame
    local tabContent = Instance.new("Frame")
    tabContent.Name = "TabContent"
    tabContent.BackgroundTransparency = 1
    tabContent.Size = UDim2.new(1, 0, 1, 0)
    tabContent.Parent = Container
    
    -- Tab click functionality
    tabButton.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            self:SwitchTab(name)
        end
    end)
    
    tabs[name] = {
        button = tabButton,
        content = tabContent,
        sections = {}
    }
    
    if not currentTab then
        self:SwitchTab(name)
    end
    
    return tabs[name]
end

function FemWare:SwitchTab(tabName)
    if not tabs[tabName] then return end
    
    -- Horrible tab switching animation
    for name, tab in pairs(tabs) do
        if tab.content.Visible then
            -- Horrible exit animation
            local horribleExitTween = TweenService:Create(tab.content, 
                TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
                {
                    Size = UDim2.new(0, 0, 0, 0),
                    Position = UDim2.new(0.5, math.random(-200, 200), 0.5, math.random(-200, 200)),
                    Rotation = math.random(-360, 360),
                    BackgroundTransparency = 1
                }
            )
            horribleExitTween:Play()
            
            horribleExitTween.Completed:Connect(function()
                tab.content.Visible = false
                tab.content.Size = UDim2.new(1, 0, 1, 0)
                tab.content.Position = UDim2.new(0, 0, 0, 0)
                tab.content.Rotation = 0
                tab.content.BackgroundTransparency = 0.85
            end)
        end
        
        -- Horrible button animation
        local horribleButtonTween = TweenService:Create(tab.button,
            TweenInfo.new(HORRIBLE_TIME * 0.8, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Size = UDim2.new(0, math.random(100, 300), 0, math.random(20, 80)),
                Rotation = math.random(-45, 45),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            }
        )
        horribleButtonTween:Play()
    end
    
    -- Horrible entrance animation for selected tab
    wait(0.5) -- Awkward delay
    tabs[tabName].content.Visible = true
    tabs[tabName].content.Size = UDim2.new(0, 0, 0, 0)
    tabs[tabName].content.Position = UDim2.new(0.5, math.random(-300, 300), 0.5, math.random(-300, 300))
    tabs[tabName].content.Rotation = math.random(-180, 180)
    
    local horribleEntranceTween = TweenService:Create(tabs[tabName].content,
        TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
        {
            Size = UDim2.new(1, 0, 1, 0),
            Position = UDim2.new(0, 0, 0, 0),
            Rotation = 0,
            BackgroundTransparency = 0.85
        }
    )
    horribleEntranceTween:Play()
    
    -- Horrible button animation for selected tab
    local horribleSelectedButtonTween = TweenService:Create(tabs[tabName].button,
        TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
        {
            Size = UDim2.new(0, 176, 0, 42),
            Rotation = 0,
            BackgroundColor3 = Color3.fromRGB(0, 255, 81)
        }
    )
    horribleSelectedButtonTween:Play()
    
    currentTab = tabName
end

-- Section system
function FemWare:CreateSection(tabName, sectionName, position)
    if not tabs[tabName] then return end
    
    local section = Instance.new("Frame")
    section.Name = "Section_" .. sectionName
    section.BackgroundTransparency = 0.44999998807907104
    section.Size = UDim2.new(0, 260, 0, 355)
    section.BorderColor3 = Color3.fromRGB(0, 0, 0)
    section.BorderSizePixel = 0
    section.AutomaticSize = Enum.AutomaticSize.Y
    section.BackgroundColor3 = position == "left" and Color3.fromRGB(208, 88, 255) or Color3.fromRGB(227, 14, 255)
    section.Parent = tabs[tabName].content
    
    if position == "right" then
        section.Position = UDim2.new(0.4849023222923279, 0, 0, 0)
    end
    
    createUICorner(section)
    
    local sectionLabel = Instance.new("TextLabel")
    sectionLabel.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    sectionLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    sectionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sectionLabel.Text = sectionName
    sectionLabel.Name = "Section_Label"
    sectionLabel.AnchorPoint = Vector2.new(0.5, 0)
    sectionLabel.Size = UDim2.new(0, 1, 0, 1)
    sectionLabel.BackgroundTransparency = 1
    sectionLabel.Position = UDim2.new(0.5, 0, 0, 0)
    sectionLabel.BorderSizePixel = 0
    sectionLabel.AutomaticSize = Enum.AutomaticSize.XY
    sectionLabel.TextSize = 35
    sectionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sectionLabel.Parent = section
    
    local holder = Instance.new("Frame")
    holder.Name = "Holder"
    holder.BackgroundTransparency = 1
    holder.Position = UDim2.new(0, 0, 0.09859155118465424, 0)
    holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
    holder.Size = UDim2.new(0, 260, 0, 317)
    holder.BorderSizePixel = 0
    holder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    holder.Parent = section
    
    local listLayout = Instance.new("UIListLayout")
    listLayout.SortOrder = Enum.SortOrder.LayoutOrder
    listLayout.Parent = holder
    
    tabs[tabName].sections[sectionName] = {
        frame = section,
        holder = holder
    }
    
    return tabs[tabName].sections[sectionName]
end

-- Toggle component
function FemWare:CreateToggle(section, name, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = "Toggle_" .. name
    toggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggleFrame.Size = UDim2.new(0, 260, 0, 40)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.BackgroundColor3 = Color3.fromRGB(191, 0, 255)
    toggleFrame.Parent = section.holder
    
    local toggle = Instance.new("Frame")
    toggle.AnchorPoint = Vector2.new(0, 0.5)
    toggle.Name = "Toggle"
    toggle.Position = UDim2.new(0, 15, 0.5, 0)
    toggle.BorderColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Size = UDim2.new(0, 25, 0, 25)
    toggle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggle.Parent = toggleFrame
    
    local toggleText = Instance.new("TextLabel")
    toggleText.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    toggleText.TextColor3 = Color3.fromRGB(0, 0, 0)
    toggleText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    toggleText.Text = name
    toggleText.Name = "Toggle_Text"
    toggleText.AnchorPoint = Vector2.new(0.5, 0)
    toggleText.Size = UDim2.new(0, 1, 0, 1)
    toggleText.BackgroundTransparency = 1
    toggleText.Position = UDim2.new(0.5, 0, 0, 0)
    toggleText.BorderSizePixel = 0
    toggleText.AutomaticSize = Enum.AutomaticSize.XY
    toggleText.TextSize = 35
    toggleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggleText.Parent = toggleFrame
    
    local isToggled = false
    
    local function updateToggle()
        if isToggled then
            -- Horrible but functional toggle ON animation
            local horribleToggleOnTween = TweenService:Create(toggle,
                TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
                {
                    BackgroundColor3 = Color3.fromRGB(0, 255, 81),
                    Size = UDim2.new(0, 30, 0, 30),
                    Rotation = math.random(-10, 10)
                }
            )
            horribleToggleOnTween:Play()
            
            local horribleTextOnTween = TweenService:Create(toggleText,
                TweenInfo.new(HORRIBLE_TIME * 0.7, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
                {
                    TextColor3 = Color3.fromRGB(29, 255, 217),
                    TextSize = math.random(30, 40),
                    Rotation = math.random(-5, 5)
                }
            )
            horribleTextOnTween:Play()
        else
            -- Horrible but functional toggle OFF animation
            local horribleToggleOffTween = TweenService:Create(toggle,
                TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
                {
                    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.new(0, 25, 0, 25),
                    Rotation = 0
                }
            )
            horribleToggleOffTween:Play()
            
            local horribleTextOffTween = TweenService:Create(toggleText,
                TweenInfo.new(HORRIBLE_TIME * 0.7, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
                {
                    TextColor3 = Color3.fromRGB(0, 0, 0),
                    TextSize = 35,
                    Rotation = 0
                }
            )
            horribleTextOffTween:Play()
        end
    end
    
    toggleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            isToggled = not isToggled
            updateToggle()
            if callback then callback(isToggled) end
        end
    end)
    
    return {
        frame = toggleFrame,
        toggle = toggle,
        text = toggleText,
        setValue = function(value)
            isToggled = value
            updateToggle()
        end,
        getValue = function()
            return isToggled
        end
    }
end

-- Slider component
function FemWare:CreateSlider(section, name, min, max, default, callback)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Name = "Slider_" .. name
    sliderFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sliderFrame.Size = UDim2.new(0, 260, 0, 40)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.BackgroundColor3 = Color3.fromRGB(191, 0, 255)
    sliderFrame.Parent = section.holder
    
    local progressBar = Instance.new("Frame")
    progressBar.AnchorPoint = Vector2.new(0, 0.5)
    progressBar.Name = "Progress_Bar"
    progressBar.Position = UDim2.new(0, 15, 0.7250000238418579, 0)
    progressBar.BorderColor3 = Color3.fromRGB(255, 255, 255)
    progressBar.Size = UDim2.new(0, 233, 0, 7)
    progressBar.BackgroundColor3 = Color3.fromRGB(0, 255, 81)
    progressBar.Parent = sliderFrame
    
    local sliderText = Instance.new("TextLabel")
    sliderText.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    sliderText.TextColor3 = Color3.fromRGB(29, 255, 217)
    sliderText.BorderColor3 = Color3.fromRGB(0, 0, 0)
    sliderText.Text = name
    sliderText.Name = "Slider_Text"
    sliderText.AnchorPoint = Vector2.new(0.5, 0)
    sliderText.Size = UDim2.new(0, 1, 0, 1)
    sliderText.BackgroundTransparency = 1
    sliderText.Position = UDim2.new(0.32307693362236023, 0, -0.20000000298023224, 0)
    sliderText.BorderSizePixel = 0
    sliderText.AutomaticSize = Enum.AutomaticSize.XY
    sliderText.TextSize = 35
    sliderText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderText.Parent = sliderFrame
    
    local valueLabel = Instance.new("TextLabel")
    valueLabel.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    valueLabel.TextDirection = Enum.TextDirection.RightToLeft
    valueLabel.AnchorPoint = Vector2.new(1, 0.5)
    valueLabel.ZIndex = -25
    valueLabel.TextSize = 35
    valueLabel.Size = UDim2.new(0, 1, 0, 1)
    valueLabel.TextColor3 = Color3.fromRGB(29, 255, 217)
    valueLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    valueLabel.Text = tostring(default)
    valueLabel.Rotation = 156
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(0.9538461565971375, 0, 0.30000001192092896, 0)
    valueLabel.Name = "Value"
    valueLabel.AutomaticSize = Enum.AutomaticSize.XY
    valueLabel.BorderSizePixel = 0
    valueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.Parent = sliderFrame
    
    local currentValue = default
    
    local function updateSlider()
        local percentage = (currentValue - min) / (max - min)
        
        -- Horrible but functional slider animation
        local horribleSliderTween = TweenService:Create(progressBar,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Size = UDim2.new(percentage, 0, 0, 7),
                Position = UDim2.new(0, 15, 0.725, 0),
                Rotation = math.random(-3, 3)
            }
        )
        horribleSliderTween:Play()
        
        -- Horrible but readable value animation
        local horribleValueTween = TweenService:Create(valueLabel,
            TweenInfo.new(HORRIBLE_TIME * 0.8, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Text = tostring(math.floor(currentValue)),
                TextSize = math.random(30, 40),
                Rotation = math.random(-5, 5),
                TextColor3 = Color3.fromRGB(29, 255, 217)
            }
        )
        horribleValueTween:Play()
        
        -- Horrible but readable text animation
        local horribleTextTween = TweenService:Create(sliderText,
            TweenInfo.new(HORRIBLE_TIME * 0.6, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                TextSize = math.random(32, 38),
                Rotation = math.random(-2, 2),
                TextColor3 = Color3.fromRGB(29, 255, 217)
            }
        )
        horribleTextTween:Play()
    end
    
    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            local mouse = Players.LocalPlayer:GetMouse()
            local sliderPos = sliderFrame.AbsolutePosition.X + 15
            local sliderWidth = 233
            local percentage = math.clamp((mouse.X - sliderPos) / sliderWidth, 0, 1)
            currentValue = math.floor(min + (max - min) * percentage)
            updateSlider()
            if callback then callback(currentValue) end
        end
    end)
    
    updateSlider()
    
    return {
        frame = sliderFrame,
        setValue = function(value)
            currentValue = math.clamp(value, min, max)
            updateSlider()
        end,
        getValue = function()
            return currentValue
        end
    }
end

-- Dropdown component
function FemWare:CreateDropdown(section, name, options, callback)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Name = "Dropdown_" .. name
    dropdownFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
    dropdownFrame.Size = UDim2.new(0, 260, 0, 40)
    dropdownFrame.BorderSizePixel = 0
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(191, 0, 255)
    dropdownFrame.Parent = section.holder
    
    local dropdown = Instance.new("Frame")
    dropdown.AnchorPoint = Vector2.new(0, 0.5)
    dropdown.Name = "Dropdown"
    dropdown.Position = UDim2.new(0, 15, 0.48750001192092896, 0)
    dropdown.BorderColor3 = Color3.fromRGB(255, 255, 255)
    dropdown.Size = UDim2.new(0, 233, 0, 30)
    dropdown.BackgroundColor3 = Color3.fromRGB(254, 224, 1)
    dropdown.Parent = dropdownFrame
    
    local optionLabel = Instance.new("TextLabel")
    optionLabel.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
    optionLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    optionLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
    optionLabel.Text = options[1] or "Select Option"
    optionLabel.Name = "Option"
    optionLabel.AnchorPoint = Vector2.new(0.5, 0)
    optionLabel.Size = UDim2.new(0, 1, 0, 1)
    optionLabel.BackgroundTransparency = 1
    optionLabel.Position = UDim2.new(0.5, 0, 0, 0)
    optionLabel.BorderSizePixel = 0
    optionLabel.AutomaticSize = Enum.AutomaticSize.XY
    optionLabel.TextSize = 35
    optionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    optionLabel.Parent = dropdown
    
    local currentOption = options[1]
    local isOpen = false
    
    local function updateDropdown()
        -- Horrible but readable dropdown update animation
        local horribleDropdownTween = TweenService:Create(optionLabel,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Text = currentOption,
                TextSize = math.random(32, 38),
                Rotation = math.random(-5, 5),
                TextColor3 = Color3.fromRGB(0, 0, 0)
            }
        )
        horribleDropdownTween:Play()
        
        -- Horrible but functional dropdown frame animation
        local horribleFrameTween = TweenService:Create(dropdown,
            TweenInfo.new(HORRIBLE_TIME * 0.8, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Size = UDim2.new(0, 233, 0, 30),
                Rotation = math.random(-2, 2),
                BackgroundColor3 = Color3.fromRGB(254, 224, 1)
            }
        )
        horribleFrameTween:Play()
    end
    
    dropdownFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if not isOpen then
                -- Create dropdown options
                local optionsFrame = Instance.new("Frame")
                optionsFrame.Name = "OptionsFrame"
                optionsFrame.BackgroundColor3 = Color3.fromRGB(254, 224, 1)
                optionsFrame.BorderSizePixel = 1
                optionsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
                optionsFrame.Size = UDim2.new(1, 0, 0, #options * 30)
                optionsFrame.Position = UDim2.new(0, 0, 1, 0)
                optionsFrame.Parent = dropdownFrame
                
                createUICorner(optionsFrame)
                
                for i, option in ipairs(options) do
                    local optionButton = Instance.new("TextButton")
                    optionButton.Text = option
                    optionButton.FontFace = Font.new(getRandomFont(), Enum.FontWeight.Regular, Enum.FontStyle.Normal)
                    optionButton.TextColor3 = Color3.fromRGB(0, 0, 0)
                    optionButton.BackgroundColor3 = Color3.fromRGB(254, 224, 1)
                    optionButton.Size = UDim2.new(1, 0, 0, 30)
                    optionButton.Position = UDim2.new(0, 0, 0, (i-1) * 30)
                    optionButton.BorderSizePixel = 0
                    optionButton.TextSize = 35
                    optionButton.Parent = optionsFrame
                    
                    -- Horrible option button entrance animation
                    optionButton.Size = UDim2.new(0, 0, 0, 0)
                    optionButton.Position = UDim2.new(0.5, math.random(-100, 100), 0, (i-1) * 30)
                    optionButton.Rotation = math.random(-180, 180)
                    
                    local horribleOptionTween = TweenService:Create(optionButton,
                        TweenInfo.new(HORRIBLE_TIME * 0.5, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
                        {
                            Size = UDim2.new(1, 0, 0, 30),
                            Position = UDim2.new(0, 0, 0, (i-1) * 30),
                            Rotation = 0,
                            BackgroundColor3 = Color3.fromRGB(math.random(200, 255), math.random(200, 255), math.random(0, 100))
                        }
                    )
                    horribleOptionTween:Play()
                    
                    optionButton.MouseButton1Click:Connect(function()
                        currentOption = option
                        updateDropdown()
                        optionsFrame:Destroy()
                        isOpen = false
                        if callback then callback(currentOption) end
                    end)
                end
                
                isOpen = true
            end
        end
    end)
    
    updateDropdown()
    
    return {
        frame = dropdownFrame,
        setValue = function(value)
            currentOption = value
            updateDropdown()
        end,
        getValue = function()
            return currentOption
        end
    }
end

-- ESP Preview controls
function FemWare:UpdateESPPreview(settings)
    if settings.username ~= nil then
        -- Horrible but readable ESP element animation
        local horribleUsernameTween = TweenService:Create(Username_Esp,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Visible = settings.username,
                TextSize = math.random(30, 40),
                Rotation = math.random(-5, 5),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, 0, 0, -40)
            }
        )
        horribleUsernameTween:Play()
    end
    if settings.distance ~= nil then
        local horribleDistanceTween = TweenService:Create(Distance_Esp,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Visible = settings.distance,
                TextSize = math.random(30, 40),
                Rotation = math.random(-5, 5),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, 0, 0, -75)
            }
        )
        horribleDistanceTween:Play()
    end
    if settings.tool ~= nil then
        local horribleToolTween = TweenService:Create(Tool_Esp,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Visible = settings.tool,
                TextSize = math.random(30, 40),
                Rotation = math.random(-5, 5),
                TextColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0.5, 0, 1, 45)
            }
        )
        horribleToolTween:Play()
    end
    if settings.box ~= nil then
        local horribleBoxTween = TweenService:Create(Box,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Visible = settings.box,
                Size = UDim2.new(0, math.random(90, 110), 0, math.random(190, 210)),
                Rotation = math.random(-3, 3),
                Position = UDim2.new(0.5, 0, 0.5, 0)
            }
        )
        horribleBoxTween:Play()
        
        -- Horrible but functional healthbar animation
        local horribleHealthbarTween = TweenService:Create(Healthbar,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Visible = settings.box,
                Size = UDim2.new(0, 8, 0, 150),
                Rotation = math.random(-5, 5),
                Position = UDim2.new(0, -15, 0.5, 0)
            }
        )
        horribleHealthbarTween:Play()
        
        -- Horrible but readable healthbar fill animation
        local horribleHealthFillTween = TweenService:Create(HealthbarFill,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Size = UDim2.new(1, 0, math.random(0.6, 0.9), 0),
                BackgroundColor3 = Color3.fromRGB(math.random(0, 100), math.random(200, 255), math.random(0, 100))
            }
        )
        horribleHealthFillTween:Play()
        
        -- Horrible but readable health text animation
        local horribleHealthTextTween = TweenService:Create(HealthText,
            TweenInfo.new(HORRIBLE_TIME, HORRIBLE_EASING, HORRIBLE_DIRECTION, HORRIBLE_OVERSHOOT),
            {
                Text = tostring(math.random(50, 100)),
                TextSize = math.random(18, 22),
                Rotation = math.random(-3, 3),
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }
        )
        horribleHealthTextTween:Play()
    end
end

return FemWare
