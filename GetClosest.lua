local SilentAim = {
    TeamCheck = false;
}
SilentAim.FOV = {};
SilentAim.FOV.Radius = 100;
SilentAim.FOV.Thickness = 1;
SilentAim.FOV.NumSides = 50;
SilentAim.FOV.Visible = true;
SilentAim.FOV.Filled = false;
SilentAim.FOV.Transparency = 1;
SilentAim.FOV.Color = Color3.fromRGB(255, 170, 0);

local players = game:GetService("Players")
local plr = players.LocalPlayer
local mouse = plr:GetMouse()
local camera = game.Workspace.CurrentCamera

--//Silent Aim Functions
SilentAim.WallCheck = function(target)
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

SilentAim.GetClosest = function()
    local target = nil
    local dist = math.huge
    for i,v in pairs(players:GetPlayers()) do
        if v.Name ~= plr.Name then
            if v.Character and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health ~= 0 and v.Character:FindFirstChild("HumanoidRootPart") then
                if SilentAim.TeamCheck and v.TeamColor ~= plr.TeamColor then
                    for i,v in pairs(v.Character:GetChildren()) do
                        if v:IsA("Accessory") and v.Name == "Head" then
                            v.Name = "NotHead"
                        end
                    end
                    
                    local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
                    if check < dist and check <= SilentAim.FOV.Radius then
                        if notBehindWall(v.Character.HumanoidRootPart) then
                            target  = v
                            dist = check
                        end 
                    end
                elseif not SilentAim.TeamCheck then
                    for i,v in pairs(v.Character:GetChildren()) do
                        if v:IsA("Accessory") and v.Name == "Head" then
                            v.Name = "NotHead"
                        end
                    end
                    
                    local screenpoint = camera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local check = (Vector2.new(mouse.X,mouse.Y)-Vector2.new(screenpoint.X,screenpoint.Y)).magnitude
                    if check < dist and check <= SilentAim.FOV.Radius then
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

local mouse = game.Players.LocalPlayer:GetMouse()

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(0, 0)
FOVCircle.Radius = SilentAim.FOV.Radius
FOVCircle.Color = SilentAim.FOV.Color
FOVCircle.Thickness = SilentAim.FOV.Thickness
FOVCircle.Filled = SilentAim.FOV.Filled
FOVCircle.Visible = SilentAim.FOV.Visible
FOVCircle.Transparency = SilentAim.FOV.Transparency
FOVCircle.NumSides = SilentAim.FOV.NumSides

if FOV.Visible then
    FOVCircle.Position = Vector2.new(0, 0)
    FOVCircle.Radius = SilentAim.FOV.Radius
    FOVCircle.Color = SilentAim.FOV.Color
    FOVCircle.Thickness = SilentAim.FOV.Thickness
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y+36)
    FOVCircle.Filled = SilentAim.FOV.Filled
    FOVCircle.Visible = SilentAim.FOV.Visible
    FOVCircle.Transparency = SilentAim.FOV.Transparency
    FOVCircle.NumSides = SilentAim.FOV.NumSides
else
    FOVCircle.Transparency = 0
end

Update = function()
    FOVCircle.Position = Vector2.new(0, 0)
    FOVCircle.Radius = SilentAim.FOV.Radius
    FOVCircle.Color = SilentAim.FOV.Color
    FOVCircle.Thickness = SilentAim.FOV.Thickness
    FOVCircle.Position = Vector2.new(mouse.X, mouse.Y+36)
    FOVCircle.Filled = SilentAim.FOV.Filled
    FOVCircle.Visible = SilentAim.FOV.Visible
    FOVCircle.Transparency = SilentAim.FOV.Transparency
    FOVCircle.NumSides = SilentAim.FOV.NumSides
end

game.RunService.Heartbeat:Connect(Update)

return SilentAim
