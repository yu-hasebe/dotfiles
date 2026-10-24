local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	{ family = "HackGen35 Console NF", style = "Italic" },
	{ family = "Hack Nerd Font Mono" },
})

config.font_size = 14

config.color_schemes = {
	["ENDESGA32"] = {
		background = "#181425",
		foreground = "#ead4aa",

		cursor_bg = "#feae34",

		ansi = {
			"#262b44", -- black
			"#a22633", -- red
			"#265c42", -- green
			"#feae34", -- yellow
			"#124e89", -- blue
			"#6b3fa0", -- magenta
			"#193c3e", -- cyan
			"#c0cbdc", -- white
		},
		brights = {
			"#5a6988", -- bright black
			"#e43b44", -- bright red
			"#63c74d", -- bright green
			"#fee761", -- bright yellow
			"#0099db", -- bright blue
			"#b55088", -- bright magenta
			"#2ce8f5", -- bright cyan
			"#ffffff", -- bright white
		},
	},
}

config.color_scheme = "ENDESGA32"

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500
config.animation_fps = 10

config.enable_tab_bar = false
config.keys = {
	{ key = "t", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
	{ key = "t", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "Tab", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
	{ key = "Tab", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
	{ key = "w", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
	{ key = '"', mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
	{ key = "%", mods = "CMD", action = wezterm.action.DisableDefaultAssignment },
}

return config
