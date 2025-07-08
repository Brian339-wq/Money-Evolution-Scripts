local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Hop Hup Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Wait. Im Loading !!!",
   LoadingSubtitle = "This Script is No Keyless!",
   ShowText = "Hop Hup Hub", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "Ocean", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "H", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Hop Hup Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local AutoTab = Window:CreateTab("Auto", nil) -- Title, Image

local AutoClickInCoin = AutoTab:CreateToggle({
   Name = "Auto Click Coin",
   CurrentValue = false,
   Flag = "ACC", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      if Value == true then
      while true do
         game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClickMoney"):FireServer()
      end
     end
      end,
 
   
  
})

local AutoGetDailyRewards = AutoTab:CreateToggle({
   Name = "Auto Get Daily Rewards",
   CurrentValue = false,
   Flag = "AGDR", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 if Value == true then
      while true do
         game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ClaimDailyReward"):FireServer()
      end
     end
   end,
}
local numberr = 0
local Number = AutoTab:CreateInput({
   Name = "Number To Buy Upgrade (ex: 1)",
   CurrentValue = "",
   PlaceholderText = "Place A Number Conected a Upgrade (ex: 1)",
   RemoveTextAfterFocusLost = false,
   Flag = "NTBU",
   Callback = function(Text)
     numberr = Text
   end,
})

local AutoBuyUpgrade = AutoTab:CreateToggle({
   Name = "Auto Buy Upgrade",
   CurrentValue = false,
   Flag = "ABU", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 if Value == true then
      while true do
         local args = {
	numberr,
	true
}
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Upgrade"):FireServer(unpack(args))

      end
     end
   end,
}


local AutoBuyPrestige = AutoTab:CreateToggle({
   Name = "Auto Buy Prestige",
   CurrentValue = false,
   Flag = "ABP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
 if Value == true then
      while true do
         game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Prestige"):FireServer()
      end
     end
   end,
}


