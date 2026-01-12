local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- === ScreenGui ===
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false
gui.DisplayOrder = 999999999

-- === Frame principal ===
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,250,0,140)
frame.Position = UDim2.new(0.7,0,0.3,0)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0
frame.Parent = gui

local frameCorner = Instance.new("UICorner")
frameCorner.CornerRadius = UDim.new(0,10)
frameCorner.Parent = frame

-- === RGB efecto ===
spawn(function()
    while task.wait(0.03) do
        frame.BackgroundColor3 = Color3.fromHSV(tick()%5/5,1,1)
    end
end)

-- === Texto By Denier ===
local label = Instance.new("TextLabel")
label.Size = UDim2.new(1,0,0,30)
label.Position = UDim2.new(0,0,0,-30)
label.BackgroundTransparency = 1
label.Text = "By Denier"
label.TextColor3 = Color3.new(1,1,1)
label.Font = Enum.Font.GothamBold
label.TextScaled = true
label.Parent = frame

-- === Botón cerrar ===
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0,30,0,30)
closeButton.Position = UDim2.new(1,-35,0,5)
closeButton.BackgroundColor3 = Color3.fromRGB(150,0,0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1,1,1)
closeButton.Parent = frame
local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0,6)
closeCorner.Parent = closeButton

-- === Botón minimizar ===
local minimizeButton = Instance.new("TextButton")
minimizeButton.Size = UDim2.new(0,30,0,30)
minimizeButton.Position = UDim2.new(1,-70,0,5)
minimizeButton.BackgroundColor3 = Color3.fromRGB(70,70,70)
minimizeButton.Text = "_"
minimizeButton.TextColor3 = Color3.new(1,1,1)
minimizeButton.Parent = frame
local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(0,6)
minCorner.Parent = minimizeButton

-- === Botón velocidad ===
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

-- === Input velocidad ===
local speedInput = Instance.new("TextBox")
speedInput.Size = UDim2.new(0.8,0,0.3,0)
speedInput.Position = UDim2.new(0.1,0,0.7,0)
speedInput.PlaceholderText = "Máximo 100"
speedInput.TextColor3 = Color3.new(1,1,1)
speedInput.BackgroundColor3 = Color3.fromRGB(50,50,50)
speedInput.Parent = frame
local inputCorner = Instance.new("UICorner")
inputCorner.CornerRadius = UDim.new(0,6)
inputCorner.Parent = speedInput

-- === Bola flotante con imagen anime waifu cute ===
local ball = Instance.new("ImageButton")
ball.Size = UDim2.new(0,60,0,60)
ball.Position = UDim2.new(0.5,0,0.5,0)
ball.BackgroundTransparency = 1
ball.Visible = false
ball.Active = true
ball.Draggable = true
ball.Image = "https://i.imgur.com/5bOzi1A.png" -- Waifu cute
ball.Parent = gui

local ballCorner = Instance.new("UICorner")
ballCorner.CornerRadius = UDim.new(1,0)
ballCorner.Parent = ball

-- === Velocidad hasta 100 ===
speedButton.MouseButton1Click:Connect(function()
	local sp = tonumber(speedInput.Text)
	if sp and sp > 0 and sp <= 100 then
		humanoid.WalkSpeed = sp
	end
end)

-- === Botones cerrar/minimizar/restaurar ===
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

-- === Reconectar R6/R15 ===
player.CharacterAdded:Connect(function(char)
	character = char
	humanoid = char:WaitForChild("Humanoid")
end)