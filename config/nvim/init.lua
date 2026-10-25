vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46/"

-- mise activate zsh only applies to interactive shells, so Neovim subprocesses (sh) cannot
-- find mise-managed tools. Prepending the shims directory to PATH fixes this.
vim.env.PATH = vim.fn.expand("~/.local/share/mise/shims") .. ":" .. vim.env.PATH

require("config.lazy")

dofile(vim.g.base46_cache .. "defaults")
require("nvchad.options")
require("nvchad.autocmds")
vim.schedule(function()
	require("nvchad.mappings")
end)
