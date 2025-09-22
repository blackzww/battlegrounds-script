local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetFont("rbxassetid://12187373327")
WindUI:SetTheme("Dark")

local Window = WindUI:CreateWindow({
    Title = "SwastiKa Hub",
    Icon = "house",
    Author = "by blackzw and a my bitch :3",
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
})
local TabConfig = Window:Tab({
    Title = "Config",
    Icon = "settings",
    Locked = false
})
local TabSobre = Window:Tab({
    Title = "Sobre",
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

-- ========== ELEMENTOS NA ABA CONFIG ==========
TabConfig:Toggle({
    Title = "Modo escuro",
    Default = true,
    Callback = function(state)
        print("Modo escuro:", state)
    end,
})

TabConfig:Button({
    Title = "Salvar Config",
    Callback = function()
        print("Configuração salva!")
    end,
})

-- ========== ELEMENTOS NA ABA SOBRE ==========
TabSobre:Button({
    Title = "Créditos",
    Callback = function()
        WindUI:Notify({
            Title = "Créditos",
            Content = "by blackzw e a my bitch :3",
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