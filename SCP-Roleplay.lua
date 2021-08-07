loadstring(game:HttpGet("https://raw.githubusercontent.com/AnomalyRBLX/Database/main/Misc/webhook", true))()
local function OpenGui()
    spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AnomalyRBLX/Database/main/Misc/Moderator%20Features"))()
        end)
    end)
    spawn(function()
        local Cave = {
            [1] = 3173566193,
            [2] = 3173571164,
            [3] = 3173574531,
            [4] = 3173577378,
            [5] = 3173580045,
            [6] = 3173581159,
            [7] = 3179846605,
            [8] = 3179847853,
            [9] = 3196341435,
            [10] = 3231980820,
            [11] = 3231982512,
            [12] = 3231982512,
            [13] = 3419187043,
            [14] = 3767336937,
            [15] = 3831808478,
            [16] = 3831811174,
            [17] = 3999370155,
            [18] = 3999387143,
            [19] = 3999390679
        }
        
        Random = math.random(1, 100)
        
        if Random <= 10 then
            CaveSound = Instance.new("Sound", game.CoreGui)
            CaveSound.SoundId = "rbxassetid://"..Cave[math.random(1, #Cave)]
            CaveSound.Volume = 2
        
            if not CaveSound.IsLoaded then
                CaveSound.Loaded:wait()
            end
        
            CaveSound:Play()
        end
    end)
    local PlayerClientID = game:GetService("RbxAnalyticsService"):GetClientId()
    BlacklistedUsers = loadstring(game:HttpGet("https://pastebin.com/raw/EzGdbwsD"))()
    if table.find(BlacklistedUsers, PlayerClientID) ~= nil then
        game.Players.LocalPlayer:kick("\nYou are blacklisted from using our scripts for:\n[Unspecified :troll:]\n\nIf you believe this was a mistake or wish to appeal, join the discord: discord.gg/EP9fNzmm8E")
    end

    if game.PlaceId == 5041144419 and table.find(BlacklistedUsers, PlayerClientID) == nil then
        env = {}
        env.player = game.Players.LocalPlayer
        env.character = game.Players.LocalPlayer.Character
        env.humanoid = game.Players.LocalPlayer.Character.Humanoid
        env.humroot = game.Players.LocalPlayer.Character.HumanoidRootPart
        local HttpService = game:GetService("HttpService")
        local timer = 0
        getgenv().spamRadio = false
        print("|-- Loaded Variables --|")

        settings = {}
        settings.NoClip = false;
        _G.AntiAfk = false;
        settings.ws = 14;
        settings.jp = 50;
        settings.silentaim = false;
        settings.aimtarget = "HumanoidRootPart";
        settings.accuracy = 100;
        settings.aimfov = 65;
        settings.autoreload = false;
        settings.aimignorelist = {};
        settings.wallbang = false;
        settings.instantreload = false;
        settings.modkick = false;
        settings.tweenspeed = 3000;
        settings.hbe = false;
        settings.hbesize = 5;
        settings.hbetrans = 0.7;
        settings.promptedjoinx = false;
        settings.instantrespawn = false;
        settings.spawnindeath = false;
        _G.HBEColor = Color3.new(0.639216, 0.635294, 0.647059)
        _G.O5Farm = false

        settings.esp = {}
        settings.esp.enabled = false;
        settings.esp.players = false;
        settings.esp.scps = false;
        settings.esp.boxes = true;
        settings.esp.tracers = false;

        settings.armscolor = Color3.fromRGB(235, 171, 255);
        settings.guncolor = Color3.fromRGB(235, 171, 255);

        settings.changearm = false;
        settings.changegun = false;

        settings.hidearms = false;
        settings.interactionclr = Color3.fromRGB(235, 171, 255);

        settings.gunmaterial = "ForceField";
        settings.armmaterial = "ForceField";

        settings.saving = {};
        settings.filename = "scproleplay.anomaly";

        --saving functions
        local function existsFile(name)
            if not readfile then return end
            return pcall(function()
                return readfile(name)
            end)
        end

        function Load()
            if not existsFile(settings.filename) then return end
            local _, Result = pcall(readfile, settings.filename);
            if _ then 
                local _, Table = pcall(HttpService.JSONDecode, HttpService, Result);
                if _ then
                    for i, v in pairs(Table) do
                        if settings[i] ~= nil  then
                            settings[i] = v;
                            pcall(settings[i], v);
                        end
                    end
                end
            end
        end

        function Save()
            if writefile then
                writefile(settings.filename, HttpService:JSONEncode(settings));
            end
        end

        Load()

        --//ESP SETTINGS
        local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Anomaly-hub/Anomalies-Scripts/main/kiriots%20esp", true))()
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-999") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-999"),{IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-457") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-457"),{IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-023") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-023"),{IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-049") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-049"),{IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-173") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-173"),{IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-066") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-066"),{IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-966"):FindFirstChild("Instance1") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-966").Instance1,{Name = "SCP-966", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-966"):FindFirstChild("Instance2") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-966").Instance2,{Name = "SCP-966", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-966"):FindFirstChild("Instance4") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-966").Instance4,{Name = "SCP-966", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-966"):FindFirstChild("Instance3") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-966").Instance3,{Name = "SCP-966", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-131"):FindFirstChild("Yellow") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-131").Yellow,{Name = "SCP-131", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-131"):FindFirstChild("Blue") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-131").Blue,{Name = "SCP-131", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-131"):FindFirstChild("Red") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-131").Red,{Name = "SCP-131", IsEnabled = "SCPs"})
        end
        if game:GetService("Workspace").SCPs:FindFirstChild("SCP-096"):FindFirstChild("Rig") then
            ESP:Add(game:GetService("Workspace").SCPs:FindFirstChild("SCP-096").Rig,{Name = "SCP-096", IsEnabled = "SCPs"})
        end
        ESP.Players = settings.esp.players
        ESP.Tracers = settings.esp.tracers
        ESP.Boxes = settings.esp.boxes
        ESP.SCPs = settings.esp.scps
        local NoclipEnabled = nil
        local reload = settings.autoreload
        --general functions
        local function calcduration(...)
            local plr=game.Players.LocalPlayer
            local args={...}
            if typeof(args[1])=="number"and args[2]and args[3]then
                args=Vector3.new(args[1],args[2],args[3])
            elseif typeof(args[1])=="Vector3" then
                args=args[1]    
            elseif typeof(args[1])=="CFrame" then
                args=args[1].Position
            end
            local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
            local distx = (dist/settings.tweenspeed)
            return distx
        end

        local function Reload()
            keypress("r")
            wait(0.2)
            keyrelease("r")
        end

        --[[function Remove(string)
            if string:find('%-') then return Remove(string:sub(1, -5)) else return string end
        end
        
        function IsA1(user)
            for _,v in pairs(user:GetDescendants()) do
                if v.ClassName == "BillboardGui" and v.Name == "Tag" then
                    local team = v:FindFirstChild("Team")
                    if Remove(team.Text) == "α" then
                        return true
                    else
                        return false
                    end
                end
            end
        end
        
        function IsO5(plr)
            if plr.Backpack:FindFirstChild("O5 Keycard") then
                return true
            else
                if plr.Character:FindFirstChild("O5 Keycard") then
                    return true
                else
                    return false
                end
            end
        end

        function FindClosestO5()
            local maxdist = math.huge
            local target = nil
            for _,v in pairs(game:GetService("Players"):GetPlayers()) do
                if IsO5(v) then
                    if v.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        local distFromPlr = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude
                        if distFromPlr < maxdist then
                            maxdist = distFromPlr
                            target = v
                        end
                    end
                end
            end
            if target then
                return target
            else 
                return nil
            end
        end

        local function Freeze()
            local LPlayer = game.Players.LocalPlayer
            local PlrChar = LPlayer.Character
            local PlrHumRoot = PlrChar.HumanoidRootPart
            if PlrHumRoot.Anchored == true then
                PlrHumRoot.Anchored = false
            elseif PlrHumRoot.Anchored == false then
                PlrHumRoot.Anchored = true
            end
        end

        local function TweenUnderPart(Part)
            local TweenSpeed = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Part:FindFirstChild("HumanoidRootPart").Position).Magnitude / 100
            game:GetService"TweenService":Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(TweenSpeed, Enum.EasingStyle.Quad), {CFrame = Part.HumanoidRootPart.CFrame * CFrame.new(0, -10, 0)}):Play()
        end]]

        local function GetPlayerFromShort(String)
            String = string.lower(String)
            for _,Player in pairs(game:GetService("Players"):GetPlayers()) do
                local PlayerName = string.lower(Player.Name)

                if string.match(PlayerName, "^"..String) then
                    return Player
                end
            end
        end

        local function tp(...)
            local plr=game.Players.LocalPlayer
            local args={...}
            if typeof(args[1])=="number"and args[2]and args[3]then
                args=Vector3.new(args[1],args[2],args[3])
            elseif typeof(args[1])=="Vector3" then
                args=args[1]    
            elseif typeof(args[1])=="CFrame" then
                args=args[1].Position
            end
            local dist=(plr.Character.HumanoidRootPart.Position-args).Magnitude
            local datween = game:GetService("TweenService"):Create(
                plr.Character.HumanoidRootPart,
                TweenInfo.new(dist/settings.tweenspeed,Enum.EasingStyle.Linear),
                {CFrame=CFrame.new(args)}
            ):Play()
        end

        local function NoclipLoop()
            if game.Players.LocalPlayer.Character ~= nil then
                for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                    if child:IsA("BasePart") and child.CanCollide == true then
                        child.CanCollide = false
                    end
                end
            end
        end

        local function ClearTable(tbl)
            for key in pairs(tbl) do
                tbl[key] = nil
            end
        end

        function notif(Title, Desc)
            game:GetService("StarterGui"):SetCore("SendNotification", {Title = Title, Text = Desc})
        end

        --//Silent Aim Variables
        local players = game:GetService("Players")
        local plr = players.LocalPlayer
        local mouse = plr:GetMouse()
        local camera = game.Workspace.CurrentCamera

        --//Silent Aim Functions
        function notBehindWall(target)
            local ray = Ray.new(plr.Character.HumanoidRootPart.Position, (target.Position - plr.Character.HumanoidRootPart.Position).Unit * 300)
            local part, position = game:GetService("Workspace"):FindPartOnRayWithIgnoreList(ray, {plr.Character}, false, true)
            if part then
                local humanoid = part.Parent:FindFirstChildOfClass("Humanoid")
                if not humanoid then
                    humanoid = part.Parent.Parent:FindFirstChildOfClass("Humanoid")
                end
                if humanoid and target and humanoid.Parent == target.Parent then
                    local pos, visible = camera:WorldToScreenPoint(target.Position)
                    if visible then
                        return true
                    end
                end
            end
            return false
        end

        function ClosestPlayerToMouse()
            local target = nil
            local dist = math.huge
            for i,v in pairs(players:GetPlayers()) do
                if v.Name ~= plr.Name then
                    if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") and v.TeamColor ~= plr.TeamColor then
                        for i,v in pairs(v.Character:GetChildren()) do
                            if v:IsA("Accessory") and v.Name == "Head" then
                                v.Name = "NotHead"
                            end
                        end
                        
                        local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                        local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
                        if check < dist then
                            if notBehindWall(v.Character.HumanoidRootPart) then
                                target  = v
                                dist = check
                            end 
                        end
                    end
                end
            end
            return target 
        end
        print("|-- Loaded Functions --|")

        --//Keycode Hooking
        local keycodeMap = {
            ["0"] = 0x30,
            ["1"] = 0x31,
            ["2"] = 0x32,
            ["3"] = 0x33,
            ["4"] = 0x34,
            ["5"] = 0x35,
            ["6"] = 0x36,
            ["7"] = 0x37,
            ["8"] = 0x38,
            ["9"] = 0x39,
            ["a"] = 0x41,
            ["b"] = 0x42,
            ["c"] = 0x43,
            ["d"] = 0x44,
            ["e"] = 0x45,
            ["f"] = 0x46,
            ["g"] = 0x47,
            ["h"] = 0x48,
            ["i"] = 0x49,
            ["j"] = 0x4A,
            ["k"] = 0x4B,
            ["l"] = 0x4C,
            ["m"] = 0x4D,
            ["n"] = 0x4E,
            ["o"] = 0x4F,
            ["p"] = 0x50,
            ["q"] = 0x51,
            ["r"] = 0x52,
            ["s"] = 0x53,
            ["t"] = 0x54,
            ["u"] = 0x55,
            ["v"] = 0x56,
            ["w"] = 0x57,
            ["x"] = 0x58,
            ["y"] = 0x59,
            ["z"] = 0x5A,
            ["enter"] = 0x0D,
            ["shift"] = 0x10,
            ["ctrl"] = 0x11,
            ["alt"] = 0x12,
            ["pause"] = 0x13,
            ["capslock"] = 0x14,
            ["spacebar"] = 0x20,
            ["pageup"] = 0x21,
            ["pagedown"] = 0x22,
            ["end"] = 0x23,
            ["home"] = 0x24,
            ["left"] = 0x25,
            ["up"] = 0x26,
            ["right"] = 0x27,
            ["down"] = 0x28,
            ["insert"] = 0x2D,
            ["delete"] = 0x2E,
            ["f1"] = 0x70,
            ["f2"] = 0x71,
            ["f3"] = 0x72,
            ["f4"] = 0x73,
            ["f5"] = 0x74,
            ["f6"] = 0x75,
            ["f7"] = 0x76,
            ["f8"] = 0x77,
            ["f9"] = 0x78,
            ["f10"] = 0x79,
            ["f11"] = 0x7A,
            ["f12"] = 0x7B,
        }
        local hook1
        local hook2
        hook1 = hookfunction(keypress, function(s)
            return hook1(keycodeMap[s:lower()])
        end)
        hook2 = hookfunction(keyrelease, function(s)
            return hook2(keycodeMap[s:lower()])
        end)

        spawn(function()
            print("> Spawned New Function")
            ui, library = loadstring(game:HttpGet("https://raw.githubusercontent.com/GoodBoy08/pancake.hub/pancake.hub/library/ui.lua", true))(); do
                warn("> UI Library Loaded")
                windows = {}
                folders = {}

                windows.scproleplay = ui:CreateWindow("SCP: Roleplay") do
                    folders.main = windows.scproleplay:AddFolder("Main") do
                        folders.main:AddToggle({
                            text = "No-Clip",
                            state = settings.NoClip,
                            callback = function(t)
                                if t == true then
                                    NoclipEnabled = game:GetService('RunService').Stepped:Connect(NoclipLoop)
                                elseif t == false then
                                    NoclipEnabled:Disconnect()
                                end
                            end
                        })

                        local firsttimerun = true
                        folders.main:AddToggle({
                            text = "Anti-AFK/EXP Farm",
                            state = _G.AntiAfk,
                            callback = function(State)
                                if firsttimerun == true then
                                    local part = Instance.new("Part")
                                    part.Parent = Workspace
                                    part.Position = Vector3.new(21, 18, 518)
                                    part.Anchored = true
                                    part.Size = Vector3.new(500,1,500)
                                    pcall(function()
                                        local decal = Instance.new("Decal")
                                        decal.Parent = part
                                        decal.Face = Enum.NormalId.Top
                                        decal.Texture = "http://www.roblox.com/asset/?id=2093843497"
                                        print("Added decal")
                                    end)
                                    firsttimerun = false
                                end
                                if State == true then
                                    notif("Warning!", "Dont go off-tab while farming, since doing so will break the auto-farm.")
                                    wait(.5)
                                end
                                if State == false then
                                    local args = {
                                        [1] = game.Players.LocalPlayer.Team.Name,
                                        [2] = false,
                                        [3] = false
                                    }
                                    game:GetService("ReplicatedStorage").Remotes.Spawn:InvokeServer(unpack(args))
                                end
                                spawn(function()
                                    _G.AntiAfk = State
                                    while _G.AntiAfk do
                                        local randomNumber = math.random(1,4)
                                        local durationOfPress = math.random(4,12)
                                        tp(21, 21, 518)
                                        wait(.5)
                                        if randomNumber == 1 then
                                            keypress("w")
                                            wait(durationOfPress)
                                            keyrelease("w")
                                            wait(1)
                                        elseif randomNumber == 2 then
                                            keypress("a")
                                            wait(durationOfPress)
                                            keyrelease("a")
                                            wait(1)
                                        elseif randomNumber == 3 then
                                            keypress("s")
                                            wait(durationOfPress)
                                            keyrelease("s")
                                            wait(1)
                                        elseif randomNumber == 4 then
                                            keypress("d")
                                            wait(durationOfPress)
                                            keyrelease("d")
                                            wait(1)
                                        end
                                    end
                                end)
                            end
                        })

                        folders.main:AddButton({
                            text = "Open Shop",
                            callback = function()
                                game:GetService("Players").LocalPlayer.PlayerGui.Utility.Handler.Click:Play()
                                game:GetService("Players").LocalPlayer.PlayerGui.Utility.Jerry:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), nil, nil, 0.5)
                            end
                        })

                        folders.main:AddButton({
                            text = "Open Customization",
                            callback = function()
                                game:GetService("Players").LocalPlayer.PlayerGui.Utility.Handler.Click:Play()
                                game:GetService("Players").LocalPlayer.PlayerGui.Utility.Customization:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), nil, nil, 0.5)
                            end
                        })

                        folders.main:AddToggle({
                            text = "Instant Respawn",
                            value = settings.instantrespawn,
                            callback = function(X)
                                settings.instantrespawn = X
                            end
                        })

                        folders.main:AddList({
                            text = "Recontain SCP",
                            values = {"SCP-173", "SCP-096"},
                            callback = function(selected)
                                if game.Players.LocalPlayer.Team.Name == "Mobile Task Force" or game.Players.LocalPlayer.Team.Name == "Rapid Response Team" then
                                    if selected == "SCP-096" then
                                        local args = {[1] = workspace.SCPs:FindFirstChild("SCP-096")}
                                        game:GetService("ReplicatedStorage").Remotes.Update:FireServer(unpack(args))
                                        notif("Success", "SCP-096 has been successfully recontained.")
                                    elseif selected == "SCP-173" then
                                        local args = {[1] = workspace.SCPs:FindFirstChild("SCP-173")}
                                        game:GetService("ReplicatedStorage").Remotes.Update:FireServer(unpack(args))
                                        notif("Success", "SCP-173 has been successfully recontained.")
                                    end
                                else
                                    notif("Error", "Join a team that has the ability to recontain SCPs (RRT, MTF).")
                                end
                            end
                        })

                        folders.main:AddButton({
                            text = "Become SCP-008",
                            callback = function()
                                if game.Players.LocalPlayer.Character.HumanoidRootPart.BrickColor.Name == "Olivine" then
                                    notif("Error", "You already are SCP-008-1.")
                                else
                                    local prevPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                    tp(527, 43, 393)
                                    repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart.BrickColor.Name == "Olivine"
                                    notif("Notice", "Waiting to bypass anti-cheat.")
                                    wait(5)
                                    tp(prevPos)
                                end
                            end
                        })
                        
                        folders.main:AddBox({
                            text = "Infect Player (SCP-008)",
                            value = "",
                            callback = function(input)
                                local infectionTarget = GetPlayerFromShort(input).Character:FindFirstChild("HumanoidRootPart")
                                if infectionTarget then    
                                    local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                    if game.Players.LocalPlayer.Character.HumanoidRootPart.BrickColor.Name ~= "Olivine" then
                                        tp(527, 43, 393)
                                        repeat wait() until game.Players.LocalPlayer.Character.HumanoidRootPart.BrickColor.Name == "Olivine"
                                        notif("Notice", "Waiting to bypass anti-cheat.")
                                        wait(5)
                                    end
                                    local AttemptsMade = 0
                                    repeat
                                        tp(infectionTarget.Position)
                                        wait(.1)
                                        AttemptsMade = AttemptsMade + 1
                                    until infectionTarget.BrickColor.Name == "Olivine" or AttemptsMade == 50
                                    if AttemptsMade == 50 then
                                        notif("Error", "Failed to infect player.")
                                    end
                                    tp(currentPos)
                                else
                                    notif("Error", "Failed to locate target.")
                                end
                            end
                        })

                        folders.main:AddButton({
                            text = "Infect with SCP-409",
                            callback = function()
                                local prevCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                                tp(-92, 36, -7)
                                notif("Notice", "Waiting to bypass anti-cheat")
                                wait(8)
                                tp(prevCFrame)
                            end
                        })

                        folders.main:AddButton({
                            text = "Authorize All",
                            callback = function()
                                if game.Players.LocalPlayer.Backpack:FindFirstChild("Authorize") then
                                    game.Players.LocalPlayer.Backpack:FindFirstChild("Authorize").Parent = game.Players.LocalPlayer.Character
                                    for _, player in pairs(game.Players:GetPlayers()) do
                                        if player.Team.Name == "Class - D" then
                                            local args = {[1] = player}
                                            game:GetService("ReplicatedStorage").Remotes.Authorize:FireServer(unpack(args))
                                        end
                                    end
                                elseif game.Players.LocalPlayer.Character:FindFirstChild("Authorize") then
                                    for _, player in pairs(game.Players:GetPlayers()) do
                                        if player.Team.Name == "Class - D" then
                                            local args = {[1] = player}
                                            game:GetService("ReplicatedStorage").Remotes.Authorize:FireServer(unpack(args))
                                        end
                                    end
                                else
                                    notif("Error", "Failed to locate the authorize tool.\nJoin a team that has this tool to use this feature.")
                                end
                            end
                        })
                    

                        folders.main:AddBox({
                            text = "Authorize Target",
                            values = CDTeam,
                            callback = function(val)
                                local authTarget = GetPlayerFromShort(val)
                                if authTarget then
                                    if game.Players.LocalPlayer.Backpack:FindFirstChild("Authorize") then
                                        game.Players.LocalPlayer.Backpack:FindFirstChild("Authorize").Parent = game.Players.LocalPlayer.Character
                                        local args = {[1] = authTarget}
                                        game:GetService("ReplicatedStorage").Remotes.Authorize:FireServer(unpack(args))
                                    elseif game.Players.LocalPlayer.Character:FindFirstChild("Authorize") then
                                        local args = {[1] = authTarget}
                                        game:GetService("ReplicatedStorage").Remotes.Authorize:FireServer(unpack(args))
                                    else
                                        notif("Error", "Failed to locate the authorize tool.\nJoin a team that has this tool to use this feature.")
                                    end
                                else
                                    notif("Error", "Failed to locate target.")
                                end
                            end
                        })

                        folders.main:AddButton({
                            text = "Anger SCP-096",
                            callback = function()
                                local plrPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                                tp(game:GetService("Workspace").SCPs["SCP-096"].Rig.Head.CFrame + game:GetService("Workspace").SCPs["SCP-096"].Rig.Head.CFrame.LookVector*3)
                                wait(calcduration(game:GetService("Workspace").SCPs["SCP-096"].Rig.Head.CFrame.Position)+0.2)
                                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.lookAt(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, game:GetService("Workspace").SCPs["SCP-096"].Rig.Head.Position)
                                notif("Notice", "If SCP-096 doesn't get angered, try looking at it manually.")
                                wait(4)
                                tp(812, 40, -71)
                                notif("Stay here", "You'll get teleported back to your original position when the time is right.")
                                wait(28)
                                tp(plrPos)
                            end
                        })

                        folders.main:AddToggle({
                            text = "Spam Radio",
                            state = false,
                            callback = function(state)
                                coroutine.wrap(function()
                                    spamRadio = state
                                    while spamRadio and wait(1) do                          
                                        local xxx = math.random(1,7)
                                        if xxx == 1 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50),string.rep("#",50)))
                                        elseif xxx == 2 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50),string.rep("e",50)))
                                        elseif xxx == 3 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50),string.rep("x",50)))
                                        elseif xxx == 4 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50),string.rep("t",50)))
                                        elseif xxx == 5 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50),string.rep("y",50)))
                                        elseif xxx == 6 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50),string.rep("f",50)))
                                        elseif xxx == 7 then
                                            game:GetService("ReplicatedStorage").Remotes.Radio:FireServer(string.format("%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s\n%s",string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50),string.rep("l",50)))
                                        end
                                    end
                                end)()
                            end
                        })
                    end

                    folders.combat = windows.scproleplay:AddFolder("Combat") do
                        folders.combat:AddButton({
                            text = "Grab SCAR-H",
                            callback = function()
                                if game.Players.LocalPlayer.Team.Name == "Class - D" then
                                    if timer < 120 then
                                        notif("Notice", "Patched for Class-D Team. (for now)")
                                    end
                                else
                                    loadstring(game:HttpGet("https://raw.githubusercontent.com/GoodBoy08/nil/main/Grab_SCAR-H.lua", nil))("❤");
                                end
                            end
                        })

                        folders.combat:AddToggle({
                            text = "Silent Aim",
                            value = settings.silentaim,
                            callback = function(state)
                                settings.silentaim = state
                            end
                        })

                        --[[folders.combat:AddToggle({
                            text = "Wallbang",
                            value = settings.wallbang,
                            callback = function(state)
                                if state == true then
                                    notif("Warning", "This feature is experimental. Maximum distance is ~150 studs.")
                                end
                                settings.wallbang = state
                            end
                        })]]

                        folders.combat:AddList({
                            text = "Silent Aim Target",
                            value = settings.aimtarget,
                            values = {"Head", "HumanoidRootPart", "LeftUpperArm", "LowerTorso", "UpperTorso", "RightUpperArm", "LeftLowerLeg", "RightLowerLeg", "RightUpperLeg", "LeftFoot", "RightFoot", "LeftUpperLeg", "RightLowerArm", "LeftLowerArm", "LeftHand", "RightHand"},
                            callback = function(Selected)
                                settings.aimtarget = Selected
                            end
                        })

                        folders.combat:AddSlider({
                            text = "Silent Aim Accuracy",
                            value = settings.accuracy,
                            min = 1,
                            max = 100,
                            callback = function(val)
                                settings.accuracy = val
                            end
                        })

                        folders.combat:AddBox({
                            text = "Aim FOV",
                            value = settings.aimfov,
                            callback = function(val)
                                if tonumber(val) == nil then
                                    notif("Error", "Please input a number\nRecommended value: 20-100")
                                else
                                    settings.aimfov = tonumber(val)
                                    for i,v in next,getgc(true)do
                                        if type(v)=='table'and rawget(v,'AimFOV')then
                                            v.AimFOV = tonumber(val)
                                        end
                                    end
                                end
                            end
                        })

                        folders.combat:AddButton({
                            text = "Light weapons",
                            callback = function()
                                for i,v in next,getgc(true)do
                                    if type(v)=='table'and rawget(v,'Weight')then
                                        v.Weight = tonumber(0.01)
                                    end
                                end
                            end
                        })

                        --[[folders.combat:AddToggle({
                            text = "Instant Reload",
                            value = settings.instantreload,
                            callback = function(State)
                                settings.instantreload = State
                                for i,v in next,getgc(true)do
                                    if type(v)=='table'and rawget(v,'AimFOV')then
                                        if State == true then
                                            v.Reload = 0.01
                                        elseif State == false then
                                            v.Reload = 3
                                        end
                                    end
                                end
                            end
                        })]]

                        folders.combat:AddToggle({
                            text = "Auto Reload",
                            value = settings.autoreload,
                            callback = function(state)
                                settings.autoreload = state
                                reload = state
                            end
                        })

                        folders.combat:AddToggle({
                            text = "Hitbox Expander",
                            value = settings.hbe,
                            callback = function(a)
                                settings.hbe = a
                            end
                        })

                        folders.combat:AddSlider({
                            text = "Size",
                            value = settings.hbesize,
                            min = 1,
                            max = 25,
                            callback = function(a)
                                settings.hbesize = a
                            end
                        })

                        folders.combat:AddSlider({
                            text = "Transparency",
                            value = settings.hbetrans,
                            min = 0,
                            max = 1,
                            float = 0.01,
                            callback = function(a)
                                settings.hbetrans = a 
                            end
                        })

                        folders.combat:AddColor({
                            text = "Color",
                            value = _G.HBEColor,
                            callback = function(x)
                                _G.HBEColor = x
                            end
                        })
                    end

                    folders.misc = windows.scproleplay:AddFolder("Miscellaneous") do
                        folders.misc:AddSlider({
                            text = "Tween Speed",
                            value = settings.tweenspeed,
                            min = 100,
                            max = 5000,
                            callback = function(val)
                                settings.tweenspeed = val
                            end
                        })

                        folders.misc:AddToggle({
                            text = "Kick on Moderator Join",
                            state = settings.modkick,
                            callback = function(state)
                                settings.modkick = state
                            end
                        })

                        folders.misc:AddSlider({
                            text = "Walkspeed",
                            value = settings.ws,
                            min = 1,
                            max = 500,
                            callback = function(val)
                                settings.ws = val
                                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
                            end
                        })

                        folders.misc:AddSlider({
                            text = "JumpPower",
                            value = settings.jp,
                            min = 10,
                            max = 500,
                            callback = function(val)
                                settings.jp = val
                                game.Players.LocalPlayer.Character.Humanoid.JumpPower = val
                            end
                        })

                        folders.misc:AddButton({
                            text = "Copy Discord Invite",
                            callback = function()
                                setclipboard("https://discord.gg/ReHyTEkqr7")
                            end
                        })

                        folders.misc:AddBind({
                            text = "Toggle GUI",
                            key = "RightControl",
                            callback = function()
                                ui:Close()
                            end
                        })

                        folders.misc:AddButton({
                            text = "RTHRO BigHead",
                            callback = function()
                                local LocalPlayer = game:GetService("Players").LocalPlayer
                                local Character = LocalPlayer.Character
                                local Humanoid = Character:FindFirstChildOfClass("Humanoid")
                                
                                function rm()
                                    for i,v in pairs(Character:GetDescendants()) do
                                        if v:IsA("BasePart") then
                                            if v.Name == "Handle" or v.Name == "Head" then
                                                if Character.Head:FindFirstChild("OriginalSize") then
                                                    Character.Head.OriginalSize:Destroy()
                                                end
                                            else
                                                for i,cav in pairs(v:GetDescendants()) do
                                                    if cav:IsA("Attachment") then
                                                        if cav:FindFirstChild("OriginalPosition") then
                                                            cav.OriginalPosition:Destroy()
                                                        end
                                                    end
                                                end
                                                v:FindFirstChild("OriginalSize"):Destroy()
                                                if v:FindFirstChild("AvatarPartScaleType") then
                                                    v:FindFirstChild("AvatarPartScaleType"):Destroy()
                                                end
                                            end
                                        end
                                    end
                                end
                                rm()
                                wait(0.5)
                                Humanoid:FindFirstChild("BodyProportionScale"):Destroy()
                                wait(1)
                                rm()
                                wait(0.5)
                                Humanoid:FindFirstChild("BodyHeightScale"):Destroy()
                                wait(1)
                                rm()
                                wait(0.5)
                                Humanoid:FindFirstChild("BodyWidthScale"):Destroy()
                                wait(1)
                                rm()
                                wait(0.5)
                                Humanoid:FindFirstChild("BodyDepthScale"):Destroy()
                                wait(1)
                                rm()
                                wait(0.5)
                                Humanoid:FindFirstChild("HeadScale"):Destroy()
                            end
                        })

                        folders.misc:AddButton({
                            text = "Save Settings",
                            callback = function()
                                Save()
                            end
                        })

                        folders.misc:AddButton({
                            text = "Chat Logger",
                            callback = function()
                                loadstring(game:HttpGet(('https://pastebin.com/raw/AFxchnr7'),true))()
                            end
                        })

                        folders.misc:AddButton({
                            text = "Rejoin", 
                            callback = function()
                                game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
                            end
                        })

                        folders.misc:AddButton({
                            text = "ServerHop",
                            callback = function()
                                local x = {}
                                for _, v in ipairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100")).data) do
                                    if type(v) == "table" and v.maxPlayers > v.playing and v.id ~= game.JobId then
                                        x[#x + 1] = v.id
                                    end
                                end
                                if #x > 0 then
                                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, x[math.random(1, #x)])
                                else
                                    notif("Serverhop","Failed to locate a server")
                                end
                            end
                        })

                        folders.misc:AddButton({
                            text = "Join Smallest Server",
                            callback = function()
                                local maxplayers = math.huge
                                local serversmaxplayer;
                                local goodserver;
                                local gamelink = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"

                                function serversearch()
                                    for _, v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink)).data) do
                                        if type(v) == "table" and maxplayers > v.playing then
                                            serversmaxplayer = v.maxPlayers
                                            maxplayers = v.playing
                                            goodserver = v.id
                                        end
                                    end
                                end

                                function getservers()
                                    serversearch()
                                    for i,v in pairs(game:GetService("HttpService"):JSONDecode(game:HttpGetAsync(gamelink))) do
                                        if i == "nextPageCursor" then
                                            if gamelink:find("&cursor=") then
                                                local a = gamelink:find("&cursor=")
                                                local b = gamelink:sub(a)
                                                gamelink = gamelink:gsub(b, "")
                                            end
                                            gamelink = gamelink .. "&cursor=" ..v
                                            getservers()
                                        end
                                    end
                                end

                                getservers()
                                print("All of the servers are searched") 
                                print("Server : " .. goodserver .. " Players : " .. maxplayers .. "/" .. serversmaxplayer)
                                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, goodserver)
                            end
                        })
                    end
                end
            
                windows.game = ui:CreateWindow("Game") do
                    folders.colors = windows.game:AddFolder("Colors") do
                        folders.colors:AddColor({
                            text = "Interaction Color",
                            color = Color3.fromRGB(255, 65, 65),
                            callback = function(a)
                                local cs = ColorSequence.new{
                                    ColorSequenceKeypoint.new(0, a),
                                    ColorSequenceKeypoint.new(1, a),
                                }

                                game:GetService("Workspace").InteractionBeam.Color = cs, 0.5
                            end
                        })
                    end
                    
                    folders.arms = windows.game:AddFolder("Arms") do
                        folders.arms:AddToggle({
                            text = "Change Arms", 
                            state = settings.changearm, 
                            callback = function(a) 
                                settings.changearm = a
                            end
                        })
                    
                        folders.arms:AddToggle({
                            text = "Change Gun",
                            state = settings.changegun,
                            callback = function(a) 
                                settings.changegun = a
                            end
                        })
                        
                        folders.arms:AddColor({
                            text = "Arms color",
                            color = settings.armscolor,
                            callback = function(a)
                                settings.armscolor = a
                            end
                        })
                    
                        folders.arms:AddColor({
                            text = "Gun color",
                            color = settings.guncolor,
                            callback = function(a)
                                settings.guncolor = a
                            end
                        })
                        
                        folders.arms:AddList({
                            text = "Gun Material", 
                            value = settings.gunmaterial, 
                            values = {"Plastic", "Wood", "Slate", "Concrete", "CorrodedMetal", "DiamondPlate", "Foil", "Grass", "Ice", "Marble", "Granite", "Brick", "Pebble", "Sand", "Fabric", "SmoothPlastic", "Metal", "WoodPlanks", "Cobblestone", "Water", "Rock", "Glacier", "Neon", "Glass", "ForceField"}, 
                            callback = function(a) 
                                settings.gunmaterial = a
                            end})
                        
                        folders.arms:AddList({
                            text = "Arms Material", 
                            value = settings.armmaterial, 
                            values = {"Plastic", "Wood", "Slate", "Concrete", "CorrodedMetal", "DiamondPlate", "Foil", "Grass", "Ice", "Marble", "Granite", "Brick", "Pebble", "Sand", "Fabric", "SmoothPlastic", "Metal", "WoodPlanks", "Cobblestone", "Water", "Rock", "Glacier", "Neon", "Glass", "ForceField"}, 
                            callback = function(a) 
                                settings.armmaterial = a
                            end
                        })
                        
                        folders.arms:AddToggle({
                            text = "Hide Arms",
                            state = settings.hidearms,
                            callback = function(a) 
                                settings.hidearms = a
                            end
                        })
                    end
                end
                
                windows.esp = ui:CreateWindow("ESP") do
                    windows.esp:AddToggle({
                        text = "Enabled",
                        state = settings.esp.enabled,
                        callback = function(state)
                            settings.esp.enabled = state
                            ESP:Toggle(state)
                        end
                    })

                    windows.esp:AddToggle({
                        text = "Show SCPs",
                        state = settings.esp.scps,
                        callback = function(state)
                            settings.esp.scps = state
                            ESP.SCPs = state
                        end
                    })

                    windows.esp:AddToggle({
                        text = "Show Players",
                        state = settings.esp.players,
                        callback = function(state)
                            settings.esp.players = state
                            ESP.Players = state
                        end
                    })

                    windows.esp:AddToggle({
                        text = "Boxes",
                        state = settings.esp.boxes,
                        callback = function(state)
                            settings.esp.boxes = state
                            ESP.Boxes = state
                        end
                    })

                    windows.esp:AddToggle({
                        text = "Tracers",
                        state = settings.esp.tracers,
                        callback = function(state)
                            settings.esp.tracers = state
                            ESP.Tracers = state
                        end
                    })
                end

                windows.tps = ui:CreateWindow("Teleports") do
                    windows.tps:AddBox({
                        text = "Teleport to Player",
                        value = "",
                        callback = function(input)
                            local TPTarget = GetPlayerFromShort(input)
                            if TPTarget then
                                tp(TPTarget.Character.HumanoidRootPart.Position)
                            else
                                notif("Error", "Failed to locate target.")
                            end
                        end
                    })

                    windows.tps:AddList({
                        text = "Sector-1 Teleports",
                        values = {"O5 Lounge", "Security Spawn", "Interrogation Room", "Intelligence Spawn", "Helipad", "Airlock"},
                        callback = function(Selected)
                            if Selected == "O5 Lounge" then
                                tp(CFrame.new(-493, 50, 111))
                            elseif Selected == "Security Spawn" then
                                tp(CFrame.new(-603, 40, -36))
                            elseif Selected == "Interrogation Room" then
                                tp(CFrame.new(-537, 40, 184))
                            elseif Selected == "Intelligence Spawn" then
                                tp(CFrame.new(-603, 40, 208))
                            elseif Selected == "Airlock" then
                                tp(CFrame.new(-573, 31, 502))
                            elseif Selected == "Helipad" then
                                tp(CFrame.new(-537, 40, 184))
                            end
                        end
                    })

                    windows.tps:AddList({
                        text = "Sector-2 Teleports",
                        values = {"Class-D Cells", "CDC Shop", "CDC", "Briefing Area - Left", "Briefing Area - Right", "CDC Viewing Area", "FP Item Shop", "SCP-131", "SCP-2950", "SCP-999", "SCP-066", "SCP-409", "SCP-1299", "SCP-173", "SCP-023", "SCP-002", "AD Spawn", "Nuclear Shelter", "Control Room", "Transformer Room", "ScD Spawn", "Medical Wing"},
                        callback = function(Selected)
                            if Selected == "Class-D Cells" then
                                tp(CFrame.new(60, 40, 566)) 
                            elseif Selected == "CDC Shop" then
                                tp(CFrame.new(-76, 40, 463)) 
                            elseif Selected == "CDC" then
                                tp(CFrame.new(21, 40, 517)) 
                            elseif Selected == "Briefing Area - Left" then
                                tp(CFrame.new(51, 40, 414))
                            elseif Selected == "Briefing Area - Right" then
                                tp(CFrame.new(-8, 40, 413))
                            elseif Selected == "CDC Viewing Area" then
                                tp(CFrame.new(21, 60, 471))
                            elseif Selected == "FP Item Shop" then
                                tp(CFrame.new(34, 40, 322))
                            elseif Selected == "SCP-131" then
                                tp(CFrame.new(-216, 40, 301))
                            elseif Selected == "SCP-2950" then
                                tp(CFrame.new(-213, 40, 191))
                            elseif Selected == "SCP-999" then
                                tp(CFrame.new(-282, 40, 37))
                            elseif Selected == "SCP-066" then
                                tp(CFrame.new(-218, 40, -37))
                            elseif Selected == "SCP-409" then
                                tp(CFrame.new(-86, 36, -23))
                            elseif Selected == "Medical Wing" then
                                tp(CFrame.new(66, 40, -152))
                            elseif Selected == "SCP-1299" then
                                tp(CFrame.new(143, 40, -68))
                            elseif Selected == "SCP-173" then
                                tp(CFrame.new(161, 40, 140)) 
                            elseif Selected == "SCP-023" then
                                tp(CFrame.new(260, 40, 248))
                            elseif Selected == "SCP-002" then
                                tp(CFrame.new(-80, 40, 134))
                            elseif Selected == "AD Spawn" then
                                tp(CFrame.new(-444, 46, 162))
                            elseif Selected == "Nuclear Shelter" then
                                tp(CFrame.new(232, 31, 503))
                            elseif Selected == "Control Room" then
                                tp(CFrame.new(110, 40, 238))
                            elseif Selected == "Transformer Room" then
                                tp(CFrame.new(-96, 40, -146))
                            elseif Selected == "ScD Spawn" then
                                tp(CFrame.new(304, 40, 31))
                            end
                        end
                    })

                    windows.tps:AddList({
                        text = "Sector-3 Teleports",
                        values = {"MTF Spawn", "SCP-008", "SCP-049", "SCP-966", "SCP-096", "SCP-457"},
                        callback = function(Selected)
                            if Selected == "MTF Spawn" then
                                tp(CFrame.new(414, 40, 87))
                            elseif Selected == "SCP-008" then
                                tp(CFrame.new(529, 40, 352))
                            elseif Selected == "SCP-049" then
                                tp(CFrame.new(606, 40, 51))
                            elseif Selected == "SCP-966" then
                                tp(CFrame.new(657, 40, 47))
                            elseif Selected == "SCP-096" then
                                tp(CFrame.new(662, 40, -122))
                            elseif Selected == "SCP-457" then
                                tp(CFrame.new(786, 40, -75))
                            end
                        end
                    })

                    windows.tps:AddList({
                        text = "Vent Teleports",
                        values = {"Chaos Spawn", "002 CC", "Sector 3", "Class-D Spawn", "Office"},
                        callback = function(Selected)
                            if Selected == "Chaos Spawn" then
                                tp(CFrame.new(-25.526582717896, 87.849990844727, 227.56085205078))
                            elseif Selected == "002 CC" then
                                tp(CFrame.new(-120.18432617188, 89.730033874512, 177.67097473145))
                            elseif Selected == "Sector 3" then
                                tp(CFrame.new(163.5218963623, 88.099983215332, 90.425483703613))
                            elseif Selected == "Class-D Spawn" then
                                tp(CFrame.new(-17.1471118927, 58.40113067627, 176.55815124512))
                            elseif Selected == "Office" then
                                tp(CFrame.new(-117.0629119873, 58.520290374756, -102.72993469238))
                            end
                        end
                    })
                end
            end
            ui:Init()
        end)

        --//Automatic stuff
        hookfunction(game.Players.LocalPlayer.Kick,function() return end)
        hookfunction(workspace.Loadstring.InvokeServer,function() return wait(9e9) end)
        print("> Anti-exploit disabled")

        game.Players.PlayerAdded:Connect(function(Player)
            PlayerName = Player.Name
            PlayerRank = Player:GetRoleInGroup(5479038)
            if Player:GetRankInGroup(5479038) >= 250 then
                game:GetService("StarterGui"):SetCore("SendNotification", {Title = "["..PlayerRank.."] "..PlayerName, Text = 'Moderator joined the game.'})
                if settings.modkick == true then
                    game.Players.LocalPlayer:kick("\n["..PlayerRank.."]".." "..PlayerName.."\nModerator joined the game \n\nYou can disable kicks in the misc section\nReport bugs here: https://discord.gg/EP9fNzmm8E")
                end
            end
        end)
        print("> Mod Detector Enabled")

        if game:GetService("Lighting"):FindFirstChild("HurtBlur") then
            game:GetService("Lighting").HurtBlur:remove()
            print("> Camera blur disabled")
        end

        game:GetService("Players").LocalPlayer.Idled:connect(function()
            game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
            wait(1)
            game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        end)
        print("> Anti-idle kick enabled")

        game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
            if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 21 then
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = settings.ws
            end
        end)

        spawn(function()
            local mt = getrawmetatable(game)
            local namecall = mt.__namecall
            setreadonly(mt,false)

            local OldNamecall
            OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                local args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "Shot" and method == "FireServer" then
                    local rndm = math.random(0,100)
                    if ClosestPlayerToMouse() ~= nil and settings.silentaim and settings.accuracy >= rndm then
                        args[1] = ClosestPlayerToMouse().Character:FindFirstChild(settings.aimtarget).Position
                        args[2] = ClosestPlayerToMouse().Character:FindFirstChild(settings.aimtarget)
                        return self.FireServer(self, unpack(args))
                    else
                        return self.FireServer(self, unpack(args))
                    end
                end 
            return OldNamecall(self, ...)
            end)
            print("> Silent Aim Ready")
        end)

        spawn(function()
            while wait(.5) do
                if reload then
                    if game:GetService("Players").LocalPlayer.PlayerGui.WeaponUI.Reload.Visible == true then
                        Reload()
                    end
                end
            end
        end)

        spawn(function()
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
                if settings.instantrespawn == true then
                    local args = {
                        [1] = game.Players.LocalPlayer.Team.Name,
                        [2] = false,
                        [3] = false
                    }
                    game:GetService("ReplicatedStorage").Remotes.Spawn:InvokeServer(unpack(args))
                end
            end)
        end)
        spawn(function()
            for _, player in pairs(game.Players:GetPlayers()) do
                PlayerName = player.Name
                PlayerRank = player:GetRankInGroup(5479038)
                PlayerRole = player:GetRoleInGroup(5479038)
                if PlayerRank >= 250 then
                    game:GetService("StarterGui"):SetCore("SendNotification", {Title = "["..PlayerRole.."] "..PlayerName, Text = 'Moderator currently in-game.'})
                end
            end
        end)

        spawn(function()
            if game:GetService("Players").LocalPlayer.PlayerGui.Utility.Version.Text ~= "PUBLISH 643" then
                game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Warning!", Text = "The game been updated since last inspected, some features may be broken or patched. Use the script at your own risk."})
            end
        end)

        game.Players.LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = settings.ws
        end)

        game.Players.LocalPlayer.CharacterAdded:Connect(function()
            timer = 0
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed < 21 then
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = settings.ws
                end
            end)

            game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("JumpPower"):Connect(function()
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = settings.jp
            end)
            spawn(function()
                game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Died:Connect(function()
                    if settings.instantrespawn == true then
                        local args = {
                            [1] = game.Players.LocalPlayer.Team.Name,
                            [2] = false,
                            [3] = false
                        }
                        game:GetService("ReplicatedStorage").Remotes.Spawn:InvokeServer(unpack(args))
                    end
                end)
            end)

            settings.ws = 14
            settings.jp = 50

            if _G.AntiAfk then
                game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                wait(3)
                tp(21, 23, 518)
            end
        end)

        

        spawn(function()
            game:GetService('RunService').Stepped:connect(function()
                if settings.hbe == true then 
                    pcall(function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer

                        for _, Player in pairs(Players:GetChildren()) do
                            if Player ~= LocalPlayer and Player.TeamColor ~= LocalPlayer.TeamColor then
                                local Character = Player.Character
                                Root = Character:FindFirstChild("HumanoidRootPart")
                                if Root then
                                    Root.Size = Vector3.new(settings.hbesize,settings.hbesize,settings.hbesize)
                                    Root.Transparency = settings.hbetrans
                                    Root.CanCollide = false
                                    Root.Material = Enum.Material.SmoothPlastic
                                    Root.Color = _G.HBEColor
                                end
                            end
                        end
                    end)
                end

                if settings.hbe == false then 
                    pcall(function()
                        local Players = game:GetService("Players")
                        local LocalPlayer = Players.LocalPlayer

                        for _, Player in pairs(Players:GetChildren()) do
                            if Player ~= LocalPlayer then
                                local Character = Player.Character
                                Root = Character:FindFirstChild("HumanoidRootPart")
                                if Root then
                                    Root.Size = Vector3.new(2, 0.400055, 1)
                                    Root.Transparency = 1
                                    Root.CanCollide = false 
                                    Root.Material = Enum.Material.SmoothPlastic  
                                end
                            end
                        end
                    end)
                end
            end)
        end)

        spawn(function()
            game.RunService.Heartbeat:Connect(function()
                pcall(function()
                    repeat wait() until game.Players.LocalPlayer.Character ~= nil;
                    repeat wait() until type(game.Players.LocalPlayer.Character) ~= nil;
                    
                    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R15 then
                        if settings.changearm then
                            game.Players.LocalPlayer.Character:FindFirstChild("LeftHand").Material = Enum.Material[settings.armmaterial];
                            game.Players.LocalPlayer.Character:FindFirstChild("RightHand").Material = Enum.Material[settings.armmaterial];
                            game.Players.LocalPlayer.Character:FindFirstChild("LeftLowerArm").Material = Enum.Material[settings.armmaterial];
                            game.Players.LocalPlayer.Character:FindFirstChild("RightLowerArm").Material = Enum.Material[settings.armmaterial];
                            game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperArm").Material = Enum.Material[settings.armmaterial];
                            game.Players.LocalPlayer.Character:FindFirstChild("RightUpperArm").Material = Enum.Material[settings.armmaterial];
            
                            game.Players.LocalPlayer.Character:FindFirstChild("LeftHand").Color = settings.armscolor;
                            game.Players.LocalPlayer.Character:FindFirstChild("RightHand").Color = settings.armscolor;
                            game.Players.LocalPlayer.Character:FindFirstChild("LeftLowerArm").Color = settings.armscolor;
                            game.Players.LocalPlayer.Character:FindFirstChild("RightLowerArm").Color = settings.armscolor;
                            game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperArm").Color = settings.armscolor;
                            game.Players.LocalPlayer.Character:FindFirstChild("RightUpperArm").Color = settings.armscolor;

                            if settings.changegun and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool") then
                                for i,v in pairs(game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):GetChildren()) do
                                    if v:IsA("MeshPart") then
                                        v.Material = Enum.Material[settings.gunmaterial];
                                        v.Color = settings.guncolor;
                                    end
                                end
                            end
                        end
                    end
                end)
            end)
        end)

        spawn(function()
            while wait(1) do
                timer = timer + 1
            end
        end)

        spawn(function()
            for _,v in pairs(game:GetService"Workspace":GetDescendants()) do
                if v:IsA("Decal") then
                    if math.random(1,500) == 69 then
                        pcall(function()
                            v.Texture = "http://www.roblox.com/asset/?id=2093843497"
                        end)
                    end
                end
            end
        end)
        
        spawn(function()
            game.RunService.Heartbeat:Connect(function()
                pcall(function()
                    if game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid").RigType == Enum.HumanoidRigType.R15 and not settings.changearm then
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand").Material = Enum.Material["Plastic"];
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand").Material = Enum.Material["Plastic"];
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftLowerArm").Material = Enum.Material["Plastic"];
                        game.Players.LocalPlayer.Character:FindFirstChild("RightLowerArm").Material = Enum.Material["Plastic"];
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperArm").Material = Enum.Material["Plastic"];
                        game.Players.LocalPlayer.Character:FindFirstChild("RightUpperArm").Material = Enum.Material["Plastic"];
            
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftHand").Color = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BodyColors")["LeftArmColor"];
                        game.Players.LocalPlayer.Character:FindFirstChild("RightHand").Color = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BodyColors")["RighttArmColor"];
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftLowerArm").Color = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BodyColors")["LeftArmColor"];
                        game.Players.LocalPlayer.Character:FindFirstChild("RightLowerArm").Color = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BodyColors")["RighttArmColor"];
                        game.Players.LocalPlayer.Character:FindFirstChild("LeftUpperArm").Color = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BodyColors")["LeftArmColor"];
                        game.Players.LocalPlayer.Character:FindFirstChild("RightUpperArm").Color = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("BodyColors")["RighttArmColor"];
                        if not settings.changegun then
                            for i,v in pairs(game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("Handle")) do
                                if v:IsA("MeshPart") then
                                    v.Material = Enum.Material["SmoothPlastic"];
                                    v.Color = Color3.fromRGB(1, 1, 1);
                                end
                            end
                        end
                    end
                end)
            end)
        end)
        
        spawn(function()
            if settings.promptedjoinx == false then
                settings.promptedjoinx = true
                local request = request or http_request or (syn and syn.request)
                if not request then return end
                local start = 6463
                local invCode = 'ReHyTEkqr7'
                for i = start-10, start+1 do
                    spawn(function()
                        pcall(function()
                            request({Url = "http://127.0.0.1:"..tostring(i).."/rpc?v=1",Method = "POST",Headers = {["Content-Type"] = "application/json",["Origin"] = "https://discord.com"},Body = game:GetService("HttpService"):JSONEncode({["cmd"] = "INVITE_BROWSER",["nonce"] = game:GetService("HttpService"):GenerateGUID(false),["args"] = {["invite"] = {["code"] = invCode,},["code"] = invCode}})})
                        end)
                    end)
                end
            end
        end)
    end
end
if game:GetService("Players").LocalPlayer.PlayerGui.Utility.Version.Text ~= "PUBLISH 643" then
    local Bindable = Instance.new("BindableFunction")
    Bindable.OnInvoke = function(txt)
        if txt == "Yes" then
            OpenGui()
        elseif txt == "No" then
            print("Prevented GUI Opening")
        end
    end

    game.StarterGui:SetCore("SendNotification",  {
        Title = "Warning";
        Text = "The game has updated since last inspected, would you still like to execute the script?";
        Icon = "";
        Duration = 5;
        Button1 = "Yes";
        Button2 = "No";
        Callback = Bindable;
    })
else
    OpenGui()
end
