-- =======================================
-- 🖤 Blackzw Hub - Template Nerd/Fudidão 🤓🔥
-- Totalmente funcional no Roblox/Delta Mobile
-- Abas visíveis, tema preto/vermelho
-- Botões, toggles e sliders como placeholders
-- =======================================

-- 1️⃣ Carrega a library WindUI (proteção extra)
local success, WindUI = pcall(function()
    return loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
end)
if not success or not WindUI then
    return warn("WindUI não carregou corretamente. Verifique o link ou seu executor.")
end

-- 2️⃣ Função template para som de clique (opcional)
local function PlayClickSound()
    local s = Instance.new("Sound")
    s.SoundId = "rbxassetid://6361963426" -- troque pelo seu som se quiser
    s.Volume = 0.18
    s.Parent = game:GetService("SoundService")
    s:Play()
    game:GetService("Debris"):AddItem(s, 2)
end

-- 3️⃣ Configurações de tema e fonte (opcional)
pcall(function()
    WindUI:SetFont("rbxassetid://12187374537") -- fonte estilo Comic Sans (substitua se quiser)
end)
pcall(function()
    WindUI:AddTheme({
        Name = "BlackRed",
        Accent = "#FF0000",
        Dialog = "#1a1a1a",
        Outline = "#FF2222",
        Text = "#FFFFFF",
        Placeholder = "#AAAAAA",
        Background = "#000000",
        Button = "#1a1a1a",
        Icon = "#FF3333",
    })
end)

-- 4️⃣ Cria a janela principal (removido Blur para compatibilidade)
local Window = WindUI:Window({
    Title = "🖤 Blackzw Hub 🤓🔥",
    Subtitle = "Template funcional",
    Icon = "home",
    PrimaryColor = Color3.fromRGB(18,18,18),
    AccentColor  = Color3.fromRGB(200,50,50),
    -- Blur = true, -- Ative só se seu executor suportar
})

-- 5️⃣ (Opcional) SearchBar pode dar erro em executores mobile, ative se suportar
--[[
pcall(function()
    Window:SearchBar({
        Title = "Pesquisar 🔍",
        Placeholder = "Digite aqui...",
    })
end)
]]

-- =====================================
-- 🏠 Aba Principal (template)
-- =====================================
local MainTab = Window:Tab({
    Title = "🏠 Principal",
    Icon = "home",
    Locked = false,
})

MainTab:Button({
    Title = "💡 Botão Principal",
    Description = "Coloque sua função aqui",
    Callback = function()
        PlayClickSound()
        -- SUA FUNÇÃO AQUI
    end
})

MainTab:Toggle({
    Title = "🔘 Toggle Principal",
    Description = "Coloque sua função aqui",
    Default = false,
    Callback = function(Value)
        PlayClickSound()
        -- SUA FUNÇÃO AQUI
    end
})

MainTab:Slider({
    Title = "📏 Slider Principal",
    Description = "Coloque sua função aqui",
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        PlayClickSound()
        -- SUA FUNÇÃO AQUI
    end
})

-- =====================================
-- 🎨 Aba Estética (template)
-- =====================================
local StyleTab = Window:Tab({
    Title = "🎨 Estética",
    Icon = "palette",
    Locked = false,
})

StyleTab:Toggle({
    Title = "✨ Toggle Estética",
    Description = "Função opcional",
    Default = false,
    Callback = function(Value)
        PlayClickSound()
        -- SUA FUNÇÃO AQUI
    end
})

StyleTab:Slider({
    Title = "📏 Slider Estética",
    Description = "Função opcional",
    Min = 1,
    Max = 100,
    Default = 50,
    Callback = function(Value)
        PlayClickSound()
        -- SUA FUNÇÃO AQUI
    end
})

-- =====================================
-- 🛠 Aba Ferramentas (template)
-- =====================================
local ToolsTab = Window:Tab({
    Title = "🛠 Ferramentas",
    Icon = "tool",
    Locked = false,
})

ToolsTab:Button({
    Title = "📝 Botão Ferramenta",
    Description = "Coloque sua função aqui",
    Callback = function()
        PlayClickSound()
        -- SUA FUNÇÃO AQUI
    end
})

-- =====================================
-- ℹ️ Aba Sobre (template)
-- =====================================
local AboutTab = Window:Tab({
    Title = "ℹ️ Sobre",
    Icon = "info",
    Locked = false,
})

AboutTab:Label({
    Title = "🖤 Blackzw Hub",
    Text = "Template limpo para personalizar suas funções"
})

AboutTab:Paragraph({
    Title = "👑 Créditos",
    Content = "Coloque aqui suas informações ou instruções para o usuário"
})