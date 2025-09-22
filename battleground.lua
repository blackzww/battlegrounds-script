-- ============================================================
-- SwastiKa Hub
-- Interface criada com WindUI
-- Autor: blackzw and my bitch :3
-- ============================================================

-- Carregar a library WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

-- Configurações globais da UI
WindUI:SetFont("rbxassetid://12187373327")
WindUI:SetTheme("Dark")

-- ============================================================
-- Criação da janela principal
-- ============================================================
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
            print("Botão de usuário clicado")
        end,
    },
})

-- Botão que abre a UI minimizada
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

-- Remover botões desnecessários do topo
Window:DisableTopbarButtons({
    "Fullscreen",
})

-- ============================================================
-- Abas principais da interface
-- ============================================================
local TabMain = Window:Tab({
    Title = "Main",
    Icon = "archive",
    Locked = false
})

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

-- ============================================================
-- Aba: Main
-- Elementos básicos de interação
-- ============================================================

-- Botão simples
TabMain:Button({
    Title = "Clique aqui",
    Callback = function()
        print("Botão clicado!")
    end,
})

-- Toggle (liga/desliga)
TabMain:Toggle({
    Title = "Ativar função",
    Default = false,
    Callback = function(state)
        print("Toggle está:", state)
    end,
})

-- Slider (controle deslizante)
TabMain:Slider({
    Title = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        print("Volume em:", value)
    end,
})

-- Caixa de texto
TabMain:TextBox({
    Title = "Digite algo",
    Placeholder = "Escreva aqui...",
    Callback = function(text)
        print("Você digitou:", text)
    end,
})

-- Dropdown (menu suspenso)
TabMain:Dropdown({
    Title = "Escolha uma opção",
    Values = {"Opção 1", "Opção 2", "Opção 3"},
    Default = 1,
    Callback = function(selected)
        print("Selecionou:", selected)
    end,
})

-- ============================================================
-- Aba: Universal
-- Aimbot simples com trava de câmera
-- ============================================================

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Distância máxima para travar no inimigo
local DIST_LIMIT = 25

-- Conexão usada para ativar/desativar o aimbot
local aimbotConn = nil

-- Função: retorna o jogador mais próximo
local function getClosest()
    local minDist = DIST_LIMIT
    local closestChar = nil
    local myChar = LocalPlayer.Character
    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
    if not myRoot then return nil end

    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer 
        and p.Character 
        and p.Character:FindFirstChild("HumanoidRootPart") 
        and p.Character:FindFirstChild("Humanoid") 
        and p.Character.Humanoid.Health > 0 then

            local dist = (myRoot.Position - p.Character.HumanoidRootPart.Position).Magnitude
            if dist < minDist then
                minDist = dist
                closestChar = p.Character
            end
        end
    end
    return closestChar
end

-- Função: trava a câmera no inimigo mais próximo
local function lockCamera()
    local myChar = LocalPlayer.Character
    local myHead = myChar and myChar:FindFirstChild("Head")
    local closest = getClosest()
    if closest and myHead then
        local targetPos = closest.HumanoidRootPart.Position
        Camera.CFrame = CFrame.new(Camera.CFrame.Position, targetPos)
    end
end

-- Toggle para ligar/desligar o aimbot
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

-- ============================================================
-- Aba: Config
-- Botões de configuração
-- ============================================================
TabConfig:Button({
    Title = "Salvar Config",
    Callback = function()
        print("Configuração salva!")
    end,
})

-- ============================================================
-- Aba: Credits
-- Créditos e notificações
-- ============================================================
TabCredit:Button({
    Title = "Credits",
    Callback = function()
        WindUI:Notify({
            Title = "Credits",
            Content = "by blackzw and my bitch :3",
            Time = 6,
        })
    end,
})

-- ============================================================
-- Notificação inicial
-- ============================================================
WindUI:Notify({
    Title = "Aviso",
    Content = "Sua ação foi concluída com sucesso!",
    Time = 5,
})