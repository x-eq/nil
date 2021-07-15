getgenv().old = game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart.CFrame

tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(1.3, Enum.EasingStyle.Linear)
tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(-14.204594612122, 84.92, 221.37881469727)})
tween:Play()

wait(5)

tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(.5, Enum.EasingStyle.Linear)
tween = tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = old})
tween:Play()
