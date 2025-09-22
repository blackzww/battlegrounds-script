local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

WindUI:SetFont("rbxassetid://12187373327")
WindUI:SetTheme("Dark")

local Window = WindUI:CreateWindow({
    Title = "SwastiKa Hub",
    Icon = "house", -- lucide icon
    Author = "by blackzw and a my bitch :3",
    Folder = "SwastiKa",
    
    -- ↓ This all is Optional. You can remove it.
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

local Main = Window:Main({
    Title = "Main",
    Icon = "archive", -- optional
    Locked = true,
})

Main:Select() -- Select Tab

-- =========== TEMPLATES ADICIONADOS ===========

-- Botão simples
Main:Button({
    Title = "Clique aqui",
    Callback = function()
        print("Botão clicado!")
    end,
})

-- Toggle (interruptor)
Main:Toggle({
    Title = "Ativar função",
    Default = false,
    Callback = function(state)
        print("Toggle está:", state)
    end,
})

-- Slider (barra deslizante)
Main:Slider({
    Title = "Volume",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        print("Volume em:", value)
    end,
})

-- TextBox (campo de texto)
Main:TextBox({
    Title = "Digite algo",
    Placeholder = "Escreva aqui...",
    Callback = function(text)
        print("Você digitou:", text)
    end,
})

-- Dropdown (lista suspensa)
Main:Dropdown({
    Title = "Escolha uma opção",
    Values = {"Opção 1", "Opção 2", "Opção 3"},
    Default = 1,
    Callback = function(selected)
        print("Selecionou:", selected)
    end,
})

-- Notificação de exemplo
WindUI:Notify({
    Title = "Aviso",
    Content = "Sua ação foi concluída com sucesso!",
    Time = 5, -- segundos
})