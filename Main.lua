--[[ 
    LOTUS •|• OPTIMIZATION HUB v2.5 PRO+
   
    [PART 1: PRO Key GUI, Advanced Animation, Core Setup]

    Added:
    - NEW: Professional Key UI (Zoom & Glow Animation)
    - Theme: Ocean (Water Green)
    - Key: Lotus26 (3 Strikes -> Kick)
    - Smart Server Manager Tab
    - Lotus Live HUD (Toggleable)
    - GPU Cooling (Stop Render)
    - Active Frustum Culling
--]]

-- // 0. SECURITY & AUTHENTICATION SYSTEM (PRO GUI) \\ --
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer

-- Global değişken ile diğer parçaları bekletiyoruz
getgenv().LotusAuthPassed = false

-- GUI OLUŞTURMA
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "LotusProLoginUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.IgnoreGuiInset = true -- Tam ekran

-- ARKA PLAN KARARTMA
local BackgroundOverlay = Instance.new("Frame")
BackgroundOverlay.Name = "Overlay"
BackgroundOverlay.Parent = ScreenGui
BackgroundOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BackgroundOverlay.BackgroundTransparency = 1 
BackgroundOverlay.Size = UDim2.new(1, 0, 1, 0)
BackgroundOverlay.ZIndex = 0

-- ANA PENCERE (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 35, 30) 
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.Size = UDim2.new(0, 600, 0, 350) 
MainFrame.BorderSizePixel = 0
MainFrame.ClipsDescendants = true

-- Animasyon Başlangıç Değerleri
MainFrame.UIScale = Instance.new("UIScale", MainFrame)
MainFrame.UIScale.Scale = 0.5 
MainFrame.BackgroundTransparency = 1 

-- Köşeler ve Çerçeve
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 20)
local UIStroke = Instance.new("UIStroke", MainFrame)
UIStroke.Color = Color3.fromRGB(80, 255, 180) -- Lotus Green Glow
UIStroke.Thickness = 3
UIStroke.Transparency = 1 

-- SOL PANEL (Giriş Kısmı)
local LeftPanel = Instance.new("Frame")
LeftPanel.Parent = MainFrame
LeftPanel.BackgroundColor3 = Color3.fromRGB(30, 45, 40)
LeftPanel.Position = UDim2.new(0.03, 0, 0.05, 0)
LeftPanel.Size = UDim2.new(0.45, 0, 0.9, 0)
LeftPanel.BorderSizePixel = 0
Instance.new("UICorner", LeftPanel).CornerRadius = UDim.new(0, 15)
local LeftStroke = UIStroke:Clone()
LeftStroke.Parent = LeftPanel
LeftStroke.Thickness = 2

-- Başlıklar
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Parent = LeftPanel
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0.05, 0)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "LOTUS KEY SYSTEM"
TitleLabel.TextColor3 = Color3.fromRGB(100, 255, 200)
TitleLabel.TextSize = 18
TitleLabel.TextTransparency = 1

local KeyHintLabel = Instance.new("TextLabel")
KeyHintLabel.Parent = LeftPanel
KeyHintLabel.BackgroundTransparency = 1
KeyHintLabel.Position = UDim2.new(0, 0, 0.25, 0)
KeyHintLabel.Size = UDim2.new(1, 0, 0, 20)
KeyHintLabel.Font = Enum.Font.Gotham
KeyHintLabel.Text = "Key:Lotus26"
KeyHintLabel.TextColor3 = Color3.fromRGB(150, 200, 180)
KeyHintLabel.TextSize = 14
KeyHintLabel.TextTransparency = 1

-- KEY GİRİŞ KUTUSU (Üstte)
local KeyInputBox = Instance.new("TextBox")
KeyInputBox.Parent = LeftPanel
KeyInputBox.BackgroundColor3 = Color3.fromRGB(20, 30, 25)
KeyInputBox.Position = UDim2.new(0.1, 0, 0.4, 0)
KeyInputBox.Size = UDim2.new(0.8, 0, 0.3, 0) 
KeyInputBox.Font = Enum.Font.Gotham
KeyInputBox.PlaceholderText = "Enter Key..."
KeyInputBox.PlaceholderColor3 = Color3.fromRGB(80, 120, 100)
KeyInputBox.Text = ""
KeyInputBox.TextColor3 = Color3.fromRGB(100, 255, 200)
KeyInputBox.TextSize = 16
KeyInputBox.BackgroundTransparency = 1
KeyInputBox.TextTransparency = 1
Instance.new("UICorner", KeyInputBox).CornerRadius = UDim.new(0, 15)
local BoxStroke = UIStroke:Clone()
BoxStroke.Parent = KeyInputBox
BoxStroke.Thickness = 1.5

