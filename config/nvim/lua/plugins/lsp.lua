return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		vim.diagnostic.config({
			virtual_text = true,
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local map = function(key, fn, desc)
					vim.keymap.set("n", key, fn, { buffer = args.buf, desc = desc })
				end
				map("gd", vim.lsp.buf.definition, "Go to definition")
				map("gD", vim.lsp.buf.type_definition, "Go to type definition")
			end,
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("gopls")
		vim.lsp.enable("bashls")
		vim.lsp.enable("ts_ls")
	end,
}
