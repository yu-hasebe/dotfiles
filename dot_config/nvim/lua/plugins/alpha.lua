return {
	{
		"goolord/alpha-nvim",
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐",
				"✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨",
				"",
				"        ███╗   ██╗██╗   ██╗██╗███╗   ███╗        ",
				"        ████╗  ██║██║   ██║██║████╗ ████║        ",
				"        ██╔██╗ ██║██║   ██║██║██╔████╔██║        ",
				"        ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║        ",
				"        ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║        ",
				"        ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝        ",
				"",
				"✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨",
				"⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐  ✨  ⭐",
			}

			dashboard.section.buttons.val = {
				dashboard.button("e", "🪄   START GAME",  ":ene <BAR> startinsert<CR>"),
				dashboard.button("r", "💎   LOAD GAME",   ":browse oldfiles<CR>"),
				dashboard.button("q", "🌙   EXIT",        ":qa<CR>"),
			}

			dashboard.section.footer.val = "▶  PRESS START"

			alpha.setup(dashboard.opts)
		end,
	},
}