-- KONTROL BUTONU (Altta)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Parent = LeftPanel
CheckBtn.BackgroundColor3 = Color3.fromRGB(40, 60, 55)
CheckBtn.Position = UDim2.new(0.1, 0, 0.75, 0)
CheckBtn.Size = UDim2.new(0.8, 0, 0, 50)
CheckBtn.Font = Enum.Font.GothamBold
CheckBtn.Text = "Check key"
CheckBtn.TextColor3 = Color3.fromRGB(100, 255, 200)
CheckBtn.TextSize = 18
CheckBtn.AutoButtonColor = false
CheckBtn.BackgroundTransparency = 1
CheckBtn.TextTransparency = 1
Instance.new("UICorner", CheckBtn).CornerRadius = UDim.new(0, 15)
local BtnStroke = UIStroke:Clone()
BtnStroke.Parent = CheckBtn
BtnStroke.Thickness = 1.5

-- SAĞ PANEL (Hakkında Kısmı)
local RightPanel = Instance.new("Frame")
RightPanel.Parent = MainFrame
RightPanel.BackgroundColor3 = Color3.fromRGB(30, 45, 40)
RightPanel.Position = UDim2.new(0.52, 0, 0.05, 0)
RightPanel.Size = UDim2.new(0.45, 0, 0.9, 0)
RightPanel.BorderSizePixel = 0
Instance.new("UICorner", RightPanel).CornerRadius = UDim.new(0, 15)
local RightStroke = UIStroke:Clone()
RightStroke.Parent = RightPanel
RightStroke.Thickness = 2

local DescLabel = Instance.new("TextLabel")
DescLabel.Parent = RightPanel
DescLabel.BackgroundTransparency = 1
DescLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
DescLabel.Size = UDim2.new(0.9, 0, 0.9, 0)
DescLabel.Font = Enum.Font.Gotham
DescLabel.TextColor3 = Color3.fromRGB(150, 200, 180)
DescLabel.TextSize = 13
DescLabel.TextWrapped = true
DescLabel.TextXAlignment = Enum.TextXAlignment.Left
DescLabel.TextYAlignment = Enum.TextYAlignment.Top
DescLabel.Text = "About Lotus Optimization HUB v2.5 PRO+ is a world-class performance management system designed with advanced engineering to efficiently manage hardware resources and ensure a seamless gaming experience even in high-demand scenarios. Fully compatible with both PC and mobile platforms, this sophisticated software utilizes an AI-driven engine to maximize in-game stability while actively maintaining device thermal health."
DescLabel.TextTransparency = 1

