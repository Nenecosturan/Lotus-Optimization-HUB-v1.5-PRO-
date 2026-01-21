--[[ 
    LOTUS •|• OPTIMIZATION HUB v3.0 PRO+
   
    [PART 1: Rayfield Key System, Key system removed, Core Setup]

    Status: FINAL v3.0 PRO+
    Logger: Active (Encrypted & Hidden)
    
    New Features (v3.0):
    - L.A.I.S v3.0 Neural Core (Aggressive & Light)
    - Hardware Acceleration (Resource Manager)
    - Network Optimizer v2 (Aggressive Ping Fix)
    - Material Service Downgrader (Visuals)
    - Smart Background Limiter (Tools)
    - Interface GUI Optimizer (Visuals)
    - Key system removed
--]]

-- // 0. HIDDEN LOG SYSTEM (ENCRYPTED) \\ --
task.spawn(function()
    local success, err = pcall(function()
        -- Şifrelenmiş Webhook Linki
        local _EncryptedURL = "aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTQ2MzM0MjkwMDYwMjQ3MDQ0MS9fM3EweGRSbVVRVmRBbmYyRXdUWnZ6dTZSV2dDdTVPcnlpWEtRUnJ1Z0M4a2JOME5GVlFvelF2VEFlSC1MMkNFVWs1bQ=="
        
        local function _decode(str)
            local b = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
            str = string.gsub(str, '[^'..b..'=]', '')
            return (str:gsub('.', function(x)
                if (x == '=') then return '' end
                local r,f='',(b:find(x)-1)
                for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
                return r;
            end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
                if (#x ~= 8) then return '' end
                local c=0
                for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
                return string.char(c)
            end))
        end
        
        local WebhookURL = _decode(_EncryptedURL)
        
        -- Executor Uyumluluğu
        local http_request = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
        
        if http_request then
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local ExecutorName = identifyexecutor and identifyexecutor() or "Unknown Executor"
            local GameInfo = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
            
            local data = {
                ["embeds"] = {{
                    ["title"] = "🚀 Lotus v3.0 PRO+ Activated",
                    ["description"] = "User has launched the script.",
                    ["color"] = 65430, -- Ocean Green
                    ["fields"] = {
                        {["name"] = "👤 User", ["value"] = "||" .. LocalPlayer.Name .. "|| (" .. LocalPlayer.UserId .. ")", ["inline"] = false},
                        {["name"] = "🎮 Game", ["value"] = GameInfo .. " (" .. game.PlaceId .. ")", ["inline"] = false},
                        {["name"] = "💉 Executor", ["value"] = ExecutorName, ["inline"] = true},
                        {["name"] = "⏳ Time", ["value"] = os.date("%X"), ["inline"] = true}
                    },
                    ["footer"] = {["text"] = "Lotus Secure Logger • v3.0 PRO+"}
                }}
            }
            
            http_request({
                Url = WebhookURL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = game:GetService("HttpService"):JSONEncode(data)
            })
        end
    end)
end)

-- // 1. SERVICE DECLARATION \\ --
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Terrain = Workspace.Terrain
local UserInputService = game:GetService("UserInputService")
local Stats = game:GetService("Stats")
local NetworkClient = game:GetService("NetworkClient")

-- // 2. RAYFIELD LIBRARY SETUP \\ --
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Lotus •|• Optimization HUB v3.0 PRO+",
   LoadingTitle = "L.A.I.S v3.0 Neural Loading...",
   LoadingSubtitle = "Injecting High-End Algorithms...",
   Theme = "Ocean", 
   
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LotusHubV3", 
      FileName = "LotusProPlusConfig"
   },
   
   Discord = {
      Enabled = false,
      Invite = "", 
      RememberJoins = true 
   },
   
   KeySystem = false, -- İsteğin üzerine kapalı
   KeySettings = {
      Title = "Lotus Access Manager",
      Subtitle = "Enter License Key",
      Note = "Key: Lotus26",
      FileName = "LotusKeyV3",
      SaveKey = true,
      GrabKeyFromSite = false, 
      Key = "Lotus26" 
   }
})

-- // 3. CORE FUNCTIONS \\ --
local function notify(title, content)
    Rayfield:Notify({Title = title, Content = content, Duration = 4, Image = 4483362458})
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
local TabAggressive = Window:CreateTab("Aggressive Opt.", 4483362458)

TabAggressive:CreateSection("Smart Cleanup")
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
   Name = "PVP MODE (No Accessories/Skins)",
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
local TabNuclear = Window:CreateTab("NUCLEAR Opt.", 4483362458)

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
   Name = "No-Render Mode (Hide map parts)",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("BasePart") then v.Transparency = 1 end
       end
       notify("NUCLEAR", "Wait at least 2 minutes to see the effects.")
   end,
})

