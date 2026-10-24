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
		foreground = "#EAD4AA",

		cursor_bg = "#FEAE34",

		ansi = {
			"#3A4466", -- black
			"#E43B44", -- red
			"#3E8948", -- green
			"#FEE761", -- yellow
			"#0099DB", -- blue
			"#B55088", -- magenta
			"#2CE8F5", -- cyan
			"#FFFFFF", -- white
		},
		brights = {
			"#8B9BB4", -- bright black
			"#FF0044", -- bright red
			"#63C74D", -- bright green
			"#FEE761", -- bright yellow
			"#0099DB", -- bright blue
			"#F6757A", -- bright magenta
			"#2CE8F5", -- bright cyan
			"#FFFFFF", -- bright white
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
