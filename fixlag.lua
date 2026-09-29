--// FIX LAG DRAG V1
--// dev•Gkiet
--// DELTA EDITION

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")

local LP = Players.LocalPlayer
local PG = LP:WaitForChild("PlayerGui")

--==================================================
-- IMAGE
--==================================================

local IMAGE_URL =
"https://cdn.phototourl.com/member/2026-09-29-a4cb7732-b4c0-42d3-b710-7b6590b4d2f4.png"

local IMAGE_FILE = "FIX_LAG_DRAG_V1.png"

local function GetImage()
    local ok, result = pcall(function()

        if not isfile(IMAGE_FILE) then
            local data = game:HttpGet(IMAGE_URL)
            writefile(IMAGE_FILE, data)
        end

        if getsynasset then
            return getsynasset(IMAGE_FILE)
        elseif getcustomasset then
            return getcustomasset(IMAGE_FILE)
        end

        return nil
    end)

    if ok then
        return result
    end

    return nil
end

local IMAGE = GetImage()

--==================================================
-- GUI
--==================================================

local GUI = Instance.new("ScreenGui")
GUI.Name = "FIX_LAG_DRAG_V1"
GUI.ResetOnSpawn = false
GUI.IgnoreGuiInset = true
GUI.Parent = PG

--==================================================
-- LOADING
--==================================================

local Loading = Instance.new("Frame")
Loading.Size = UDim2.fromScale(1,1)
Loading.BackgroundColor3 = Color3.fromRGB(2,2,10)
Loading.BorderSizePixel = 0
Loading.Parent = GUI

local LoadTitle = Instance.new("TextLabel")
LoadTitle.AnchorPoint = Vector2.new(.5,.5)
LoadTitle.Position = UDim2.fromScale(.5,.46)
LoadTitle.Size = UDim2.fromScale(.85,.1)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "FIX LAG DRAG V1"
LoadTitle.TextScaled = true
LoadTitle.Font = Enum.Font.GothamBlack
LoadTitle.TextColor3 = Color3.new(1,1,1)
LoadTitle.Parent = Loading

local Dev = Instance.new("TextLabel")
Dev.AnchorPoint = Vector2.new(.5,.5)
Dev.Position = UDim2.fromScale(.5,.56)
Dev.Size = UDim2.fromScale(.7,.05)
Dev.BackgroundTransparency = 1
Dev.Text = "dev•Gkiet"
Dev.TextScaled = true
Dev.Font = Enum.Font.GothamBold
Dev.TextColor3 = Color3.fromRGB(0,200,255)
Dev.Parent = Loading

--==================================================
-- UNIVERSE RAINBOW PARTICLES
--==================================================

local Particles = {}

for i = 1,80 do

    local P = Instance.new("Frame")
    local S = math.random(2,6)

    P.Size = UDim2.fromOffset(S,S)
    P.Position = UDim2.fromScale(
        math.random(),
        math.random()
    )

    P.BackgroundColor3 =
        Color3.fromHSV(math.random(),1,1)

    P.BorderSizePixel = 0
    P.Parent = Loading

    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(1,0)
    C.Parent = P

    table.insert(Particles,P)
end

local rainbow = 0

local RainbowConnection = RunService.RenderStepped:Connect(function(dt)

    rainbow = (rainbow + dt * .35) % 1

    LoadTitle.TextColor3 =
        Color3.fromHSV(rainbow,1,1)

    Dev.TextColor3 =
        Color3.fromHSV((rainbow+.35)%1,1,1)

    for _,P in ipairs(Particles) do
        P.BackgroundColor3 =
            Color3.fromHSV(
                (rainbow + math.random()*.5)%1,
                1,
                1
            )
    end
end)

task.wait(1)

--==================================================
-- GOM MẢNH VỠ VÀO GIỮA
--==================================================

for _,P in ipairs(Particles) do

    TweenService:Create(
        P,
        TweenInfo.new(
            math.random(5,12)/10,
            Enum.EasingStyle.Quint,
            Enum.EasingDirection.In
        ),
        {
            Position = UDim2.fromScale(.5,.5),
            Size = UDim2.fromOffset(1,1)
        }
    ):Play()
end

task.wait(1.3)

if RainbowConnection then
    RainbowConnection:Disconnect()
end

TweenService:Create(
    Loading,
    TweenInfo.new(.6),
    {BackgroundTransparency = 1}
):Play()

task.wait(.65)
Loading:Destroy()

--==================================================
-- CIRCLE LOGO
--==================================================

