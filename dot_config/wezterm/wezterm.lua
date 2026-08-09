local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({
	"x14y24pxHeadUpDaisy",
	"Symbols Nerd Font Mono",
})

config.allow_square_glyphs_to_overflow_width = "Always"
config.font_size = 16

config.color_schemes = {
	["HatsuneMiku"] = {
		foreground = "#dcd7d7",
		background = "#242829",

		cursor_bg = "#7b8b99",
		cursor_border = "#7b8b99",
		cursor_fg = "#242829",

		selection_bg = "#4d4d43",
		selection_fg = "#dcd7d7",

		ansi = {
			"#242829",
			"#df2683",
			"#13868c",
			"#fcfcdf",
			"#1a86b9",
			"#bc7fd2",
			"#7cc7d6",
			"#4a4b4b",
		},
		brights = {
			"#7b8b99",
			"#df2683",
			"#13868c",
			"#fcfcdf",
			"#1a86b9",
			"#bc7fd2",
			"#7cc7d6",
			"#dcd7d7",
		},
	},
}

config.color_scheme = "HatsuneMiku"

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 500

config.window_decorations = "INTEGRATED_BUTTONS"
config.window_padding = {
	left = 12,
	right = 12,
	top = 12,
	bottom = 12,
}

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