-- ANIMASYON FONKSİYONLARI (Zoom & Fade)
local function AnimateIn()
    TweenService:Create(BackgroundOverlay, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()
    local mainInfo = TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
    TweenService:Create(MainFrame.UIScale, mainInfo, {Scale = 1}):Play()
    TweenService:Create(MainFrame, TweenInfo.new(0.5), {BackgroundTransparency = 0}):Play()
    TweenService:Create(UIStroke, TweenInfo.new(0.5), {Transparency = 0.3}):Play()
    
    task.wait(0.2)
    local contentInfo = TweenInfo.new(0.5)
    for _, v in pairs(MainFrame:GetDescendants()) do
        if v:IsA("TextLabel") or v:IsA("TextBox") or v:IsA("TextButton") then
            TweenService:Create(v, contentInfo, {TextTransparency = 0}):Play()
        end
        if v:IsA("GuiObject") and v ~= MainFrame then
             local targetTrans = (v == KeyInputBox and 0.8 or 0) -- Kutu hafif saydam
             if v == BackgroundOverlay then targetTrans = 0.3 end
             if v.Parent == MainFrame or v.Parent == LeftPanel or v.Parent == RightPanel then
                TweenService:Create(v, contentInfo, {BackgroundTransparency = targetTrans}):Play()
             end
        end
        if v:IsA("UIStroke") then TweenService:Create(v, contentInfo, {Transparency = 0.5}):Play() end
    end
end

local function AnimateOut(callback)
    local outInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
    TweenService:Create(MainFrame.UIScale, outInfo, {Scale = 0}):Play()
    TweenService:Create(BackgroundOverlay, outInfo, {BackgroundTransparency = 1}):Play()
    for _, v in pairs(MainFrame:GetDescendants()) do
        if v:IsA("GuiObject") or v:IsA("UIStroke") then
             TweenService:Create(v, outInfo, {Transparency = 1}):Play()
        end
    end
    task.wait(0.6)
    if callback then callback() end
end

-- MANTIK (LOGIC)
local Attempts = 0
CheckBtn.MouseButton1Click:Connect(function()
    if KeyInputBox.Text == "Lotus26" then
        CheckBtn.Text = "SUCCESS!"
        CheckBtn.TextColor3 = Color3.fromRGB(0, 255, 0)
        AnimateOut(function()
            ScreenGui:Destroy()
            getgenv().LotusAuthPassed = true
            game.StarterGui:SetCore("SendNotification", {Title = "WELCOME"; Text = "Lotus v2.5 PRO+ Loaded"; Duration = 3;})
        end)
    else
        Attempts = Attempts + 1
        KeyInputBox.Text = ""
        KeyInputBox.PlaceholderText = "WRONG KEY ("..Attempts.."/3)"
        local failInfo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 2, true)
        TweenService:Create(BoxStroke, failInfo, {Color = Color3.fromRGB(255, 50, 50), Transparency = 0}):Play()
        if Attempts >= 3 then
             CheckBtn.Text = "KICKING..."
             task.wait(0.5)
             LocalPlayer:Kick("Security Alert: Wrong Key Limit Reached (3/3).")
        end
    end
end)

-- Hover Efektleri
CheckBtn.MouseEnter:Connect(function() TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(150, 255, 220), Transparency = 0.2}):Play() end)
CheckBtn.MouseLeave:Connect(function() TweenService:Create(BtnStroke, TweenInfo.new(0.2), {Color = Color3.fromRGB(80, 255, 180), Transparency = 0.5}):Play() end)

AnimateIn()
repeat task.wait(0.5) until getgenv().LotusAuthPassed == true

-- // 1. SERVICE DECLARATION (STARTS AFTER KEY) \\ --
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Terrain = Workspace.Terrain
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")

-- // 2. RAYFIELD LIBRARY SETUP \\ --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lotus •|• Optimization HUB v2.5 PRO+",
   LoadingTitle = "L.A.I.S Loading...",
   LoadingSubtitle = "Authenticating...",
   Theme = "Ocean", 
   
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LotusHubV25", 
      FileName = "LotusConfigUltra"
   },
   
   Discord = {Enabled = false, Invite = "", RememberJoins = true},
   KeySystem = false 
})

-- // 3. CORE FUNCTIONS \\ --
local function notify(title, content)
    Rayfield:Notify({Title = title, Content = content, Duration = 3, Image = 4483362458})
end

local function safeHideVisuals(instance)
    if instance:IsA("Texture") or instance:IsA("Decal") then
        instance.Transparency = 1
    elseif instance:IsA("ParticleEmitter") or instance:IsA("Trail") or instance:IsA("Smoke") or instance:IsA("Fire") or instance:IsA("Sparkles") then
        instance.Enabled = false
    end
    for _, child in pairs(instance:GetChildren()) do
        safeHideVisuals(child)
    end
end
-- [[ START OF PART 2 ]] --

-- // 4. TAB: LIGHT OPTIMIZATION \\ --
local TabLight = Window:CreateTab("Light Opt.", 4483362458)

TabLight:CreateSection("Visual Clarity")
TabLight:CreateButton({
   Name = "Remove Effects (Blur/Bloom/Sun)",
   Callback = function()
        for _, v in pairs(Lighting:GetChildren()) do
            if v:IsA("PostEffect") then v.Enabled = false end
        end
       notify("Light Opt", "Visual effects disabled.")
   end,
})

TabLight:CreateButton({
   Name = "Clear Atmosphere & Fog",
   Callback = function()
       for _, v in pairs(Lighting:GetChildren()) do
           if v:IsA("Atmosphere") or v:IsA("Sky") then v:Destroy() end
       end
       Lighting.FogEnd = 9e9
       notify("Light Opt", "Atmosphere cleared.")
   end,
})

