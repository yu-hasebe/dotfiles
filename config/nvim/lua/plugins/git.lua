return {
	{
		"lewis6991/gitsigns.nvim",
		opts = function(_, opts)
			opts.on_attach = function(bufnr)
				local gs = require("gitsigns")
				local map = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
				end
				map("]c", function()
					if vim.wo.diff then vim.cmd.normal({ "]c", bang = true })
					else gs.next_hunk() end
				end, "Next hunk")
				map("[c", function()
					if vim.wo.diff then vim.cmd.normal({ "[c", bang = true })
					else gs.prev_hunk() end
				end, "Prev hunk")
				map("<leader>hd", function()
					gs.diffthis(nil, { unified = true })
				end, "Diff this (unified)")
			end
			return opts
		end,
	},

	{
		"sindrets/diffview.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
		init = function()
			local review_bufs = {}

			local function enable_review(base)
				vim.g.review_mode = true
				if base then
					require("gitsigns").change_base(base, true)
				end
				vim.api.nvim_create_augroup("ReviewDiffthis", { clear = true })
				vim.api.nvim_create_autocmd("BufWinEnter", {
					group = "ReviewDiffthis",
					callback = function()
						local bufnr = vim.api.nvim_get_current_buf()
						if vim.bo[bufnr].buftype ~= "" then return end
						if review_bufs[bufnr] then return end
						review_bufs[bufnr] = true
						vim.defer_fn(function()
							if not vim.g.review_mode then return end
							if not vim.api.nvim_buf_is_valid(bufnr) then return end
							local ok, gs = pcall(require, "gitsigns")
							if ok then
								gs.diffthis(nil, { unified = true })
							end
						end, 200)
					end,
				})
			end

			local function disable_review()
				vim.g.review_mode = false
				require("gitsigns").reset_base(true)
				pcall(vim.api.nvim_clear_autocmds, { group = "ReviewDiffthis" })
				review_bufs = {}
				vim.cmd("DiffviewClose")
			end

			vim.api.nvim_create_user_command("Gd", function()
				enable_review(nil)
				vim.cmd("DiffviewOpen")
			end, {})

			vim.api.nvim_create_user_command("GD", function()
				disable_review()
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
				enable_review(base)
				vim.cmd("DiffviewOpen " .. range)
			end, { nargs = "?" })
		end,
	},
}
