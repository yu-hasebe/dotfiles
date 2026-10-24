return {
	"nvim-lualine/lualine.nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local c = {
			bg = "#181425",
			white = "#FFFFFF",
			fg = "#EAD4AA",
		}

		local function seg(bg, fg, bold)
			return { bg = bg, fg = fg, gui = bold and "bold" or nil }
		end

		local base = {
			a = seg("#BE4A2F", c.white, true),
			b = seg("#733E39", c.white),
			c = seg(c.bg, c.fg),
			x = seg(c.bg, c.fg),
			y = seg("#3E2731", c.white),
			z = seg("#733E39", c.white),
		}

		local theme = {
			normal = base,
			insert = { a = seg("#265C42", c.white, true) },
			visual = { a = seg("#68386C", c.white, true) },
			replace = { a = seg("#A22633", c.white, true) },
			command = { a = seg("#3A4466", c.white, true) },
			terminal = { a = seg("#193C3E", c.white, true) },
			inactive = {
				c = seg(c.bg, c.fg),
				x = seg(c.bg, c.fg),
			},
		}

		require("lualine").setup({
			options = {
				theme = theme,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				globalstatus = true,
				disabled_filetypes = { statusline = { "NvimTree", "lazy", "mason" } },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = {
					{
						"filename",
						icon = "",
						path = 1,
						symbols = { modified = "", readonly = "󰌾", unnamed = "[No Name]" },
					},
				},
				lualine_c = {
					{ "branch", icon = "" },
					{ "diff", symbols = { added = "+", modified = "~", removed = "-" } },
				},
				lualine_x = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", hint = " ", info = " " },
					},
				},
				lualine_y = { "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
