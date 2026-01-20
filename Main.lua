--[[ 
    LOTUS •|• OPTIMIZATION HUB v1.5 PRO (AI ENHANCED)
    [PART 1: Core Setup, Safe Functions, Light & Balanced Tabs]
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
   Name = "Lotus •|• Optimization HUB v1.5 (AI+)",
   LoadingTitle = "Lotus Engine v1.5 Starting...",
   LoadingSubtitle = "Powered by Gemini AI",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LotusHubGen2", 
      FileName = "LotusConfigV1.5AI"
   },
   Discord = {
      Enabled = false,
      Invite = "", 
      RememberJoins = true 
   },
   KeySystem = false, 
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
-- [[ START OF PART 2 ]] --

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

TabAggressive:CreateSection("Physics Optimization")
TabAggressive:CreateButton({
   Name = "Disable Environmental Animators",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("Animator") then
               local char = v.Parent and v.Parent.Parent
               if char and char.Name ~= Players.LocalPlayer.Name then
                   v:Destroy() 
               end
           end
       end
       notify("Aggressive Opt", "NPC/Env Animations disabled.")
   end,
})

-- // 7. TAB: NUCLEAR (EXTREME) \\ --
local TabNuclear = Window:CreateTab("NUCLEAR", 4483362458)

TabNuclear:CreateSection("THE MELTDOWN (DESTRUCTIVE)")
TabNuclear:CreateParagraph({Title = "Warning", Content = "Destroys map parts. Only for unplayable lag."})

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
   Name = "Grey World (0 Color)",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("BasePart") or v:IsA("MeshPart") then
               v.Color = Color3.fromRGB(100, 100, 100)
               v.Material = Enum.Material.SmoothPlastic
           end
       end
   end,
})

TabNuclear:CreateButton({
   Name = "No-Render Mode (Invisible Map)",
   Callback = function()
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("BasePart") then v.Transparency = 1 end
       end
       notify("NUCLEAR", "Map is now invisible.")
   end,
})
-- [[ START OF PART 3 ]] --

-- // 8. TAB: LOTUS AI (L.A.I.S - INTELLIGENT CORE v2.0) \\ --
local TabAI = Window:CreateTab("Lotus AI", 4483362458)

-- AI STATE MANAGEMENT
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

TabAI:CreateSection("Intelligent Features (Real-Time)")

TabAI:CreateToggle({
   Name = "1. Dynamic Render (Smart Culling)",
   CurrentValue = false,
   Callback = function(Value) AI_State.DynamicRender = Value end,
})
-- Hides objects > 300 studs away

TabAI:CreateToggle({
   Name = "2. Entity Sleeper (Stop Far Anims)",
   CurrentValue = false,
   Callback = function(Value) AI_State.EntitySleeper = Value end,
})
-- Freezes animations of far players/NPCs

TabAI:CreateToggle({
   Name = "3. Adaptive VFX Throttle",
   CurrentValue = false,
   Callback = function(Value) AI_State.ParticleThrottle = Value end,
})
-- Disables particles if FPS drops below 45

TabAI:CreateToggle({
   Name = "4. Smart Memory Flush",
   CurrentValue = false,
   Callback = function(Value) AI_State.SmartGC = Value end,
})
-- Cleans RAM only when critical (>2200MB)

TabAI:CreateToggle({
   Name = "5. Physics Governor (Ping Stabilizer)",
   CurrentValue = false,
   Callback = function(Value) AI_State.PhysicsGovernor = Value end,
})
-- Slows physics packets if Ping > 200ms

