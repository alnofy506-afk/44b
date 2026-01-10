--[[ 
    نظام التدبيل الخارق (DUPE SYSTEM V4 - MAX SPEED)
    بواسطة: .44b
    مفتاح الإخفاء/الإظهار: Left Control
]]

local UserInputService = game:GetService("UserInputService")
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Title = Instance.new("TextLabel")
local PlayerInput = Instance.new("TextBox")
local UICorner_Input = Instance.new("UICorner")
local DupeButton = Instance.new("TextButton")
local UICorner_Btn = Instance.new("UICorner")
local AutoButton = Instance.new("TextButton")
local UICorner_Auto = Instance.new("UICorner")
local Credits = Instance.new("TextLabel")

-- متغيرات التحكم
local autoEnabled = false
local isVisible = true

-- إعدادات الشاشة
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

-- الإطار الرئيسي
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
MainFrame.Position = UDim2.new(0.5, -125, 0.5, -90)
MainFrame.Size = UDim2.new(0, 250, 0, 180)
MainFrame.Active = true
MainFrame.Draggable = true 

UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

-- العنوان
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 40)
Title.Font = Enum.Font.GothamBold
Title.Text = "نظام التدبيل"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

-- خانة الاسم
PlayerInput.Parent = MainFrame
PlayerInput.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
PlayerInput.Position = UDim2.new(0.1, 0, 0.3, 0)
PlayerInput.Size = UDim2.new(0.8, 0, 0, 35)
PlayerInput.Font = Enum.Font.Gotham
PlayerInput.PlaceholderText = "اسم اللاعب هنا..."
PlayerInput.Text = ""
PlayerInput.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerInput.TextSize = 14
UICorner_Input.CornerRadius = UDim.new(0, 8)
UICorner_Input.Parent = PlayerInput

-- زر التدبيل اليدوي
DupeButton.Parent = MainFrame
DupeButton.BackgroundColor3 = Color3.fromRGB(60, 120, 255)
DupeButton.Position = UDim2.new(0.1, 0, 0.58, 0)
DupeButton.Size = UDim2.new(0.38, 0, 0, 40)
DupeButton.Font = Enum.Font.GothamBold
DupeButton.Text = "تدبيل"
DupeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DupeButton.TextSize = 14
UICorner_Btn.CornerRadius = UDim.new(0, 8)
UICorner_Btn.Parent = DupeButton

-- زر التدبيل التلقائي
AutoButton.Parent = MainFrame
AutoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
AutoButton.Position = UDim2.new(0.52, 0, 0.58, 0)
AutoButton.Size = UDim2.new(0.38, 0, 0, 40)
AutoButton.Font = Enum.Font.GothamBold
AutoButton.Text = "أوتو: طافي"
AutoButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoButton.TextSize = 14
UICorner_Auto.CornerRadius = UDim.new(0, 8)
UICorner_Auto.Parent = AutoButton

-- الحقوق
Credits.Parent = MainFrame
Credits.BackgroundTransparency = 1
Credits.Position = UDim2.new(0, 0, 0.85, 0)
Credits.Size = UDim2.new(1, 0, 0, 20)
Credits.Font = Enum.Font.Code
Credits.Text = "made by .44b"
Credits.TextColor3 = Color3.fromRGB(150, 150, 150)
Credits.TextSize = 12

-- وظيفة الإرسال
local function fireDupe()
    local targetName = PlayerInput.Text
    local targetPlayer = nil
    for _, p in pairs(game:GetService("Players"):GetPlayers()) do
        if p.Name:lower():find(targetName:lower()) or p.DisplayName:lower():find(targetName:lower()) then
            targetPlayer = p
            break
        end
    end

    if targetPlayer then
        local args = {
            [1] = targetPlayer,
            [2] = "Accept",
            [3] = {
                ["Level"] = 106,
                ["Name"] = "Fragola La La La",
                ["Mutation"] = "Diamond"
            }
        }
        game:GetService("ReplicatedStorage").RemoteEvents.CompleteGift:FireServer(unpack(args))
    end
end

-- زر التدبيل اليدوي
DupeButton.MouseButton1Click:Connect(function()
    fireDupe()
    DupeButton.Text = "تم!"
    wait(0.3)
    DupeButton.Text = "تدبيل"
end)

-- زر الأوتو
AutoButton.MouseButton1Click:Connect(function()
    autoEnabled = not autoEnabled
    if autoEnabled then
        AutoButton.Text = "أوتو: يعمل"
        AutoButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- أحمر عند العمل السريع
    else
        AutoButton.Text = "أوتو: طافي"
        AutoButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end)

-- إخفاء بـ Ctrl
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.LeftControl then
        isVisible = not isVisible
        MainFrame.Visible = isVisible
    end
end)

-- حلقة السرعة القصوى (Fast Loop)
task.spawn(function()
    while true do
        if autoEnabled then
            fireDupe()
        end
        task.wait(0.01) -- السرعة القصوى (أجزاء من الثانية)
    end
end)