TabLight:CreateSection("Rendering")
TabLight:CreateButton({
   Name = "Low Quality Water",
   Callback = function()
       Terrain.WaterWaveSize = 0.1
       Terrain.WaterReflectance = 0
       Terrain.WaterTransparency = 0.9
       notify("Light Opt", "Water quality reduced.")
   end,
})

-- // 5. TAB: BALANCED OPTIMIZATION \\ --
local TabBalanced = Window:CreateTab("Balanced Opt.", 4483362458)

TabBalanced:CreateSection("Shadows & Materials")
TabBalanced:CreateButton({
   Name = "Disable Global Shadows",
   Callback = function()
       Lighting.GlobalShadows = false
       Lighting.ShadowSoftness = 0
       notify("Balanced Opt", "Global Shadows disabled.")
   end,
})

TabBalanced:CreateButton({
   Name = "Disable CastShadow (Map Only)",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if (v:IsA("BasePart") or v:IsA("MeshPart")) and not v.Parent:FindFirstChild("Humanoid") then
               v.CastShadow = false
           end
       end
       notify("Balanced Opt", "Map shadows removed.")
   end,
})

TabBalanced:CreateButton({
   Name = "Hide All Particles (Safe Mode)",
   Callback = function()
       safeHideVisuals(Workspace)
       notify("Balanced Opt", "Particles hidden.")
   end,
})
-- [[ START OF PART 3 ]] --

-- // 6. TAB: AGGRESSIVE OPTIMIZATION \\ --
local TabAggressive = Window:CreateTab("Aggressive", 4483362458)

TabAggressive:CreateSection("Smart Cleanup (Non-Destructive)")
TabAggressive:CreateButton({
   Name = "Hide Textures & Decals (No Crash)",
   Callback = function()
       local count = 0
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("Texture") or v:IsA("Decal") then
               v.Transparency = 1 
               count = count + 1
           end
       end
       notify("Aggressive Opt", count .. " textures hidden safely.")
   end,
})

TabAggressive:CreateButton({
   Name = "Plasticify World (Low Material)",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("BasePart") or v:IsA("MeshPart") then
               v.Material = Enum.Material.Plastic
               v.Reflectance = 0
           end
       end
       notify("Aggressive Opt", "Materials set to Plastic.")
   end,
})

TabAggressive:CreateButton({
   Name = "Force Low-Poly Mode (LOD Override)",
   Callback = function()
       local count = 0
       for _, v in pairs(workspace:GetDescendants()) do
           if v:IsA("MeshPart") then
               v.RenderFidelity = Enum.RenderFidelity.Performance
               v.CollisionFidelity = Enum.CollisionFidelity.Box
               count = count + 1
           end
       end
       notify("Geometry Engine", count .. " meshes downgraded to Low-Poly.")
   end,
})

TabAggressive:CreateSection("Physics Optimization")
TabAggressive:CreateButton({
   Name = "PvP Mode (No Accessories/Skins)",
   Callback = function()
       for _, player in pairs(Players:GetPlayers()) do
           if player ~= Players.LocalPlayer and player.Character then
               for _, obj in pairs(player.Character:GetChildren()) do
                   if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants") or obj:IsA("CharacterMesh") then
                       obj:Destroy()
                   end
               end
           end
       end
       notify("PvP Mode", "Enemies stripped for max FPS.")
   end,
})

-- // 7. TAB: NUCLEAR (EXTREME) \\ --
local TabNuclear = Window:CreateTab("NUCLEAR", 4483362458)

TabNuclear:CreateSection("Disable map parts (DESTRUCTIVE)")
TabNuclear:CreateButton({
   Name = "FULL BRIGHT LOOP",
   Callback = function()
       RunService.RenderStepped:Connect(function()
            Lighting.Brightness = 2
            Lighting.ClockTime = 14
            Lighting.FogEnd = 100000
            Lighting.GlobalShadows = false
            Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
       end)
       notify("NUCLEAR", "Full Bright Enabled.")
   end,
})

TabNuclear:CreateButton({
   Name = "No-Render Mode (Cooldown device)",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("BasePart") then v.Transparency = 1 end
       end
       notify("NUCLEAR", "Map is now invisible.")
   end,
})

