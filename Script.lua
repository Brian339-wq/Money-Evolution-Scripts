local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hop Hup Hub",
   Icon = 0,
   LoadingTitle = "Wait. I'm Loading !!!",
   LoadingSubtitle = "This Script is No Keyless!",
   ShowText = "Hop Hup Hub",
   Theme = "Ocean",
   ToggleUIKeybind = "H",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Hop Hup Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },
   KeySystem = false,
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"Hello"}
   }
})

local AutoTab = Window:CreateTab("Auto", nil)

-- Auto Click Coin
local autoClickCoinEnabled = false
AutoTab:CreateToggle({
   Name = "Auto Click Coin",
   CurrentValue = false,
   Flag = "ACC",
   Callback = function(Value)
      autoClickCoinEnabled = Value
      task.spawn(function()
         while autoClickCoinEnabled do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClickMoney"):FireServer()
            task.wait(0.1)
         end
      end)
   end,
})

-- Auto Get Daily Rewards
local autoDailyEnabled = false
AutoTab:CreateToggle({
   Name = "Auto Get Daily Rewards",
   CurrentValue = false,
   Flag = "AGDR",
   Callback = function(Value)
      autoDailyEnabled = Value
      task.spawn(function()
         while autoDailyEnabled do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimDailyReward"):FireServer()
            task.wait(1)
         end
      end)
   end,
})

-- Upgrade Number
local numberr = 0
AutoTab:CreateInput({
   Name = "Number To Buy Upgrade (ex: 1)",
   CurrentValue = "",
   PlaceholderText = "Place A Number Connected to an Upgrade (ex: 1)",
   RemoveTextAfterFocusLost = false,
   Flag = "NTBU",
   Callback = function(Text)
      numberr = tonumber(Text) or 0
   end,
})

-- Auto Buy Upgrade
local autoUpgradeEnabled = false
AutoTab:CreateToggle({
   Name = "Auto Buy Upgrade",
   CurrentValue = false,
   Flag = "ABU",
   Callback = function(Value)
      autoUpgradeEnabled = Value
      task.spawn(function()
         while autoUpgradeEnabled do
            local args = {numberr, true}
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))
            task.wait(0.5)
         end
      end)
   end,
})

-- Auto Buy Prestige
local autoPrestigeEnabled = false
AutoTab:CreateToggle({
   Name = "Auto Buy Prestige",
   CurrentValue = false,
   Flag = "ABP",
   Callback = function(Value)
      autoPrestigeEnabled = Value
      task.spawn(function()
         while autoPrestigeEnabled do
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Prestige"):FireServer()
            task.wait(1)
         end
      end)
   end,
})
