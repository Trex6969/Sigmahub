local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local loaderGui = Instance.new("ScreenGui", CoreGui)
loaderGui.Name = "ExecutorGui"

local scripts = {
	{ name = "Rivals", url = "https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/rivals.lua" },
	{ name = "Phantom Forces", link = "https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/pf_lite_rewrite_demo" },
	{ name = "Bad Business", link = "https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/bad_business.lua" },
	{ name = "Universal", link = "https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/universal.lua" },
	{ name = "Fisch", link = "https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/fisch.lua" },
	{ name = "Scorched Earth", link = "https://raw.githubusercontent.com/dementiaenjoyer/homohack/main/scorched_earth.lua" },
}

local frame = Instance.new("Frame", loaderGui)
frame.Size = UDim2.new(0, 220, 0, 300)
frame.Position = UDim2.new(0.5, -110, 0.5, -150)
frame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
frame.Active = true
frame.Draggable = true
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
title.Text = "Executor"
title.Font = Enum.Font.RobotoMono
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.BorderSizePixel = 0

local scrollingFrame = Instance.new("ScrollingFrame", frame)
scrollingFrame.Size = UDim2.new(1, -10, 1, -40)
scrollingFrame.Position = UDim2.new(0, 5, 0, 35)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, #scripts * 35)
scrollingFrame.BackgroundTransparency = 1
scrollingFrame.ScrollBarThickness = 5

local layout = Instance.new("UIListLayout", scrollingFrame)
layout.Padding = UDim.new(0, 5)

for _, scriptData in ipairs(scripts) do
	local button = Instance.new("TextButton", scrollingFrame)
	button.Size = UDim2.new(1, -10, 0, 30)
	button.BackgroundColor3 = Color3.fromRGB(14, 14, 14)
	button.TextColor3 = Color3.fromRGB(255, 255, 255)
	button.Font = Enum.Font.RobotoMono
	button.TextSize = 12
	button.Text = "Load " .. script.name

	button.MouseButton1Click:Connect(function()
		loaderGui:Destroy()
		loadstring(game:HttpGet(script.link))()
	end)
end

local stroke = Instance.new("UIStroke", frame)
stroke.Color = Color3.fromRGB(24, 24, 24)
stroke.Thickness = 2
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local gradient = Instance.new("UIGradient", stroke)
gradient.Color = ColorSequence.new({
	ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 70, 73)),
	ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 200, 255))
})

RunService.Heartbeat:Connect(function()
	gradient.Rotation += 4
end)

for _, scriptInfo in ipairs(scripts) do
	local btn = Instance.new("TextButton", scrollingFrame)
	btn.Size = UDim2.new(1, 0, 0, 30)
	btn.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
	btn.Font = Enum.Font.RobotoMono
	btn.Text = "Load " .. scriptInfo.name
	btn.TextColor3 = Color3.fromRGB(255, 255, 255)
	btn.TextSize = 14
	btn.BorderSizePixel = 0

	btn.MouseButton1Click:Connect(function()
		loaderGui:Destroy()
		if scriptInfo.name == "Scorched Earth" and game.GameId ~= 4785126950 then
			local TeleportService = game:GetService("TeleportService")
			TeleportService:Teleport(13794093709, Players.LocalPlayer)
			queue_on_teleport('repeat task.wait() until game:IsLoaded(); loadstring(game:HttpGet("'..scriptInfo.link..'"))();')
		else
			loadstring(game:HttpGet(scriptInfo.link))()
		end
	end)
end```
