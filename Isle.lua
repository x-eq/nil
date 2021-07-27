do 
    pcall(function()
        spawn(function()
            --[[ Many anticheat bypasses. ]]--
                    
            workspace.Services.P:Destroy()
    
            hookfunction(workspace.Services.Kick.InvokeServer, newcclosure(function()
                return wait(9e0);
            end))
            
            hookfunction(workspace.Services.S.InvokeServer, newcclosure(function()
                return wait(9e0);
            end))
    
            hookfunction(workspace.Services.C.InvokeServer, newcclosure(function()
                return wait(9e0);
            end))
    
            hookfunction(workspace.Services.T.InvokeServer, newcclosure(function()
                return wait(9e0);
            end))
    
            hookfunction(workspace.Services.RigBypass.Fire, newcclosure(function()
                return wait(9e0);
            end))
    
            hookfunction(workspace.Services.Float.Fire, newcclosure(function()
                return wait(9e0);
            end))
    
            local mt = getrawmetatable(game)
            local namecall = mt.__namecall
            setreadonly(mt,false)
    
            local OldNamecall
            OldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                local args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "Kick" and method == "InvokeServer" then
                    return wait(9e0)
                else
                    return OldNamecall(self, ...)
                end
            end)
        end)
    
        SContext = game:GetService("ScriptContext");
        RunService = game:GetService("RunService");
        Players = game:FindFirstChildWhichIsA("Players");
        Character = Players.LocalPlayer.Character
    
        for i, c in ipairs(getconnections(SContext.Error)) do
            c:Disable();
        end
        
        Character:FindFirstChild("Event"):Destroy();
    
        spawn(function()
            RunService.Heartbeat:Connect(function()
                pcall(function()
                    if Character:FindFirstChild("Humanoid") then -- Checking if character is still alive.
                        Character:FindFirstChild("UnderWater").Value = true;
                        
                        -- Somehow that bypasses anticheat.
                                        
                        firetouchinterest(Character.HumanoidRootPart, Character.HumanoidRootPart, 0);
                        firetouchinterest(Character.HumanoidRootPart, Character.HumanoidRootPart, 1);
                        firetouchinterest(Character.HumanoidRootPart, Character.UpperTorso, 0);
                        firetouchinterest(Character.HumanoidRootPart, Character.UpperTorso, 1);
                        firetouchinterest(Character.HumanoidRootPart, Character.LowerTorso, 0);
                        firetouchinterest(Character.HumanoidRootPart, Character.LowerTorso, 1);
                        firetouchinterest(Character.HumanoidRootPart, Character.Head, 0);
                        firetouchinterest(Character.HumanoidRootPart, Character.Head, 1);
        
                        firetouchinterest(Character.NCCheck, Character.HumanoidRootPart, 0);
                        firetouchinterest(Character.NCCheck, Character.HumanoidRootPart, 1);
                        firetouchinterest(Character.NCCheck, Character.UpperTorso, 0);
                        firetouchinterest(Character.NCCheck, Character.UpperTorso, 1);
                        firetouchinterest(Character.NCCheck, Character.LowerTorso, 0);
                        firetouchinterest(Character.NCCheck, Character.LowerTorso, 1);
                        firetouchinterest(Character.NCCheck, Character.Head, 0);
                        firetouchinterest(Character.NCCheck, Character.Head, 1);
                    end
                end)
            end)
        end)
    end)
end

Values = {};
Values.Walkspeed = 16;
Values.ChangeWalkspeed = false;

Values.Keybinds = {};
Values.Keybinds.Speed = 16;

Sliders = {};

Library = loadstring(game:HttpGet("https://pastebin.com/raw/edJT9EGX", true))();
Main, Keybinds = Library:CreateWindow("Isle."), Library:CreateWindow("Keybinds.");
Lab = Main:AddFolder("Laboratory")
Misc = Main:AddFolder("Misc");

