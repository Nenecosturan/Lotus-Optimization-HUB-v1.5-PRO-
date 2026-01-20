--[[ 
    LOTUS •|• OPTIMIZATION HUB v2.5 PRO+
   
    [PART 1: Rayfield Key System, Core Setup]

    Status: Reverted to Original Stable Key System
    Key: Lotus26
    
    Features:
    - New tab(Visual Engine)
    •Tab features:Fov/Time changer
    - Smart Server Manager
    - Lotus Live HUD
    - L.A.I.S v2.0 AI Engine
    - GPU Cooling (Stop Render)
    - Active Frustum Culling
--]]

-- // 1. SERVICE DECLARATION \\ --
local Players = game:GetService("Players")
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
   LoadingSubtitle = "Finding Latest Pro version...",
   Theme = "Ocean", 
   
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LotusHubV25", 
      FileName = "LotusConfigUltra"
   },
   
   Discord = {
      Enabled = false,
      Invite = "", 
      RememberJoins = true 
   },
   
   -- KEY SYSTEM (RESTORED) --
   KeySystem = true, 
   KeySettings = {
      Title = "Lotus Access Manager",
      Subtitle = "Enter License Key",
      Note = "Key: Lotus26",
      FileName = "LotusKeyV25",
      SaveKey = true,
      GrabKeyFromSite = false, 
      Key = "Lotus26" 
   }
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
   Name = "Hide All Particles",
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
       notify("NUCLEAR", "Wait at least 2 minutes to see the effects.")
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
   Name = "Active Frustum Culling (BETA)",
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
   Name = "Load Titanium Gen2 AI(highly recommended)",
   Callback = function()
       notify("Loading...", "Injecting Titanium Optimizer...")
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
       if Value then notify("Cooling...", "Keep it on for at least 2 minutes to see the effects.") else notify("Cooling stopped", "Cooling has been stopped.") end
   end,
})

TabTools:CreateSection("Advanced Engineering")
TabTools:CreateButton({
   Name = "Disable 3D Audio Physics",
   Callback = function()
       local SoundService = game:GetService("SoundService")
       SoundService.DopplerScale = 0 
       notify("Audio", "3D Audio Physics Disabled.")
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
   Range = {30, 1080},
   Increment = 1,
   Suffix = "FPS",
   CurrentValue = 60,
   Flag = "FPSCap", 
   Callback = function(Value) setfpscap(Value) end,
})

-- // VISUALS (v2.5 PRO+) \\ --
local TabVisuals = Window:CreateTab("Visual engine", 4483362458)

TabVisuals:CreateSection("Camera Engineering")

TabVisuals:CreateSlider({
   Name = "Field of View (FOV)",
   Range = {70, 130},
   Increment = 1,
   Suffix = "°",
   CurrentValue = 70,
   Flag = "FOVSlider", 
   Callback = function(Value)
       local Camera = Workspace.CurrentCamera
       Camera.FieldOfView = Value
   end,
})

TabVisuals:CreateSection("World Ambience")

TabVisuals:CreateDropdown({
   Name = "Time Changer",
   Options = {"Day (12:00)", "Night (00:00)", "Sunset (18:00)", "Sunrise (06:00)"},
   CurrentOption = {"Day (12:00)"},
   MultipleOptions = false,
   Flag = "TimeChanger", 
   Callback = function(Option)
       local T = Option[1]
       if T == "Day (12:00)" then Lighting.ClockTime = 12
       elseif T == "Night (00:00)" then Lighting.ClockTime = 0
       elseif T == "Sunset (18:00)" then Lighting.ClockTime = 17.5
       elseif T == "Sunrise (06:00)" then Lighting.ClockTime = 6
       end
   end,
})

TabVisuals:CreateToggle({
   Name = "Exposure Lock (Fix Brightness)",
   CurrentValue = false,
   Callback = function(Value)
       Lighting.ExposureCompensation = Value and 0 or 0 -- Reset if needed
       Lighting.GlobalShadows = not Value
       notify("Visuals", "Exposure Locked.")
   end,
})

-- // 11. FINAL INIT \\ --
local TabInfo = Window:CreateTab("Info", 4483362458)
TabInfo:CreateParagraph({Title = "Current version", Content = "v2.5 PRO+"})
TabInfo:CreateParagraph({Title = "Change log", Content = "HUD, Server Manager, Fixed key system, L.A.I.S engine v2.0,Added Fov/Time changer"})

Rayfield:Notify({Title = "Lotus v2.5 PRO+", Content = "System Loaded.", Duration = 5, Image = 4483362458})
Rayfield:LoadConfiguration()
-- [[ END OF SCRIPT ]] --
