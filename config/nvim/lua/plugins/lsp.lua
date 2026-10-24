return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.diagnostic.config({
			virtual_text = true,
		})
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("gopls")
	end,
}