-- // THE BRAIN: AI LOGIC LOOP \\ --
_G.LotusAILoop = function()
    local Player = Players.LocalPlayer
    
    while AI_State.Enabled do
        task.wait(1.5) -- Optimized checking rate
        
        -- Safe Check: Character Existence
        local myRoot = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
        if not myRoot then 
            task.wait(1) 
        else
            -- Data Collection
            local currentFPS = Workspace:GetRealPhysicsFPS()
            local currentPing = 0
            pcall(function() currentPing = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() end)
            local currentMem = Stats:GetTotalMemoryUsageMb()

            -- [LOGIC 1] Dynamic Render Implementation
            if AI_State.DynamicRender then
                for _, v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("Model") and v:FindFirstChild("HumanoidRootPart") and v ~= Player.Character then
                        local targetRoot = v.HumanoidRootPart
                        local dist = (targetRoot.Position - myRoot.Position).Magnitude
                        local shouldHide = (dist > 300)
                        
                        for _, part in pairs(v:GetChildren()) do
                            if part:IsA("BasePart") then part.Transparency = shouldHide and 1 or 0 end
                        end
                    end
                end
            end

            -- [LOGIC 2] Entity Sleeper Implementation
            if AI_State.EntitySleeper then
                 for _, v in pairs(Workspace:GetDescendants()) do
                    if v:IsA("Animator") then
                        local char = v.Parent and v.Parent.Parent
                        if char and char:FindFirstChild("HumanoidRootPart") and char ~= Player.Character then
                            local dist = (char.HumanoidRootPart.Position - myRoot.Position).Magnitude
                            if dist > 200 then v.Parent.Animator.Enabled = false 
                            else v.Parent.Animator.Enabled = true end
                        end
                    end
                end
            end

            -- [LOGIC 3] Adaptive VFX Throttle
            if AI_State.ParticleThrottle then
                if currentFPS < 45 then
                    for _, v in pairs(Workspace:GetDescendants()) do
                        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") then v.Enabled = false end
                    end
                end
            end

            -- [LOGIC 4] Smart Memory Flush
            if AI_State.SmartGC and currentMem > 2200 then
                collectgarbage("collect")
            end

            -- [LOGIC 5] Physics Governor
            if AI_State.PhysicsGovernor then
                if currentPing > 200 then settings().Network.PhysicsSendRate = 10 
                else settings().Network.PhysicsSendRate = 20 end
            end
        end
    end
end
-- [[ START OF PART 4 ]] --

-- // 9. TAB: ALTERNATIVES (EXTERNAL) \\ --
local TabAlt = Window:CreateTab("Alternatives", 4483362458)

TabAlt:CreateSection("External Optimizers")
TabAlt:CreateParagraph({
    Title = "Titanium Optimizer Gen2",
    Content = "A powerful alternative AI-based optimizer. Click below to load."
})

TabAlt:CreateButton({
   Name = "Load Titanium Gen2 AI",
   Callback = function()
       notify("Loader", "Injecting Titanium Optimizer...")
       loadstring(game:HttpGet("https://raw.githubusercontent.com/Nenecosturan/Titanium-Optimizer-Gen2-AI/refs/heads/main/Main.lua"))()
   end,
})

-- // 10. TAB: TOOLS \\ --
local TabTools = Window:CreateTab("Tools", 4483362458)

TabTools:CreateSlider({
   Name = "FPS Cap Limit",
   Range = {30, 360},
   Increment = 1,
   Suffix = "FPS",
   CurrentValue = 60,
   Flag = "FPSCap", 
   Callback = function(Value) setfpscap(Value) end,
})

TabTools:CreateButton({
   Name = "Force Garbage Collection (RAM Fix)",
   Callback = function()
       collectgarbage("collect")
       notify("Memory", "RAM Cleaned.")
   end,
})

-- // 11. TAB: SETTINGS & INFO \\ --
local TabSettings = Window:CreateTab("Settings", 4483362458)

TabSettings:CreateButton({
   Name = "Unload UI",
   Callback = function() Rayfield:Destroy() end,
})

local TabInfo = Window:CreateTab("Info", 4483362458)
TabInfo:CreateParagraph({Title = "System Specs", Content = "Version: 1.5 (AI+)\nUpdated: 2026.01.20\nEngine: Lotus L.A.I.S v2.0"})
TabInfo:CreateParagraph({Title = "Changelog v1.5", Content = "- ADDED: L.A.I.S v2.0 AI Core\n- ADDED: 5 Smart AI Features\n- ADDED: Titanium Integration"})

-- // 12. FINAL INITIALIZATION \\ --
Rayfield:Notify({
   Title = "Lotus v1.5 Ready",
   Content = "Optimization HUB & AI Engine Loaded.",
   Duration = 5,
   Image = 4483362458,
})

Rayfield:LoadConfiguration()

-- [[ END OF SCRIPT ]] --