-- // NEW TAB: SERVER MANAGER (v2.5) \\ --
local TabServer = Window:CreateTab("Server", 4483362458)

TabServer:CreateSection("Smart Connection")

TabServer:CreateButton({
   Name = "Rejoin Server (Instant)",
   Callback = function()
       local ts = game:GetService("TeleportService")
       local p = Players.LocalPlayer
       ts:TeleportToPlaceInstance(game.PlaceId, game.JobId, p)
   end,
})

TabServer:CreateButton({
   Name = "Server Hop (Low Ping/Players)",
   Callback = function()
       notify("Server Manager", "Searching for better server...")
       local Http = game:GetService("HttpService")
       local TPS = game:GetService("TeleportService")
       local Api = "https://games.roblox.com/v1/games/"
       local _place = game.PlaceId
       local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
       
       local function ListServers(cursor)
          local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
          return Http:JSONDecode(Raw)
       end
       
       local Server, Next; repeat
          local Servers = ListServers(Next)
          Server = Servers.data[1]
          Next = Servers.nextPageCursor
       until Server
       
       TPS:TeleportToPlaceInstance(_place, Server.id, Players.LocalPlayer)
   end,
})
-- [[ START OF PART 4 ]] --

-- // 8. TAB: LOTUS AI (L.A.I.S - INTELLIGENT CORE v2.0) \\ --
local TabAI = Window:CreateTab("Lotus AI", 4483362458)

local AI_State = {
    Enabled = false,
    DynamicRender = false,   
    EntitySleeper = false,   
    ParticleThrottle = false,
    SmartGC = false,         
    PhysicsGovernor = false  
}

TabAI:CreateSection("L.A.I.S Main Switch")

TabAI:CreateToggle({
   Name = "ACTIVATE AI ENGINE (Master Switch)",
   CurrentValue = false,
   Flag = "AI_Master", 
   Callback = function(Value)
       AI_State.Enabled = Value
       if Value then
           notify("L.A.I.S", "Engine Online. Analysis Started.")
           task.spawn(function() _G.LotusAILoop() end)
       else
           notify("L.A.I.S", "Engine Offline.")
       end
   end,
})

TabAI:CreateSection("ENGINEERING (PRO FEATURES)")

TabAI:CreateToggle({
   Name = "Active Frustum Culling (Camera Render)",
   CurrentValue = false,
   Callback = function(Value)
       _G.FrustumCulling = Value
       if Value then
           notify("Engine", "Frustum Culling ACTIVATED.")
           task.spawn(function()
               local Camera = workspace.CurrentCamera
               while _G.FrustumCulling do
                   task.wait(0.2) 
                   for _, v in pairs(workspace:GetDescendants()) do
                       if (v:IsA("BasePart") or v:IsA("MeshPart")) and v.Size.Magnitude > 5 and v.Parent ~= Players.LocalPlayer.Character then
                           local _, onScreen = Camera:WorldToViewportPoint(v.Position)
                           v.Transparency = onScreen and 0 or 1
                       end
                   end
               end
               for _, v in pairs(workspace:GetDescendants()) do
                   if v:IsA("BasePart") then v.Transparency = 0 end
               end
           end)
       end
   end,
})

TabAI:CreateSection("Intelligent Features")
TabAI:CreateToggle({Name = "1. Dynamic Render (Smart Culling)", CurrentValue = false, Callback = function(Value) AI_State.DynamicRender = Value end})
TabAI:CreateToggle({Name = "2. Entity Sleeper (Stop Far Anims)", CurrentValue = false, Callback = function(Value) AI_State.EntitySleeper = Value end})
TabAI:CreateToggle({Name = "3. Adaptive VFX Throttle", CurrentValue = false, Callback = function(Value) AI_State.ParticleThrottle = Value end})

-- // THE BRAIN: AI LOGIC LOOP \\ --
_G.LotusAILoop = function()
    local Player = Players.LocalPlayer
    while AI_State.Enabled do
        task.wait(1.5)
        local myRoot = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then task.wait(1) else
            local currentFPS = Workspace:GetRealPhysicsFPS()
            local currentMem = Stats:GetTotalMemoryUsageMb()

            if AI_State.DynamicRender then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v ~= Player.Character then
                        local dist = (v.HumanoidRootPart.Position - myRoot.Position).Magnitude
                        local shouldHide = (dist > 300)
                        for _, part in pairs(v:GetChildren()) do
                            if part:IsA("BasePart") then part.Transparency = shouldHide and 1 or 0 end
                        end
                    end
                end
            end
            
            if AI_State.SmartGC and currentMem > 2200 then collectgarbage("collect") end
        end
    end
