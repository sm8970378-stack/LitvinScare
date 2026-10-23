-- mod made by seraph
local Players = game:GetService("Players") local ContentProvider = game:GetService("ContentProvider")
local player = Players.LocalPlayer
local IMAGE_ID = "120341058163977" local SOUND_ID = "87021712935974" local START_TIME = 11
local gui = Instance.new("ScreenGui") gui.Name = "LitvinScare" gui.IgnoreGuiInset = true gui.ResetOnSpawn = false gui.DisplayOrder = 999999 gui.Parent = player:WaitForChild("PlayerGui")
-- Картинка на весь экран local image = Instance.new("ImageLabel") image.Name = "ScareImage" image.Size = UDim2.fromScale(1, 1) image.Position = UDim2.fromScale(0, 0) image.BackgroundColor3 = Color3.new(0, 0, 0) image.Image = "rbxassetid://" .. IMAGE_ID image.ScaleType = Enum.ScaleType.Fit image.ZIndex = 10 image.Parent = gui
-- Перекрытие нажатий по интерфейсу local blocker = Instance.new("TextButton") blocker.Name = "InputBlocker" blocker.Size = UDim2.fromScale(1, 1) blocker.Position = UDim2.fromScale(0, 0) blocker.BackgroundTransparency = 1 blocker.Text = "" blocker.Active = true blocker.Modal = true blocker.ZIndex = 100 blocker.Parent = gui
-- Музыка local sound = Instance.new("Sound") sound.Name = "ScareMusic" sound.SoundId = "rbxassetid://" .. SOUND_ID sound.Volume = 1 sound.Looped = false sound.Parent = gui
task.spawn(function() pcall(function() ContentProvider:PreloadAsync({image, sound}) end)
if not sound.IsLoaded then
    sound.Loaded:Wait()
end

if sound.TimeLength <= START_TIME then
    warn("Музыка не загрузилась или длится меньше 11 секунд.")
    return
end

sound.TimePosition = START_TIME
sound:Play()

sound.Ended:Connect(function()
    sound.TimePosition = START_TIME
    sound:Play()
end)
end)
