local background = require("utils.background")
local helpers = require("utils.helpers")
local wezterm = require("wezterm")
local assets = wezterm.config_dir .. "/assets"

-- This will hold the configuration.
local config = wezterm.config_builder()

wezterm.on("gui-startup", function()
	local tab, pane, window = westerm.mux.spawn_window({})
	window:gui_window():maximize()
end)

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = "Tokyo Night"
config.font_size = 15
-- config.font_size = 25
-- config.font = wezterm.font("GeistMono Nerd Font")
-- config.font = wezterm.font("SpaceMono Nerd Font")
-- config.font = wezterm.font 'Fira Code'
-- config.font = wezterm.font("Departure Mono")
config.max_fps = 240

config.enable_tab_bar = false
config.native_macos_fullscreen_mode = true

config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}
config.window_background_opacity = 0.9
config.macos_window_background_blur = 12
config.background = {
	background.get_background(),
	background.get_animation(assets .. "/blob_blue_slow.gif"),
}
-- config.background = {
-- 	{
-- 		source = { File = { path = "/Users/ericluna/Downloads/image.png" } },
-- 		height = "Cover",
-- 		width = "Cover",
-- 		horizontal_align = "Left",
-- 		repeat_x = "Repeat",
-- 		repeat_y = "Repeat",
-- 		opacity = 1,
-- 	},
-- 	{
-- 		source = { Color = "#000000" },
-- 		height = "100%",
-- 		width = "100%",
-- 		opacity = 0.9,
-- 	},
-- }
config.leader = { key = " ", mods = "CMD|ALT", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- { key = "k", mods = "SHIFT", action = wezterm.action.ScrollByPage(-1) },
	-- { key = "k", mods = "CMD", action = wezterm.action.ActivateTabRelative(-1) },
	-- { key = "k", mods = "CTRL", action = wezterm.action.MoveTabRelative(-1) },
	-- { key = "j", mods = "SHIFT", action = wezterm.action.ScrollByPage(1) },
	-- { key = "j", mods = "CMD", action = wezterm.action.ActivateTabRelative(1) },
	-- { key = "j", mods = "CTRL", action = wezterm.action.MoveTabRelative(1) },
	-- { key = "h", mods = "SHIFT|ALT|CTRL", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
	-- { key = "l", mods = "SHIFT|ALT|CTRL", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
	-- { key = "k", mods = "SHIFT|ALT|CTRL", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
	-- { key = "j", mods = "SHIFT|ALT|CTRL", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
	-- { key = "h", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Left") },
	-- { key = "l", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Right") },
	-- { key = "k", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	-- { key = "j", mods = "CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "Y",
		mods = "CTRL|SHIFT",
		action = wezterm.action.EmitEvent("toggle-youtube-mode"),
	},
}

wezterm.on("toggle-youtube-mode", function(window, pane)
	is_youtube_mode = not is_youtube_mode -- Toggle the mode
	local overrides = {}

	if is_youtube_mode then
		overrides.font_size = 25 -- Larger font size for YouTube Mode
	-- overrides.window_background_opacity = 0.9 -- Optional: Adjust opacity
	else
		overrides.font_size = 15 -- Reset to default
		-- overrides.window_background_opacity = nil -- Reset to default
	end

	-- Apply the configuration overrides
	window:set_config_overrides(overrides)
end)

return config
