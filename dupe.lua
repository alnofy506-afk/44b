-- تحسين الوصول للخدمات للسرعة والتخفي
local rStorage = game:GetService("ReplicatedStorage")
local remote = rStorage:WaitForChild("Remotes"):WaitForChild("OpenLuckyBlock")

-- إعدادات الحظ والبيانات (تم تحسين مصفوفة Rarity)
local function getArgs()
    return {
        [1] = {
            ["Info"] = {
                ["Name"] = "Exclusive Chest", -- تم التعديل بناءً على طلبك
                ["ItemId"] = 301,
                ["Luck"] = 9999999999999999999999999, -- قيمة حظ ضخمة (مليار)
                ["rarityMultipliers"] = {
                    ["Common"] = 0,
                    ["Uncommon"] = 0,
                    ["Rare"] = 0,
                    ["Epic"] = 10,
                    ["Legendary"] = 1,
                    ["Mythic"] = 10,
                    ["Exclusive"] = 109999999999999999999999999, -- قيمة خرافية للإكزوتيك
                    ["Limited"] = 0 
                },
                ["isLuckyBlock"] = true,
                ["BasePrice"] = 0 -- فتح مجاني
            },
            ["ItemId"] = 301
        }
    }
end

-- نظام الفتح التلقائي الذكي (Auto-Farm)
local autoOpen = true -- غيرها لـ false إذا تبي تفتح مرة واحدة بس

task.spawn(function()
    while autoOpen do
        -- استخدام pcall لمنع انهيار السكربت إذا طردك السيرفر أو حدث خطأ
        local success, err = pcall(function()
            remote:FireServer(unpack(getArgs()))
        end)
        
        if not success then
            warn("⚠️ فشل الإرسال، محاولة أخرى: ", err)
        end
        
        -- وقت الانتظار (Wait) مهم جداً؛ لو خليته سريع جداً بيعطيك Kick
        task.wait(0.3) 
    end
end)

-- تنبيه بسيط لك في الكونسول (F9) بدون استخدام Print العادي
warn("🚀 Exclusive Script Activated: Auto-opening with Exotic luck!")