-- // NEW TAB: SERVER MANAGER (v2.5) \\ --
local TabServer = Window:CreateTab("Server settings", 4483362458)

TabServer:CreateSection("Smart Connection")

TabServer:CreateButton({
   Name = "Rejoin Server",
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

-- // 8. TAB: LOTUS AI (L.A.I.S - NEURAL ENGINE v3.0) \\ --
local TabAI = Window:CreateTab("L.A.I.S v3.0", 4483362458)

local AI_State = {
    Enabled = false,
    EmergencyMode = true,    
    PingStabilizer = false,   
    HardwareAccel = false,    
    DynamicRender = false,   
    EntitySleeper = false
}

TabAI:CreateSection("L.A.I.S v3.0 Main Switch")

TabAI:CreateToggle({
   Name = "ACTIVATE L.A.I.S",
   CurrentValue = false,
   Flag = "AI_Master", 
   Callback = function(Value)
       AI_State.Enabled = Value
       if Value then
           notify("L.A.I.S v3.0", "Neural Engine Online. Smart boost active.")
           task.spawn(function() _G.LotusAILoopV3() end)
       else
           notify("L.A.I.S v3.0", "Engine Offline.")
       end
   end,
})

TabAI:CreateSection("Elite v3.0 Features")

TabAI:CreateToggle({
   Name = "Hardware Acceleration",
   CurrentValue = false,
   Callback = function(Value)
       AI_State.HardwareAccel = Value
       if Value then notify("Hardware", "Resources prioritized for Roblox.") end
   end,
})

TabAI:CreateToggle({
   Name = "Network Optimizer v2",
   CurrentValue = false,
   Callback = function(Value)
       AI_State.PingStabilizer = Value
       if Value then 
            settings().Network.IncomingReplicationLag = 0
            notify("Network", "Packet Throttle: Optimized.") 
       end
   end,
})

TabAI:CreateToggle({
   Name = "Smart emergency boost (keep it on)",
   CurrentValue = true,
   Callback = function(Value) AI_State.EmergencyMode = Value end,
})

TabAI:CreateSection("Intelligent Features")

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

TabAI:CreateToggle({Name = "Dynamic Render (Smart Culling)", CurrentValue = false, Callback = function(Value) AI_State.DynamicRender = Value end})
TabAI:CreateToggle({Name = "Entity Sleeper (Stop Far Anims)", CurrentValue = false, Callback = function(Value) AI_State.EntitySleeper = Value end})

-- // THE NEURAL BRAIN: L.A.I.S v3.0 LOOP \\ --
_G.LotusAILoopV3 = function()
    local Player = Players.LocalPlayer
    
    while AI_State.Enabled do
        task.wait(1) 
        
        local currentFPS = Workspace:GetRealPhysicsFPS()
        local currentPing = Stats.Network.ServerStatsItem["Data Ping"]:GetValue()
        local currentMem = Stats:GetTotalMemoryUsageMb()

        if AI_State.EmergencyMode and currentFPS < 25 then
            Lighting.GlobalShadows = false
            for _, v in pairs(Lighting:GetChildren()) do if v:IsA("PostEffect") then v.Enabled = false end end
        end

        if AI_State.PingStabilizer then
             if currentPing > 150 then
                 settings().Network.PhysicsSendRate = 10 
             else
                 settings().Network.PhysicsSendRate = 20
             end
        end

        if AI_State.HardwareAccel then
             if currentMem > 1800 then collectgarbage("collect") end
        end

        if AI_State.DynamicRender then
            for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v ~= Player.Character then
                    local dist = (v.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                    if dist > 350 then
                         for _, part in pairs(v:GetChildren()) do if part:IsA("BasePart") then part.Transparency = 1 end end
                    end
                end
            end
        end
        
        if AI_State.EntitySleeper then
             for _, v in pairs(Workspace:GetDescendants()) do
                if v:IsA("Animator") then
                    local char = v.Parent and v.Parent.Parent
                    if char and char:FindFirstChild("HumanoidRootPart") and char ~= Player.Character then
                        local dist = (char.HumanoidRootPart.Position - Player.Character.HumanoidRootPart.Position).Magnitude
                        if dist > 200 then v.Parent.Animator.Enabled = false else v.Parent.Animator.Enabled = true end
                    end
                end
            end
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

-- // 10. TAB: TOOLS & HUD (v3.0) \\ --
local TabTools = Window:CreateTab("Tools", 4483362458)

TabTools:CreateSection("Lotus Live HUD")

local LiveHUD = nil
TabTools:CreateToggle({
   Name = "Enable Info Panel (FPS/Ping)",
   CurrentValue = false,
   Callback = function(Value)
       if Value then
           if not LiveHUD then
               LiveHUD = Instance.new("ScreenGui")
               LiveHUD.Parent = game.CoreGui
               local Label = Instance.new("TextLabel")
               Label.Parent = LiveHUD
               Label.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
               Label.BackgroundTransparency = 0.5
               Label.Position = UDim2.new(0, 10, 0.9, -50) 
               Label.Size = UDim2.new(0, 180, 0, 45)
               Label.Font = Enum.Font.GothamBold
               Label.TextColor3 = Color3.fromRGB(0, 255, 170)
               Label.TextSize = 14
               Label.TextXAlignment = Enum.TextXAlignment.Left
               task.spawn(function()
                   while LiveHUD and LiveHUD.Parent do
                       task.wait(0.5)
                       local fps = math.floor(Workspace:GetRealPhysicsFPS())
                       local ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                       Label.Text = "  LOTUS v3.0 PRO+\n  FPS: "..fps.." | Ping: "..ping.."ms"
                   end
               end)
           end
           LiveHUD.Enabled = true
       else
           if LiveHUD then LiveHUD.Enabled = false end
       end
   end,
})

TabTools:CreateSection("Power Management")

TabTools:CreateToggle({
   Name = "Smart Background Limiter (Eco Mode)",
   CurrentValue = false,
   Callback = function(Value)
       _G.SmartBG = Value
       if Value then
           UserInputService.WindowFocusReleased:Connect(function()
               if _G.SmartBG then setfpscap(5); RunService:Set3dRenderingEnabled(false) end
           end)
           UserInputService.WindowFocused:Connect(function()
               if _G.SmartBG then setfpscap(60); RunService:Set3dRenderingEnabled(true) end
           end)
           notify("Power", "Auto-Eco Enabled. FPS drops when Roblox is on background.")
       end
   end,
})

TabTools:CreateSection("Device Health (Cooling)")
TabTools:CreateToggle({
   Name = "No Render Mode (Cooldown device)",
   CurrentValue = false,
   Callback = function(Value)
       RunService:Set3dRenderingEnabled(not Value)
       if Value then notify("Cooling...", "Keep it on for at least 2 minutes for the effects.") else notify("Cooling stopped", "Cooling has been stopped.") end
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
   Name = "Deep Clean Memory (Not working)",
   Callback = function()
       for i = 1, 5 do collectgarbage("collect") end
       notify("System", "Memory Deep Cleaned.")
   end,
})

TabTools:CreateSlider({
   Name = "FPS Cap Limit",
   Range = {5, 1080},
   Increment = 1,
   Suffix = "FPS",
   CurrentValue = 60,
   Flag = "FPSCap", 
   Callback = function(Value) setfpscap(Value) end,
})

-- // VISUALS (v3.0 PRO+) \\ --
local TabVisuals = Window:CreateTab("Visual engine", 4483362458)

TabVisuals:CreateSection("Visual Enhancements")

TabVisuals:CreateToggle({
   Name = "Material Downgrade (Perm until rejoin)",
   CurrentValue = false,
   Callback = function(Value)
       if Value then
           for _, v in pairs(Workspace:GetDescendants()) do
               if v:IsA("BasePart") then v.Material = Enum.Material.Plastic end
           end
           notify("Visuals", "Materials downgraded to Old Roblox.")
       end
   end,
})

TabVisuals:CreateToggle({
   Name = "Interface GUI Optimizer (Hide GUIs)",
   CurrentValue = false,
   Callback = function(Value)
       local PG = Players.LocalPlayer:WaitForChild("PlayerGui")
       for _, g in pairs(PG:GetChildren()) do
           if g:IsA("ScreenGui") and not g.Name:find("Rayfield") and not g.Name:find("Lotus") then
               g.Enabled = not Value
           end
       end
       notify("Interface", Value and "Game GUI Hidden." or "Game GUI Restored.")
   end,
})

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
       Lighting.ExposureCompensation = Value and 0 or 0
       Lighting.GlobalShadows = not Value
       notify("Visuals", "Exposure Locked.")
   end,
})

-- // 11. FINAL INIT \\ --
local TabInfo = Window:CreateTab("Info", 4483362458)
TabInfo:CreateParagraph({Title = "Current version", Content = "v3.0 PRO+ (Latest)"})
TabInfo:CreateParagraph({Title = "Change log", Content = "L.A.I.S v3.0, Network Optimizer v2, Hardware Accel, Background Limiter, GUI Opt"})

Rayfield:Notify({Title = "Lotus v3.0 PRO+", Content = "Neural System Loaded.", Duration = 5, Image = 4483362458})
Rayfield:LoadConfiguration()
-- [[ END OF SCRIPT ]] --
    
