return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns
				local map = function(mode, lhs, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
				end

				map("n", "]c", gs.next_hunk)
				map("n", "[c", gs.prev_hunk)
				map("n", "<leader>hs", gs.stage_hunk)
				map("n", "<leader>hr", gs.reset_hunk)
				map("n", "<leader>hp", gs.preview_hunk)
				map("n", "<leader>gb", gs.blame_line)
			end,
		},
	},

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
