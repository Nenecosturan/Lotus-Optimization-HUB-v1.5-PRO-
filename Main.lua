--[[ 
    LOTUS •|• OPTIMIZATION HUB
    [PART 1: Core Setup, Safe Functions, Light & Balanced Tabs]
    
    Version: 1.5 (Pro)
    Language: Lua / Rayfield UI
    Target: Universal FPS Boosting & AI Management
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
   Name = "Lotus •|• Optimization HUB v1.5",
   LoadingTitle = "Lotus Engine v1.5 Starting...",
   LoadingSubtitle = "Powered by Gemini AI",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "LotusHubGen2", 
      FileName = "LotusConfigV1.5"
   },
   Discord = {
      Enabled = false,
      Invite = "", 
      RememberJoins = true 
   },
   KeySystem = false, 
})

-- // 3. CORE FUNCTIONS (IMPROVED & SAFER) \\ --

local function notify(title, content)
    Rayfield:Notify({
        Title = title,
        Content = content,
        Duration = 3,
        Image = 4483362458,
    })
end

-- NEW: Safe Visual Hider (Does not destroy, prevents game breaking)
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
            if v:IsA("PostEffect") then -- Blur, Bloom, etc. catches all
                v.Enabled = false
            end
        end
       notify("Light Opt", "Visual effects disabled.")
   end,
})

TabLight:CreateButton({
   Name = "Clear Atmosphere & Fog",
   Callback = function()
       for _, v in pairs(Lighting:GetChildren()) do
           if v:IsA("Atmosphere") or v:IsA("Sky") then
               v:Destroy()
           end
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
       notify("Balanced Opt", "Particles hidden (Enabled=false).")
   end,
})
-- [[ START OF PART 2 ]] --

-- // 6. TAB: AGGRESSIVE OPTIMIZATION (REVISED) \\ --
local TabAggressive = Window:CreateTab("Aggressive", 4483362458)

TabAggressive:CreateSection("Smart Cleanup (Non-Destructive)")

TabAggressive:CreateButton({
   Name = "Hide Textures & Decals (No Crash)",
   Callback = function()
       local count = 0
       for _, v in pairs(Workspace:GetDescendants()) do
           if v:IsA("Texture") or v:IsA("Decal") then
               v.Transparency = 1 -- Changed from Destroy to Transparency
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
                   v:Destroy() -- Animators are safe to destroy usually
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

-- // 8. TAB: LOTUS AI (L.A.I.S) \\ --
local TabAI = Window:CreateTab("Lotus AI", 4483362458)
local AI_Enabled = false
local AI_Config = { TargetFPS = 50, MaxRAM = 2000, AFK_Mode = true, Combat_Mode = true }

TabAI:CreateToggle({
   Name = "Enable Lotus AI Engine",
   CurrentValue = false,
   Flag = "AI_Master", 
   Callback = function(Value)
       AI_Enabled = Value
       if Value then
           notify("L.A.I.S", "AI Online. Monitoring Performance.")
           task.spawn(function() _G.LotusAILoop() end)
       end
   end,
})

-- AI Logic Definition
_G.LotusAILoop = function()
    local Player = Players.LocalPlayer
    local LastInput = tick()
    UserInputService.InputBegan:Connect(function() LastInput = tick() end)

    while AI_Enabled do
        task.wait(1)
        
        -- Feature: RAM Cleaner
        if Stats:GetTotalMemoryUsageMb() > AI_Config.MaxRAM then
            collectgarbage("collect")
        end

        -- Feature: Combat Adrenaline
        if AI_Config.Combat_Mode and Player.Character then
            local hum = Player.Character:FindFirstChild("Humanoid")
            if hum and hum.Health < hum.MaxHealth then
                Lighting.GlobalShadows = false
            end
        end

        -- Feature: Smart AFK
        if AI_Config.AFK_Mode then
            if (tick() - LastInput) > 30 then
                setfpscap(10)
                RunService:Set3dRenderingEnabled(false)
            else
                setfpscap(60)
                RunService:Set3dRenderingEnabled(true)
            end
        end
    end
end
-- [[ START OF PART 3 ]] --

-- // 9. TAB: ALTERNATIVES (NEW v1.5) \\ --
-- This tab contains other powerful scripts requested by the user.

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
       -- The requested external script
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
   Callback = function(Value)
       setfpscap(Value)
   end,
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
TabInfo:CreateParagraph({
    Title = "System Specs",
    Content = "Version: 1.5 (Pro)\nUpdated: 2026.01.20\nEngine: Lotus L.A.I.S"
})
TabInfo:CreateParagraph({
    Title = "Changelog v1.5",
    Content = "- Added Alternatives Tab\n- Titanium Gen2 Integrated\n- Fixed Crash Issues in Aggressive Mode"
})

-- // 12. FINAL INITIALIZATION \\ --

Rayfield:Notify({
   Title = "Lotus v1.5 Ready",
   Content = "Optimization HUB & Alternatives Loaded.",
   Duration = 5,
   Image = 4483362458,
})

Rayfield:LoadConfiguration()

-- [[ END OF SCRIPT ]] --
