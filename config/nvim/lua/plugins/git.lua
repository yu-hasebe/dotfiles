return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen origin/main...HEAD<cr>", desc = "Diff vs main" },
			{ "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "Close diffview" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "File history" },
		},
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = { "<leader>gg" },
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

			vim.keymap.set("n", "<leader>gg", function()
				lazygit:toggle()
			end, { desc = "lazygit" })
		end,
	},
}
