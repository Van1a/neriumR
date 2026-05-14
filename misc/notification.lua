getgenv().env = getrenv()

local TweenService = cloneref(game:GetService("TweenService"))
local Players      = cloneref(game:GetService("Players"))
local SoundService = cloneref(game:GetService("SoundService"))
local C            = newcclosure

local DEFAULTS = {
	icon         = "rbxassetid://10709775560",
	duration     = 3,
	width        = 680,
	height       = 46,

	accentColor  = Color3.fromRGB(52, 211, 153),
	bgColor      = Color3.fromRGB(16, 16, 22),
	bgColorTop   = Color3.fromRGB(26, 26, 36),
	textColor    = Color3.fromRGB(220, 220, 235),

	soundEnabled = true,
	soundId      = "rbxassetid://83059242168617",
	soundVolume  = 1,
	soundSpeed   = 1,
}

local SMALL_WIDTH = 46
local TOP_OFFSET  = 14

local showNotification = C(function(message, opts)
	opts = opts or {}

	local icon          = opts.icon          or DEFAULTS.icon
	local holdDuration  = opts.duration      or DEFAULTS.duration
	local FULL_WIDTH    = opts.width         or DEFAULTS.width
	local BAR_HEIGHT    = opts.height        or DEFAULTS.height
	local accentColor   = opts.accentColor   or DEFAULTS.accentColor
	local bgColor       = opts.bgColor       or DEFAULTS.bgColor
	local bgColorTop    = opts.bgColorTop    or DEFAULTS.bgColorTop
	local textColor     = opts.textColor     or DEFAULTS.textColor

	local soundEnabled  = opts.soundEnabled
	if soundEnabled == nil then
		soundEnabled = DEFAULTS.soundEnabled
	end

	local soundId       = opts.soundId     or DEFAULTS.soundId
	local soundVolume   = opts.soundVolume or DEFAULTS.soundVolume
	local soundSpeed    = opts.soundSpeed  or DEFAULTS.soundSpeed

	local iconBgColor = Color3.fromRGB(
		math.clamp(accentColor.R * 255, 0, 255),
		math.clamp(accentColor.G * 255, 0, 255),
		math.clamp(accentColor.B * 255, 0, 255)
	)

	local G2L = {}

	G2L["1"] = Instance.new("ScreenGui")
	G2L["1"].Name           = "notification"
	G2L["1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	G2L["1"].ResetOnSpawn   = false
	G2L["1"].IgnoreGuiInset = true
	G2L["1"].DisplayOrder   = 2147483647
	G2L["1"].Parent         = gethui()

	if soundEnabled then
		local sound = Instance.new("Sound")
		sound.Name          = "notif_sound"
		sound.SoundId       = soundId
		sound.Volume        = soundVolume
		sound.PlaybackSpeed = soundSpeed
		sound.Parent        = G2L["1"]

		G2L["sound"] = sound

		task.spawn(function()
			pcall(function()
				sound:Play()
			end)
		end)
	end

	G2L["2"] = Instance.new("Frame", G2L["1"])
	G2L["2"].Name             = "notifbar"
	G2L["2"].BorderSizePixel  = 0
	G2L["2"].BackgroundColor3 = bgColor
	G2L["2"].BorderColor3     = Color3.fromRGB(0, 0, 0)
	G2L["2"].AnchorPoint      = Vector2.new(0.5, 0)
	G2L["2"].Size             = UDim2.new(0, SMALL_WIDTH, 0, BAR_HEIGHT)
	G2L["2"].Position         = UDim2.new(0.5, 0, 0, -BAR_HEIGHT - 4)
	G2L["2"].ClipsDescendants = true

	G2L["3"] = Instance.new("UICorner", G2L["2"])
	G2L["3"].CornerRadius = UDim.new(0, 12)

	G2L["grad"] = Instance.new("UIGradient", G2L["2"])
	G2L["grad"].Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, bgColorTop),
		ColorSequenceKeypoint.new(1, bgColor),
	})
	G2L["grad"].Rotation = 90

	G2L["5"] = Instance.new("UIStroke", G2L["2"])
	G2L["5"].Color        = Color3.fromRGB(255, 255, 255)
	G2L["5"].Transparency = 0.88
	G2L["5"].Thickness    = 1

	G2L["accent"] = Instance.new("Frame", G2L["2"])
	G2L["accent"].Name             = "accent"
	G2L["accent"].BorderSizePixel  = 0
	G2L["accent"].BackgroundColor3 = accentColor
	G2L["accent"].Size             = UDim2.new(0, 3, 0.6, 0)
	G2L["accent"].AnchorPoint      = Vector2.new(0, 0.5)
	G2L["accent"].Position         = UDim2.new(0, 0, 0.5, 0)

	Instance.new("UICorner", G2L["accent"]).CornerRadius = UDim.new(0, 4)

	G2L["iconbg"] = Instance.new("Frame", G2L["2"])
	G2L["iconbg"].Name                   = "iconbg"
	G2L["iconbg"].BorderSizePixel        = 0
	G2L["iconbg"].BackgroundColor3       = iconBgColor
	G2L["iconbg"].BackgroundTransparency = 0.82
	G2L["iconbg"].Size                   = UDim2.new(0, 30, 0, 30)
	G2L["iconbg"].AnchorPoint            = Vector2.new(0.5, 0.5)
	G2L["iconbg"].Position               = UDim2.new(0, 33, 0.5, 0)

	Instance.new("UICorner", G2L["iconbg"]).CornerRadius = UDim.new(0, 8)

	G2L["4"] = Instance.new("ImageLabel", G2L["2"])
	G2L["4"].BorderSizePixel        = 0
	G2L["4"].BackgroundColor3       = Color3.fromRGB(255, 255, 255)
	G2L["4"].Image                  = icon
	G2L["4"].Size                   = UDim2.new(0, 20, 0, 20)
	G2L["4"].BorderColor3           = Color3.fromRGB(0, 0, 0)
	G2L["4"].BackgroundTransparency = 1
	G2L["4"].AnchorPoint            = Vector2.new(0.5, 0.5)
	G2L["4"].Position               = UDim2.new(0, 33, 0.5, 0)

	G2L["div"] = Instance.new("Frame", G2L["2"])
	G2L["div"].Name                   = "divider"
	G2L["div"].BorderSizePixel        = 0
	G2L["div"].BackgroundColor3       = Color3.fromRGB(255, 255, 255)
	G2L["div"].BackgroundTransparency = 0.85
	G2L["div"].Size                   = UDim2.new(0, 1, 0.55, 0)
	G2L["div"].AnchorPoint            = Vector2.new(0, 0.5)
	G2L["div"].Position               = UDim2.new(0, 54, 0.5, 0)

	G2L["6"] = Instance.new("TextLabel", G2L["2"])
	G2L["6"].TextWrapped            = false
	G2L["6"].BorderSizePixel        = 0
	G2L["6"].TextSize               = 14
	G2L["6"].TextStrokeColor3       = Color3.fromRGB(255, 255, 255)
	G2L["6"].TextScaled             = false
	G2L["6"].BackgroundColor3       = Color3.fromRGB(255, 255, 255)
	G2L["6"].FontFace               = Font.new(
		"rbxasset://fonts/families/Ubuntu.json",
		Enum.FontWeight.Medium,
		Enum.FontStyle.Normal
	)
	G2L["6"].TextColor3             = textColor
	G2L["6"].BackgroundTransparency = 1
	G2L["6"].BorderColor3           = Color3.fromRGB(0, 0, 0)
	G2L["6"].Text                   = tostring(message)
	G2L["6"].TextTransparency       = 1
	G2L["6"].TextXAlignment         = Enum.TextXAlignment.Left
	G2L["6"].Size                   = UDim2.new(1, -68, 1, 0)
	G2L["6"].Position               = UDim2.new(0, 63, 0, 0)

	G2L["7"] = Instance.new("UITextSizeConstraint", G2L["6"])
	G2L["7"].MaxTextSize = 14

	G2L["track"] = Instance.new("Frame", G2L["2"])
	G2L["track"].Name                   = "progresstrack"
	G2L["track"].BorderSizePixel        = 0
	G2L["track"].BackgroundColor3       = accentColor
	G2L["track"].BackgroundTransparency = 1
	G2L["track"].Size                   = UDim2.new(1, 0, 0, 2)
	G2L["track"].AnchorPoint            = Vector2.new(0, 1)
	G2L["track"].Position               = UDim2.new(0, 0, 1, 0)

	G2L["prog"] = Instance.new("Frame", G2L["track"])
	G2L["prog"].Name             = "progressfill"
	G2L["prog"].BorderSizePixel  = 0
	G2L["prog"].BackgroundColor3 = accentColor
	G2L["prog"].Size             = UDim2.new(1, 0, 1, 0)

	G2L["9"] = Instance.new("UIListLayout", G2L["1"])
	G2L["9"].HorizontalAlignment = Enum.HorizontalAlignment.Center
	G2L["9"].Padding             = UDim.new(0, 2)
	G2L["9"].SortOrder           = Enum.SortOrder.LayoutOrder
	G2L["9"].ItemLineAlignment   = Enum.ItemLineAlignment.Center

	G2L["a"] = Instance.new("UIPadding", G2L["1"])
	G2L["a"].PaddingTop = UDim.new(0, 10)

	local function tween(obj, info, goal)
		local t = TweenService:Create(obj, info, goal)
		t:Play()
		t.Completed:Wait()
	end

	tween(
		G2L["2"],
		TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
		{ Position = UDim2.new(0.5, 0, 0, TOP_OFFSET) }
	)

	tween(
		G2L["2"],
		TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out),
		{ Size = UDim2.new(0, FULL_WIDTH, 0, BAR_HEIGHT) }
	)

	tween(
		G2L["6"],
		TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out),
		{ TextTransparency = 0 }
	)

	G2L["track"].BackgroundTransparency = 0

	TweenService:Create(
		G2L["prog"],
		TweenInfo.new(holdDuration, Enum.EasingStyle.Linear),
		{ Size = UDim2.new(0, 0, 1, 0) }
	):Play()

	task.wait(holdDuration)

	tween(
		G2L["6"],
		TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.In),
		{ TextTransparency = 1 }
	)

	G2L["track"].BackgroundTransparency = 1

	tween(
		G2L["2"],
		TweenInfo.new(0.5, Enum.EasingStyle.Quint, Enum.EasingDirection.In),
		{ Size = UDim2.new(0, SMALL_WIDTH, 0, BAR_HEIGHT) }
	)

	tween(
		G2L["2"],
		TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In),
		{ Position = UDim2.new(0.5, 0, 0, -BAR_HEIGHT - 4) }
	)

	if G2L["sound"] then
		pcall(function()
			G2L["sound"]:Stop()
			G2L["sound"]:Destroy()
		end)
	end

	G2L["1"]:Destroy()
end)

local queue   = {}
local running = false

local notify = C(function(message, opts)
	table.insert(queue, { message, opts })

	if not running then
		running = true

		task.spawn(function()
			while #queue > 0 do
				local args = table.remove(queue, 1)

				showNotification(args[1], args[2])

				task.wait(0.15)
			end

			running = false
		end)
	end
end)

return notify