local Circle = Instance.new("ImageButton")
Circle.Name = "FIX_LAG_LOGO"
Circle.Size = UDim2.fromOffset(78,78)
Circle.Position = UDim2.fromOffset(25,220)
Circle.BackgroundColor3 = Color3.fromRGB(5,5,15)
Circle.BorderSizePixel = 0
Circle.AutoButtonColor = false
Circle.Parent = GUI

if IMAGE then
    Circle.Image = IMAGE
    Circle.ScaleType = Enum.ScaleType.Crop
end

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1,0)
CircleCorner.Parent = Circle

local CircleStroke = Instance.new("UIStroke")
CircleStroke.Thickness = 3
CircleStroke.Parent = Circle

--==================================================
-- RAINBOW BORDER
--==================================================

task.spawn(function()

    local h = 0

    while Circle.Parent do

        h = (h + .008) % 1

        CircleStroke.Color =
            Color3.fromHSV(h,1,1)

        task.wait()
    end
end)

--==================================================
-- MAIN PANEL
--==================================================

local Panel = Instance.new("Frame")
Panel.Size = UDim2.fromOffset(345,285)
Panel.Position = UDim2.fromOffset(110,170)
Panel.BackgroundColor3 = Color3.fromRGB(8,9,17)
Panel.BorderSizePixel = 0
Panel.Visible = false
Panel.Parent = GUI

local PanelCorner = Instance.new("UICorner")
PanelCorner.CornerRadius = UDim.new(0,18)
PanelCorner.Parent = Panel

local PanelStroke = Instance.new("UIStroke")
PanelStroke.Thickness = 2
PanelStroke.Parent = Panel

task.spawn(function()

    local h = 0

    while Panel.Parent do

        h = (h + .006) % 1

        PanelStroke.Color =
            Color3.fromHSV(h,1,1)

        task.wait()
    end
end)

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,52)
Header.BackgroundTransparency = 1
Header.Parent = Panel

local Title = Instance.new("TextLabel")
Title.Position = UDim2.fromOffset(14,5)
Title.Size = UDim2.new(1,-70,0,40)
Title.BackgroundTransparency = 1
Title.Text = "⚡ FIX LAG DRAG V1"
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.TextScaled = true
Title.Font = Enum.Font.GothamBlack
Title.TextColor3 = Color3.new(1,1,1)
Title.Parent = Header

local X = Instance.new("TextButton")
X.Position = UDim2.new(1,-47,0,8)
X.Size = UDim2.fromOffset(35,35)
X.BackgroundColor3 = Color3.fromRGB(220,35,55)
X.Text = "X"
X.TextColor3 = Color3.new(1,1,1)
X.TextScaled = true
X.Font = Enum.Font.GothamBlack
X.Parent = Header

local XC = Instance.new("UICorner")
XC.CornerRadius = UDim.new(1,0)
XC.Parent = X

--==================================================
-- STATS BOX
--==================================================

local Box = Instance.new("Frame")
Box.Position = UDim2.fromOffset(15,62)
Box.Size = UDim2.new(1,-30,0,95)
Box.BackgroundColor3 = Color3.fromRGB(15,16,27)
Box.BorderSizePixel = 0
Box.Parent = Panel

local BC = Instance.new("UICorner")
BC.CornerRadius = UDim.new(0,12)
BC.Parent = Box

local function MakeStat(text,pos,color)

    local L = Instance.new("TextLabel")

    L.Position = UDim2.fromOffset(12,pos)
    L.Size = UDim2.new(1,-24,0,25)
    L.BackgroundTransparency = 1
    L.Text = text
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.TextScaled = true
    L.Font = Enum.Font.GothamBold
    L.TextColor3 = color
    L.Parent = Box

    return L
end

local FPS = MakeStat(
    "FPS: --",
    5,
    Color3.fromRGB(0,255,150)
)

local Ping = MakeStat(
    "PING: -- ms",
    33,
    Color3.fromRGB(0,210,255)
)

local Memory = MakeStat(
    "MEMORY: -- MB",
    61,
    Color3.fromRGB(255,210,60)
)

--==================================================
-- STATUS
--==================================================

local Status = Instance.new("TextLabel")
Status.Position = UDim2.fromOffset(18,166)
Status.Size = UDim2.new(1,-36,0,35)
Status.BackgroundTransparency = 1
Status.Text = "✓ CLIENT OPTIMIZER ACTIVE"
Status.TextScaled = true
Status.Font = Enum.Font.GothamBold
Status.TextColor3 = Color3.fromRGB(0,255,140)
Status.Parent = Panel

