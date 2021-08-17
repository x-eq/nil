getgenv().Guns = {
    [string.lower("Fostech")] = "Fostech Origin";
    [string.lower("Mini")] = "Minigun";
    [string.lower("Scar")] = "Scar - H";
    [string.lower("APC")] = "ACP556 PDW";
    [string.lower("Spas")] = "Spas - 12";
    [string.lower("UMP")] = "UMP-45";
    [string.lower("Glock")] = "Glock 17";
    [string.lower("M4")] = "M4";
    [string.lower("ACR")] = "ACR";
    [string.lower("KV")] = "Kriss Vector";
    [string.lower("MPX")] = "MPX";
    [string.lower("MP5")] = "MP5";
}

getgenv().themes = {
    [1] = Color3.fromRGB(250, 206, 82),
    [2] = Color3.fromRGB(94, 134, 225),
    [3] = Color3.fromRGB(15, 219, 237),
    [4] = Color3.fromRGB(198, 163, 219),
    [5] = Color3.fromRGB(67, 105, 206),
    [6] = Color3.fromRGB(149, 196, 162),
    [7] = Color3.fromRGB(75, 11, 194),
    [8] = Color3.fromRGB(246, 132, 127),
    [9] = Color3.fromRGB(133, 43, 22),
    [10] = Color3.fromRGB(169, 14, 203),
    [11] = Color3.fromRGB(158, 174, 161),
    [12] = Color3.fromRGB(167, 149, 20),
    [13] = Color3.fromRGB(90, 36, 71),
    [14] = Color3.fromRGB(218, 196, 123),
    [15] = Color3.fromRGB(39, 243, 176),
    [16] = Color3.fromRGB(118, 190, 140),
    [17] = Color3.fromRGB(236, 2, 223),
    [18] = Color3.fromRGB(207, 178, 207),
    [19] = Color3.fromRGB(52, 54, 102),
    [20] = Color3.fromRGB(197, 138, 152)
}

getgenv().Color = themes[math.random(0, 20)]

spawn(function()
getgenv().HTTP = game.HttpService
getgenv().ReplStorage = game.ReplicatedStorage;
getgenv().Remotes = ReplStorage.Remotes;

getgenv().Loadstring = workspace:FindFirstChild("Loadstring");
if not Loadstring then
    repeat wait() until Loadstring
end;

getgenv().PlaceVersion = game.PlaceVersion, workspace.PlaceVersion;

getgenv().Player = game.Players.LocalPlayer
getgenv().Humanoid = Player.Character.Humanoid;

Utility = {};
Utility.Quests = Player.PlayerGui.Utility.Quests
Utility.Jerry = Player.PlayerGui.Utility.Jerry
Utility.O5 = Player.PlayerGui.Utility.O5
Utility.Gun = Player.PlayerGui.Utility.GunConfig

Utility.Open = function(obj)
    Player.PlayerGui.Utility.Handler.Click:Play()
    obj:TweenPosition(UDim2.new(0.5, 0, 0.5, 0), nil, nil, 0.5)
    return Player.PlayerGui.Utility.Handler.Click.IsPlaying
end

Utility.Modify = function(gun, suppressor, laser)
    local Gun = tostring(gun)
    local Suppressor = suppressor
    local Laser = laser

    Remotes.ChangeAttachment:FireServer(Gun, Suppressor, Laser)
end

Utility.Laser = function(gun, color)
    local Gun = tostring(gun)
    local Function = "LaserColor"
    local Color = (color == "blue" and true) or (color == "red" and false) or false

    game:GetService("ReplicatedStorage").Remotes.ChangeAttachment:FireServer(Gun, Function, Color)
end

Utility.Wear = function(gun, skin)
    local Gun = tostring(gun)
    local Skin = skin

    Remotes.StatsChange:FireServer(Gun, Skin)
end
end)

spawn(function()
if FOV then
    FOVCircle:Remove()
    FOVConnection:Disconnect()
end

getgenv().FOV = {};
FOV.Radius = 100;
FOV.Thickness = 1;
FOV.NumSides = 50;
FOV.Visible = true;
FOV.Filled = false;
FOV.Transparency = 1;
FOV.Color = Color;
        
local players = game:GetService("Players")
local plr = players.LocalPlayer
local mouse = plr:GetMouse()
local camera = game.Workspace.CurrentCamera

Utility.TeamCheck = Utility.TeamCheck or false
--//Silent Aim Functions
Utility.WallCheck = function(target)
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

Utility.GetClosest = function(target)
    local target = nil
    local dist = math.huge
    for i,v in pairs(players:GetPlayers()) do
        if v.Name ~= plr.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                if Utility.TeamCheck and v.TeamColor ~= plr.TeamColor then
                    for i,v in pairs(v.Character:GetChildren()) do
                        if v:IsA("Accessory") and v.Name == "Head" then
                            v.Name = "NotHead"
                        end
                    end
                    
                    local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
                    if check < dist and check <= FOV.Radius then
                        if notBehindWall(v.Character.HumanoidRootPart) then
                            target  = v
                            dist = check
                        end 
                    end
                elseif not Utility.TeamCheck then
                    for i,v in pairs(v.Character:GetChildren()) do
                        if v:IsA("Accessory") and v.Name == "Head" then
                            v.Name = "NotHead"
                        end
                    end
                    
                    local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
                    if check < dist and check <= FOV.Radius then
                        if notBehindWall(v.Character.HumanoidRootPart) then
                            target  = v
                            dist = check
                        end 
                    end
                end
            end
        end
    end
    return target 
end

getgenv().FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(0, 0)
FOVCircle.Radius = FOV.Radius
FOVCircle.Color = FOV.Color
FOVCircle.Thickness = FOV.Thickness
FOVCircle.Filled = FOV.Filled
FOVCircle.Visible = FOV.Visible
FOVCircle.Transparency = FOV.Transparency
FOVCircle.NumSides = FOV.NumSides

if FOV.Visible then
    FOVCircle.Radius = FOV.Radius
    FOVCircle.Color = FOV.Color
    FOVCircle.Thickness = FOV.Thickness
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y+36)
    FOVCircle.Filled = FOV.Filled
    FOVCircle.Visible = FOV.Visible
    FOVCircle.Transparency = FOV.Transparency
    FOVCircle.NumSides = FOV.NumSides
else
    FOVCircle.Transparency = 0
end

Update = function()
    FOVCircle.Radius = FOV.Radius
    FOVCircle.Color = FOV.Color
    FOVCircle.Thickness = FOV.Thickness
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y+36)
    FOVCircle.Filled = FOV.Filled
    FOVCircle.Visible = FOV.Visible
    FOVCircle.Transparency = FOV.Transparency
    FOVCircle.NumSides = FOV.NumSides
end

getgenv().FOVConnection = game.RunService.Heartbeat:Connect(Update)
end)
return Utility
