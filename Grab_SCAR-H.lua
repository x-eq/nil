-- to anomaly: it doesn't matter if its open sourced or not, a-lex just changes speed so if you get scar-h too fast and leave too fast it will kill

getgenv().old = game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame

game:GetService("Players")["LocalPlayer"].Character.Humanoid.PlatformStand = true
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(5, Enum.EasingStyle.Linear)
tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-12.204594612122, 99, 221.37881469727)})
tween:Play()

wait(10)

game:GetService("Players")["LocalPlayer"].Character.Humanoid.PlatformStand = false
tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(2, Enum.EasingStyle.Linear)
tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = old})
tween:Play()
