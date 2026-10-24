vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

require("config.lazy")

dofile(vim.g.base46_cache .. "defaults")
require("nvchad.options")
require("nvchad.autocmds")
vim.schedule(function()
	require("nvchad.mappings")
end)