Misc:AddButton({
    text = "Teleport to spawn.", 
    callback = function(a) 
        firetouchinterest(game:GetService("Workspace").GameIntro.Seat, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(game:GetService("Workspace").GameIntro.Seat, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
    end
})

Misc:AddButton({
    text = "Random Teleport.", 
    callback = function(a) 
        firetouchinterest(game:GetService("Workspace").SpecialRegions.Anomaly2, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
        firetouchinterest(game:GetService("Workspace").SpecialRegions.Anomaly2, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
    end
})

Misc:AddButton({
    text = "Inf-Oxygen.", 
    callback = function(a) 
        Character:FindFirstChild("Diving"):FindFirstChild("M"):Destroy();
    end
})

Lab:AddButton({
    text = "Open docs door.", 
    callback = function(a)
        fireclickdetector(game:GetService("Workspace").Gate.Buttons.Open.ClickDetector)
    end
})

Lab:AddButton({
    text = "Open Wing-B.", 
    callback = function(a)
        fireclickdetector(game:GetService("Workspace")["WING B BUTTON"].OpenWingBButton.ClickDetector)
    end
})

Lab:AddButton({
    text = "Disable Tripwires.", 
    callback = function(a) 
        for i,v in pairs(game:GetDescendants()) do
            if v:IsA("TouchInterest") and v.Parent.Name == "BombMain" then
                fireclickdetector(v)
            end
        end
    end
})

Lab:AddButton({
    text = "Delete lab laser trigger.", 
    callback = function(a) 
        game:GetService("Workspace").Facility.LaserHallway.LaserTrigger:Destroy()
        game:GetService("Workspace").Facility.LaserHallway.Barrier:Destroy()
    end
})

Lab:AddButton({
    text = "Delete lab guillotine.", 
    callback = function(a)
        game:GetService("Workspace").Guillotine.Trigger:Destroy()
        game:GetService("Workspace").Guillotine.Trigger2:Destroy()
    end
})

Lab:AddButton({
    text = "Delete Turret-Reveal Trigger.", 
    callback = function(a) 
        game:GetService("Workspace").Turret.Trigger:Destroy()
        game:GetService("Workspace").Turret.Trigger:Destroy()
    end
})

Lab:AddButton({
    text = "Trigger guillotine.", 
    callback = function(a)
        firetouchinterest(game:GetService("Workspace").Guillotine.Trigger, Character.HumanoidRootPart, 0)
        firetouchinterest(game:GetService("Workspace").Guillotine.Trigger2, Character.HumanoidRootPart, 0)
        firetouchinterest(game:GetService("Workspace").Guillotine.Trigger, Character.HumanoidRootPart, 1)
        firetouchinterest(game:GetService("Workspace").Guillotine.Trigger2, Character.HumanoidRootPart, 1)
    end
})

Lab:AddButton({
    text = "Trigger Laser Trap.", 
    callback = function(a) 
        firetouchinterest(game:GetService("Workspace").Facility.LaserHallway.LaserTrigger, Character.HumanoidRootPart, 0)
        firetouchinterest(game:GetService("Workspace").Facility.LaserHallway.LaserTrigger, Character.HumanoidRootPart, 1)
    end
})

Lab:AddButton({
    text = "Trigger Turret-Reveal.", 
    callback = function(a) 
        firetouchinterest(game:GetService("Workspace").Turret.Trigger, Character.HumanoidRootPart, 0)
        firetouchinterest(game:GetService("Workspace").Turret.Trigger, Character.HumanoidRootPart, 1)
    end
})

Main:AddToggle({
    text = "Change WalkSpeed.", 
    state = Values.ChangeWalkspeed, 
    callback = function(a) 
        Values.ChangeWalkspeed = a
    end
})

Sliders.WalkSpeed = Main:AddSlider({
    text = "WalkSpeed.", 
    value = Values.Keybinds.Speed, 
    min = Values.Walkspeed, 
    max = 100, 
    float = 0.1, 
    callback = function(a) 
        Values.Walkspeed = tonumber(a)
    end
})

Keybinds:AddBind({
    text = "Change speed to:", 
    key = "KeypadPlus", 
    callback = function() 
        Sliders.WalkSpeed:SetValue(Values.Keybinds.Speed)
    end
})

Keybinds:AddSlider({
    text = "Value.", 
    value = Values.Keybinds.Speed, 
    min = Values.Keybinds.Speed, 
    max = 100, 
    float = 0.1, 
    callback = function(a) 
        Values.Keybinds.Speed = tonumber(a)
    end
})

Library:Init()

spawn(function()
    RunService.Heartbeat:Connect(function()
        pcall(function()
            if game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild("BodyVelocity") then
                game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild("BodyVelocity"):Destroy()
               game.Players.LocalPlayer.Character.UpperTorso:FindFirstChild("BodyGyro"):Destroy()
           end
           
           velocity = Instance.new("BodyVelocity")
           velocity.maxForce = Vector3.new(100000, 0, 100000)
           
           gyro = Instance.new("BodyGyro")
           gyro.maxTorque = Vector3.new(100000, 0, 100000)
           
           local hum = game.Players.LocalPlayer.Character.Humanoid
           
           if Values.ChangeWalkspeed then
               velocity.Parent = game.Players.LocalPlayer.Character.UpperTorso
               velocity.velocity = (hum.MoveDirection) * Values.Walkspeed
               gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
               while true do
               	   if not Values.ChangeWalkspeed then break end
                   pcall(function()
                       velocity.velocity = (hum.MoveDirection) * Values.Walkspeed
                       local refpos = gyro.Parent.Position + (gyro.Parent.Position - workspace.CurrentCamera.CoordinateFrame.p).unit * 5
                       gyro.cframe = CFrame.new(gyro.Parent.Position, Vector3.new(refpos.x, gyro.Parent.Position.y, refpos.z))
                       wait(0.1)
                   end)
               end
           else
               velocity.Parent = nil
               gyro.Parent = nil
           end
        end)
    end)
end)
