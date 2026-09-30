return {
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			require("oil").setup()
			vim.keymap.set("n", "-", function()
				vim.cmd("leftabove vsplit")
				vim.cmd("vertical resize " .. math.floor(vim.o.columns / 4))
				require("oil").open()
			end, { desc = "Open parent directory" })
		end,
	},
}