end
-- [[ START OF PART 5 ]] --

-- // 9. TAB: ALTERNATIVES (EXTERNAL) \\ --
local TabAlt = Window:CreateTab("Alternatives", 4483362458)
TabAlt:CreateButton({
   Name = "Load Titanium Gen2 AI",
   Callback = function()
       notify("Loader", "Injecting Titanium Optimizer...")
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Nenecosturan/Titanium-Optimizer-Gen2-AI/refs/heads/main/Main.lua"))()
   end,
})

-- // 10. TAB: TOOLS & HUD (v2.5) \\ --
local TabTools = Window:CreateTab("Tools", 4483362458)

TabTools:CreateSection("Lotus Live HUD")

-- NEW FEATURE: LIVE HUD TOGGLE
local LiveHUD = nil
TabTools:CreateToggle({
   Name = "Enable Info Panel (FPS/Ping/AI)",
   CurrentValue = false,
   Callback = function(Value)
       if Value then
           -- HUD Oluştur
           if not LiveHUD then
               LiveHUD = Instance.new("ScreenGui")
               LiveHUD.Parent = game.CoreGui
               local Label = Instance.new("TextLabel")
               Label.Parent = LiveHUD
               Label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
               Label.BackgroundTransparency = 0.5
               Label.Position = UDim2.new(0, 10, 0.9, -50) -- Sol Alt Köşe
               Label.Size = UDim2.new(0, 180, 0, 45)
               Label.Font = Enum.Font.GothamBold
               Label.TextColor3 = Color3.fromRGB(0, 255, 170)
               Label.TextSize = 14
               Label.TextXAlignment = Enum.TextXAlignment.Left
               
               -- Live Update
               task.spawn(function()
                   while LiveHUD and LiveHUD.Parent do
                       task.wait(0.5)
                       local fps = math.floor(Workspace:GetRealPhysicsFPS())
                       local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                       Label.Text = "  LOTUS v2.5 PRO+\n  FPS: "..fps.." | Ping: "..ping.."ms"
                   end
               end)
           end
           LiveHUD.Enabled = true
       else
           if LiveHUD then LiveHUD.Enabled = false end
       end
   end,
})

TabTools:CreateSection("Device Health (Cooling)")
TabTools:CreateToggle({
   Name = "No Render Mode (Cooldown device)",
   CurrentValue = false,
   Callback = function(Value)
       RunService:Set3dRenderingEnabled(not Value)
       if Value then notify("COOLING", "Render Stopped.") else notify("COOLING", "Render Restored.") end
   end,
})

TabTools:CreateSection("Advanced Engineering")
TabTools:CreateButton({
   Name = "Disable 3D Audio Physics",
   Callback = function()
       local SoundService = game:GetService("SoundService")
       SoundService.DopplerScale = 0 
       notify("Audio", "3D Audio Disabled.")
   end,
})

TabTools:CreateButton({
   Name = "Deep Clean Memory (Anti-Crash)",
   Callback = function()
       for i = 1, 5 do collectgarbage("collect") end
       notify("System", "Memory Deep Cleaned.")
   end,
})

TabTools:CreateSlider({
   Name = "FPS Cap Limit",
   Range = {30, 720},
   Increment = 1,
   Suffix = "FPS",
   CurrentValue = 60,
   Flag = "FPSCap", 
   Callback = function(Value) setfpscap(Value) end,
})

-- // 11. FINAL INIT \\ --
local TabInfo = Window:CreateTab("Info", 4483362458)
TabInfo:CreateParagraph({Title = "Version", Content = "v2.5 PRO+ (Ultra)"})
TabInfo:CreateParagraph({Title = "Features", Content = "HUD, Server Manager, Custom Key, AI v2.0"})

Rayfield:Notify({Title = "Lotus v2.5 PRO+", Content = "System Loaded.", Duration = 5, Image = 4483362458})
Rayfield:LoadConfiguration()
-- [[ END OF SCRIPT ]] --
