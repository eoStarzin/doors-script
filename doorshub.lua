local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Is-Star/Libraries/main/FluxLib.lua"))()
local window = library:Window("Jeffzinho Doors Hub V1", "Feito por IsStar", Color3.fromRGB(45, 45, 45), Enum.KeyCode.RightControl)

local mainTab = window:Tab("Main", "📜")
local espTab = window:Tab("Visual", "👁")
local boostTab = window:Tab("Boost", "⚙")
local creditTab = window:Tab("Créditos", "⭐")

-- Multi-idioma
local idioma = "pt"
local textos = {
    pt = {
        autoWin = "Zerar jogo automaticamente",
        antiRush = "Anti-Rush",
        antiScreech = "Anti-Screech",
        autoLoot = "Pegar itens automaticamente",
        autoOpen = "Abrir portas automaticamente",
        verEntidades = "Ver monstros e objetos",
        fpsBoost = "Ativar FPS Boost",
        creditos = "Script feito por IsStar para Jeffzinho <3"
    },
    en = {
        autoWin = "Auto Win Game",
        antiRush = "Anti-Rush",
        antiScreech = "Anti-Screech",
        autoLoot = "Auto Loot Items",
        autoOpen = "Auto Open Doors",
        verEntidades = "ESP Monsters & Objects",
        fpsBoost = "Enable FPS Boost",
        creditos = "Script made by IsStar for Jeffzinho <3"
    }
}

-- Funções
mainTab:Toggle(textos[idioma].autoWin, false, function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Is-Star/Scripts/main/Doors/AutoWin.lua"))()
    end
end)

mainTab:Toggle(textos[idioma].autoLoot, false, function(state)
    _G.AutoLoot = state
    while _G.AutoLoot and wait(1) do
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "KeyObtain" and v:IsA("ProximityPrompt") then
                fireproximityprompt(v)
            end
        end
    end
end)

mainTab:Toggle(textos[idioma].autoOpen, false, function(state)
    _G.AutoOpen = state
    while _G.AutoOpen and wait(1) do
        for _, v in pairs(workspace:GetDescendants()) do
            if v.Name == "Door" and v:FindFirstChild("DoorPrompt") then
                fireproximityprompt(v.DoorPrompt)
            end
        end
    end
end)

mainTab:Toggle(textos[idioma].antiRush, false, function(state)
    if state then
        game:GetService("ReplicatedStorage").EntityInfo.RushMoving:Destroy()
    end
end)

mainTab:Toggle(textos[idioma].antiScreech, false, function(state)
    if state then
        game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("Screech"):Destroy()
    end
end)

espTab:Toggle(textos[idioma].verEntidades, false, function(state)
    if state then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Is-Star/Scripts/main/Doors/ESP.lua"))()
    end
end)

boostTab:Button(textos[idioma].fpsBoost, function()
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("BasePart") and v.Transparency ~= 1 then
            v.Material = Enum.Material.SmoothPlastic
            v.Reflectance = 0
        end
        if v:IsA("Decal") then
            v:Destroy()
        end
    end
    game.Lighting.FogEnd = 1e10
    sethiddenproperty(game.Lighting, "Technology", Enum.Technology.Compatibility)
end)

creditTab:Label(textos[idioma].creditos)
