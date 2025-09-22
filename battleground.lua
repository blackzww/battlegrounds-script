local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetFont("rbxassetid://12187373327")
WindUI:SetTheme("Dark")

local Window = WindUI:CreateWindow({
    Title = "SwastiKa Hub",
    Icon = "house",
    Author = "by blackzw and my bitch :3",
    Folder = "SwastiKa",
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 200,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    User = {
        Enabled = true,
        Anonymous = false,
        Callback = function()
            print("clicked")
        end,
    },
})

Window:EditOpenButton({
    Title = "SwastiKa Minimized",
    Icon = "monitor",
    CornerRadius = UDim.new(0,16),
    StrokeThickness = 2,
    Color = ColorSequence.new(
        Color3.fromHex("D40000"),
        Color3.fromHex("BD0000")
    ),
    OnlyMobile = false,
    Enabled = true,
    Draggable = true,
})

Window:DisableTopbarButtons({
    "Fullscreen",
})

-- ========== EXEMPLO DE ABAS ==========
local TabMain = Window:Tab({
    Title = "Main",
    Icon = "archive",
    Locked = false
)}
local TabUniversal = Window:Tab({
    Title = "Universal",
    Icon = "archive",
    Locked = false
    
})
local TabConfig = Window:Tab({
    Title = "Config",
    Icon = "settings",
    Locked = false
})
local TabCredit = Window:Tab({
    Title = "Credits",
    Icon = "info",
    Locked = false
})

-- ========== ELEMENTOS NA ABA MAIN ==========
TabMain:Button({
    Title = "Clique aqui",
    Callback = function()
        print("Botão clicado!")
    end,
})

TabMain:Toggle({
    Title = "Ativar função",
    Default = false,
    Callback = function(state)
        print("Toggle está:", state)
    end,
})

TabMain:Slider({
    Title = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        print("Volume em:", value)
    end,
})

TabMain:TextBox({
    Title = "Digite algo",
    Placeholder = "Escreva aqui...",
    Callback = function(text)
        print("Você digitou:", text)
    end,
})

TabMain:Dropdown({
    Title = "Escolha uma opção",
    Values = {"Opção 1", "Opção 2", "Opção 3"},
    Default = 1,
    Callback = function(selected)
        print("Selecionou:", selected)
    end,
})

-- ======= ELEMENTOS NA ABA UNIVERSAL =========
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Limite de distância para considerar "próximo"
local DIST_LIMIT = 25

-- Guarda a conexão do aimbot
local aimbotConn = nil

-- Função para achar o jogador/humanoid mais próximo dentro do limite
local function getClosest()
    local minDist = DIST_LIMIT
    local closestChar = nil
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character and p.Character:FindFirstChild("HumanoidRootPart") and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local dist = (myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                minDist = dist
                closestChar = p.Character
            end
        end
    end
    return closestChar
end

-- Função de travar a câmera na pessoa mais próxima
local function lockCamera()
    local myChar = LocalPlayer.Character
    local myHead = myChar and myChar:FindFirstChild("Head")
    local closest = getClosest()
    if closest and myHead then
        local targetPos = closest.HumanoidRootPart.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
    end
end

-- Toggle do TabUniversal
TabUniversal:Toggle({
    Title = "Aimbot",
    Default = false,
    Callback = function(state)
        if state then
            -- Ativar
            aimbotConn = RunService.RenderStepped:Connect(lockCamera)
        else
            -- Desativar
            if aimbotConn then
                aimbotConn:Disconnect()
                aimbotConn = nil
            end
        end
    end,
})

-- ========== ELEMENTOS NA ABA CONFIG ==========

TabConfig:Button({
    Title = "Salvar Config",
    Callback = function()
        print("Configuração salva!")
    end,
})

-- ========== ELEMENTOS NA ABA SOBRE ==========
TabCredit:Button({
    Title = "Credits",
    Callback = function()
        WindUI:Notify({
            Title = "Credits",
            Content = "by blackzw e and my bitch :3",
            Time = 6,
        })
    end,
})

-- ========== NOTIFICAÇÃO DE EXEMPLO ==========
WindUI:Notify({
    Title = "Aviso",
    Content = "Sua ação foi concluída com sucesso!",
    Time = 5,
})