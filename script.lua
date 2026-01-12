local Players = game:GetService("Players")
local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
end)

local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999999

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,250,0,140)
frame.Position = UDim2.new(0.7,0,0.3,0)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0,10)
corner.Parent = frame

spawn(function()
	while task.wait(0.03) do
		frame.BackgroundColor3 = Color3.fromHSV(tick()%5/5,1,1)
	end
end)

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1,0,0,25)
label.BackgroundTransparency = 1
label.Text = "By Denier"
label.TextColor3 = Color3.new(1,1,1)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.Parent = frame

local speedButton = Instance.new("TextButton")
speedButton.Size = UDim2.new(0.8,0,0.3,0)
speedButton.Position = UDim2.new(0.1,0,0.35,0)
speedButton.Text = "Velocidad"
speedButton.TextColor3 = Color3.new(1,1,1)
speedButton.BackgroundColor3 = Color3.fromRGB(60,60,60)
speedButton.Parent = frame

local speedCorner = Instance.new("UICorner")
speedCorner.CornerRadius = UDim.new(0,6)
speedCorner.Parent = speedButton

local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.8,0,0.3,0)
speedInput.Position = UDim2.new(0.1,0,0.7,0)
speedInput.PlaceholderText = "Máximo 100"
speedInput.TextColor3 = Color3.new(1,1,1)
speedInput.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedInput.Parent = frame

local iCorner = Instance.new("UICorner")
iCorner.CornerRadius = UDim.new(0,6)
iCorner.Parent = speedInput

speedButton.MouseButton1Click:Connect(function()
	local sp = tonumber(speedInput.Text)
	if sp and sp > 0 and sp <= 100 then
		humanoid.WalkSpeed = sp
	end
end)

local ball = Instance.new("ImageButton")
ball.Size = UDim2.new(0,60,0,60)
ball.BackgroundTransparency = 1
ball.Image = "https://i.imgur.com/5bOzi1A.png"
ball.Visible = false
ball.Active = true
ball.Draggable = true
ball.Parent = gui

local bCorner = Instance.new("UICorner")
bCorner.CornerRadius = UDim.new(1,0)
bCorner.Parent = ball

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,30,0,30)
closeButton.Position = UDim2.new(1,-35,0,5)
closeButton.BackgroundColor3 = Color3.fromRGB(150,0,0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = frame

local cCorner = Instance.new("UICorner")
cCorner.CornerRadius = UDim.new(0,6)
cCorner.Parent = closeButton

local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0,30,0,30)
minimizeButton.Position = UDim2.new(1,-70,0,5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.new(1,1,1)
minimizeButton.Parent = frame

local mCorner = Instance.new("UICorner")
mCorner.CornerRadius = UDim.new(0,6)
mCorner.Parent = minimizeButton

closeButton.MouseButton1Click:Connect(function()
	gui:Destroy()
end)

minimizeButton.MouseButton1Click:Connect(function()
	frame.Visible = false
	ball.Visible = true
end)

ball.MouseButton1Click:Connect(function()
	frame.Visible = true
	ball.Visible = false
end)
