return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = { "<leader>gg", "<leader>tt" },
		config = function()
			require("toggleterm").setup()

			local Terminal = require("toggleterm.terminal").Terminal
			local lazygit = Terminal:new({
				cmd = "lazygit",
				hidden = true,
				direction = "float",
				float_opts = { border = "rounded" },
				on_open = function(term)
					vim.keymap.set("t", "q", "<cmd>close<cr>", { buffer = term.bufnr })
				end,
			})

			local tftui = Terminal:new({
				cmd = "tftui",
				hidden = true,
				direction = "float",
				float_opts = { border = "rounded" },
				on_open = function(term)
					vim.keymap.set("t", "q", "<cmd>close<cr>", { buffer = term.bufnr })
				end,
			})

			vim.keymap.set("n", "<leader>gg", function()
				lazygit:toggle()
			end, { desc = "lazygit" })

			vim.keymap.set("n", "<leader>tt", function()
				tftui:toggle()
			end, { desc = "tftui" })
		end,
	},
}
