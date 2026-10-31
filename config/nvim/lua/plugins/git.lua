return {
	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		init = function()
			vim.api.nvim_create_user_command("Gd", "DiffviewOpen", {})
			vim.api.nvim_create_user_command("GD", function()
				require("gitsigns").reset_base(true)
				vim.cmd("DiffviewClose")
			end, {})
			vim.api.nvim_create_user_command("Gdp", function(opts)
				local pr_num = opts.args
				local gh_cmd = "gh pr view"
					.. (pr_num ~= "" and (" " .. pr_num) or "")
					.. ' --json baseRefName,headRefName --jq \'"origin/" + .baseRefName + "...origin/" + .headRefName\''
				local range = vim.fn.trim(vim.fn.system(gh_cmd))
				if vim.v.shell_error ~= 0 then
					vim.notify("Gdp: " .. range, vim.log.levels.ERROR)
					return
				end
				local base = range:match("^(.-)%.%.%.")
				if base then
					require("gitsigns").change_base(base, true)
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
