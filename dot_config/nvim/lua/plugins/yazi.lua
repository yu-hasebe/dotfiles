---@type LazySpec
return {
	"mikavilpas/yazi.nvim",
	version = "*",
	event = "VeryLazy",
	keys = {
		{
			"-",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	---@type YaziConfig | {}
	opts = {
		open_for_directories = false,
		keymaps = {
			show_help = "<f1>",
		},
	},
	init = function()
		vim.g.loaded_netrwPlugin = 1
	end,
}