local Credit = Instance.new("TextLabel")
Credit.Position = UDim2.fromOffset(18,210)
Credit.Size = UDim2.new(1,-36,0,30)
Credit.BackgroundTransparency = 1
Credit.Text = "dev•Gkiet  •  PLAY SMOOTH  •  NO LAG"
Credit.TextScaled = true
Credit.Font = Enum.Font.GothamBold
Credit.TextColor3 = Color3.fromRGB(100,170,255)
Credit.Parent = Panel

--==================================================
-- OPTIMIZE
--==================================================

local function Optimize()

    pcall(function()
        settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
    end)

    for _,v in ipairs(Lighting:GetChildren()) do

        if v:IsA("BloomEffect")
        or v:IsA("BlurEffect")
        or v:IsA("ColorCorrectionEffect")
        or v:IsA("SunRaysEffect")
        or v:IsA("DepthOfFieldEffect") then

            v.Enabled = false
        end
    end

    for _,v in ipairs(workspace:GetDescendants()) do

        if v:IsA("ParticleEmitter")
        or v:IsA("Trail")
        or v:IsA("Beam")
        or v:IsA("Smoke")
        or v:IsA("Fire")
        or v:IsA("Sparkles") then

            v.Enabled = false

        elseif v:IsA("BasePart") then

            v.Material = Enum.Material.Plastic
            v.Reflectance = 0

        elseif v:IsA("Decal")
        or v:IsA("Texture") then

            v.Transparency =
                math.max(v.Transparency,.35)
        end
    end
end

Optimize()

--==================================================
-- FPS / PING / MEMORY
--==================================================

local Frames = 0
local Last = os.clock()

RunService.RenderStepped:Connect(function()

    Frames += 1

    local Now = os.clock()

    if Now - Last >= 1 then

        local FPSValue =
            math.floor(Frames/(Now-Last))

        FPS.Text =
            "FPS: "..FPSValue

        local PingValue = "--"

        pcall(function()

            PingValue = math.floor(
                Stats.Network.ServerStatsItem[
                    "Data Ping"
                ]:GetValue()
            )
        end)

        Ping.Text =
            "PING: "..tostring(PingValue).." ms"

        local MemValue = "--"

        pcall(function()

            MemValue = math.floor(
                Stats:GetTotalMemoryUsageMb()
            )
        end)

        Memory.Text =
            "MEMORY: "..tostring(MemValue).." MB"

        Frames = 0
        Last = Now
    end
end)

--==================================================
-- OPEN / CLOSE
--==================================================

Circle.MouseButton1Click:Connect(function()
    Panel.Visible = not Panel.Visible
end)

X.MouseButton1Click:Connect(function()
    Panel.Visible = false
end)

--==================================================
-- DRAG PANEL
--==================================================

local dragging = false
local dragStart
local startPosition

Header.InputBegan:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPosition = Panel.Position

        input.Changed:Connect(function()

            if input.UserInputState ==
                Enum.UserInputState.End then

                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)

    if not dragging then return end

    if input.UserInputType ==
        Enum.UserInputType.MouseMovement
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        local Delta =
            input.Position - dragStart

        Panel.Position = UDim2.new(
            startPosition.X.Scale,
            startPosition.X.Offset + Delta.X,
            startPosition.Y.Scale,
            startPosition.Y.Offset + Delta.Y
        )
    end
end)

--==================================================
-- DRAG LOGO
--==================================================

local circleDragging = false
local circleStart
local circlePosition

Circle.InputBegan:Connect(function(input)

    if input.UserInputType ==
        Enum.UserInputType.MouseButton1
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        circleDragging = true
        circleStart = input.Position
        circlePosition = Circle.Position

        input.Changed:Connect(function()

            if input.UserInputState ==
                Enum.UserInputState.End then

                circleDragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)

    if not circleDragging then return end

    if input.UserInputType ==
        Enum.UserInputType.MouseMovement
        or input.UserInputType ==
        Enum.UserInputType.Touch then

        local Delta =
            input.Position - circleStart

        Circle.Position = UDim2.new(
            circlePosition.X.Scale,
            circlePosition.X.Offset + Delta.X,

            circlePosition.Y.Scale,
            circlePosition.Y.Offset + Delta.Y
        )
    end
end)

print("================================")
print(" FIX LAG DRAG V1")
print(" dev•Gkiet")
print(" DELTA EDITION")
print(" OPTIMIZER: ON")
print("================================")
