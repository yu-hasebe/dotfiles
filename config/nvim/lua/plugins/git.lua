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
		init = function()
			vim.cmd("cnoreabbrev gd DiffviewOpen")
			vim.cmd("cnoreabbrev gD DiffviewClose")
			vim.cmd("cnoreabbrev gdp Gdp")

			vim.api.nvim_create_user_command("Gdp", function(opts)
				local pr_num = opts.args
				local gh_cmd = "gh pr view"
					.. (pr_num ~= "" and (" " .. pr_num) or "")
					.. ' --json baseRefName,headRefName --jq \'"origin/" + .baseRefName + "...origin/" + .headRefName\''
				local range = vim.fn.trim(vim.fn.system(gh_cmd))
				if vim.v.shell_error ~= 0 then
					vim.notify("gdp: " .. range, vim.log.levels.ERROR)
					return
				end
				vim.cmd("DiffviewOpen " .. range)
			end, { nargs = "?" })
		end,
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
